import os
import json
from flask_cors import CORS
from flask import Flask, jsonify, request
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from collections import defaultdict

import nltk
nltk.download('punkt')
nltk.download('stopwords')

app = Flask(__name__)
CORS(app)

# Initialize the stopwords and stemmer
stop_words = set(stopwords.words('english'))
stemmer = PorterStemmer()

# Folder paths
REFERENCE_FOLDER = os.path.join(os.getcwd(), 'reference_texts')
metadata_file_path = os.path.join(os.path.dirname(__file__), 'file_metadata', 'metadata.json')

# Load metadata (URLs) from JSON file
def load_metadata(metadata_path):
    with open(metadata_path, 'r', encoding='utf-8') as file:
        data = json.load(file)
        print(f"Loaded metadata: {data}")  # Log loaded metadata for debugging
        return data

metadata = load_metadata(metadata_file_path)

def preprocess_text(text):
    """Preprocess text by tokenizing, removing stopwords, and stemming."""
    tokens = word_tokenize(text)
    tokens = [word.lower() for word in tokens if word.isalnum()]
    tokens = [word for word in tokens if word not in stop_words]
    tokens = [stemmer.stem(word) for word in tokens]
    return tokens

def load_and_preprocess_reference_texts(folder_path):
    """Load reference texts from files and preprocess them."""
    reference_texts = []
    for filename in os.listdir(folder_path):
        if filename.endswith('.txt'):
            file_path = os.path.join(folder_path, filename)
            with open(file_path, 'r', encoding='utf-8') as file:
                text = file.read()
                processed_text = preprocess_text(text)
                reference_texts.append(('reference_texts/' + filename, ' '.join(processed_text)))  # Store as a tuple (filename, processed text)
    return reference_texts

# Build an inverted index for n-grams
def build_inverted_index(reference_texts, n=3):
    """Build an inverted index mapping n-grams to files."""
    inverted_index = defaultdict(list)
    for filename, text in reference_texts:
        tokens = preprocess_text(text)
        ngrams = get_ngrams(tokens, n)
        for i, ngram in enumerate(ngrams):
            inverted_index[ngram].append((filename, i))
    return inverted_index

# Generate n-grams from tokens
def get_ngrams(tokens, n=3):
    """Generate n-grams from the list of tokens."""
    return [' '.join(tokens[i:i+n]) for i in range(len(tokens) - n + 1)]

# Load reference texts, build inverted index, and load metadata
reference_texts = load_and_preprocess_reference_texts(REFERENCE_FOLDER)
inverted_index = build_inverted_index(reference_texts)

@app.route('/preprocess', methods=['POST'])
def preprocess_input_text():
    """Preprocess the input text and return the processed tokens."""
    data = request.get_json()
    user_text = data.get('text', '')
    processed_user_text = preprocess_text(user_text)
    return jsonify({'processed_text': processed_user_text})

@app.route('/check_plagiarism', methods=['POST'])
def check_plagiarism():
    """Check for plagiarism by comparing user input with reference texts."""
    data = request.get_json()
    user_text = data.get('text', '')

    # Preprocess the user's input text
    processed_user_text = preprocess_text(user_text)
    user_ngrams = get_ngrams(processed_user_text, n=3)

    matches = []
    checked_files = set()  # To avoid redundant KMP checks

    # N-Gram Matching: Check user n-grams against inverted index
    for user_ngram in user_ngrams:
        if user_ngram in inverted_index:
            for filename, _ in inverted_index[user_ngram]:
                if filename not in checked_files:
                    # Perform KMP on the full text for precise matching
                    kmp_matches = KMPSearch(get_full_text_from_reference(filename), user_ngram)
                    if kmp_matches:
                        # Fetch the link from metadata file based on the full filename (including path)
                        link = metadata.get(filename, 'No link available')
                        print(f"Link found for {filename}: {link}")  # Debugging log
                        
                        match_info = {
                            'ngram': user_ngram,
                            'reference_snippet': get_full_text_from_reference(filename)[:500],  # Return a snippet
                            'link': link
                        }
                        print(f"Match Info: {match_info}")  # Debugging log
                        matches.append(match_info)
                    checked_files.add(filename)

    plagiarism_detected = len(matches) > 0
    print(f"Plagiarism Detected: {plagiarism_detected}")  # Debugging log

    return jsonify({
        'plagiarism_detected': plagiarism_detected,
        'matches': matches
    })

def get_full_text_from_reference(filename):
    """Get full text of a reference by filename."""
    for ref_filename, ref_text in reference_texts:
        if ref_filename == filename:
            return ref_text
    return ''

# KMP Algorithm Functions
def computeLPSArray(pattern):
    """Compute Longest Prefix Suffix (LPS) array for KMP algorithm."""
    lps = [0] * len(pattern)
    length = 0
    i = 1
    while i < len(pattern):
        if pattern[i] == pattern[length]:
            length += 1
            lps[i] = length
            i += 1
        else:
            if length != 0:
                length = lps[length - 1]
            else:
                lps[i] = 0
                i += 1
    return lps

def KMPSearch(text, pattern):
    """Perform KMP search to find pattern in text."""
    lps = computeLPSArray(pattern)
    matches = []
    i = 0  # index for text
    j = 0  # index for pattern

    while i < len(text):
        if pattern[j] == text[i]:
            i += 1
            j += 1

        if j == len(pattern):
            matches.append(i - j)  # Match found at index (i - j)
            j = lps[j - 1]
        elif i < len(text) and pattern[j] != text[i]:
            if j != 0:
                j = lps[j - 1]
            else:
                i += 1
    return matches

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
