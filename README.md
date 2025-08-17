📖 Plagiarism Detector App

A Flutter-based plagiarism detection application that identifies literal text plagiarism using the KMP (Knuth-Morris-Pratt) algorithm. The backend is powered by a Flask (Python) API, enabling fast text analysis and seamless integration with the app. The app is designed with a clean UI, Firebase authentication, and dark/light mode support to provide an intuitive and modern experience.

🚀 Features

Plagiarism Detection
- Uses KMP algorithm for efficient literal text matching.
- Highlights plagiarized content within the text.
- Displays plagiarism percentage and matched sources.

Authentication
- Secure Sign-In / Sign-Up with Firebase Authentication.
- Persistent login session.

UI/UX Enhancements
- Welcome Screen to greet users.
- Onboarding Screen (shown only on first installation).
- Splash Screen before app launch.
- Clean Input UI for text submission.
- Analysis Result Screen with plagiarism highlights.
- Dark & Light Mode support.

Backend API (Flask)
- Exposes REST endpoints for plagiarism detection.
- Processes text against stored reference materials.
- Returns JSON response with plagiarism details.

🛠️ Tech Stack
Frontend (Flutter)
- Flutter & Dart
- GetX (for state management & navigation)
- Firebase Authentication
- Dynamic theming (Light & Dark modes)

Backend (Flask - Python)
- Flask (REST API)
- Text preprocessing & string matching
- KMP Algorithm for plagiarism detection

📱 App Flow
- Splash Screen →
- Onboarding Screen (first launch only) →
- Welcome Screen →
- Sign-In / Sign-Up (Firebase) →
- Home Screen (enter text to check plagiarism) →
- Analysis Screen (results with highlights & percentage).

📂 Project Structure
PlagiarismDetectorApp/
│── lib/
│   ├── main.dart
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── onboarding_screen.dart
│   │   ├── welcome_screen.dart
│   │   ├── signin_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── home_screen.dart
│   │   └── result_screen.dart
│   ├── controllers/
│   ├── models/
│   └── widgets/
│
│── backend/
│   ├── server.py       # Flask server
│   ├── reference_texts # Folder containing source documents
│   └── utils.py        # KMP algorithm & preprocessing
│
│── README.md
│── pubspec.yaml
│── requirements.txt

⚡ Getting Started

Prerequisites:
- Flutter SDK installed
- Firebase project configured
- Python 3.8+
- Flask installed (pip install flask)

Backend Setup:
cd backend
pip install -r requirements.txt
python server.py

Flutter Setup:
cd plagiarism_detector_app
flutter pub get
flutter run
