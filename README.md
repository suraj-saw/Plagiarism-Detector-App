#  Plagiarism Detector App

A cross-platform mobile application built with **Flutter** that detects plagiarism in text by comparing it against a database of reference documents. Simply paste your text, tap check, and instantly see your plagiarism score with matched sources.

---

##  Screenshots

| Home Screen | Results – High Plagiarism | Results – Original |
|---|---|---|
| *c:\Users\Suraj Kumar Saw\OneDrive\Pictures\Screenshots\Screenshot 2026-06-02 103835.png* | ![High Plagiarism](c:\users\suraj kumar saw\OneDrive\Pictures\Screenshots\Screenshot 2026-06-02 100657.png) | ![Original](c:\users\suraj kumar saw\OneDrive\Pictures\Screenshots\Screenshot 2026-06-02 100715.png) |

---

##  Features

-  Paste any text and check for plagiarism instantly
-  Visual circular progress indicator showing plagiarism percentage
-  Color-coded results — Green (Original), Orange (Moderate), Red (High)
-  View matched source links directly
-  See exactly which phrase was matched
-  Clean dark UI

---

##  How It Works

```
User pastes text in app
        ↓
App sends POST request to Plagiarism API
        ↓
API tokenizes → stems → trigram matches via KMP
        ↓
Returns plagiarism % + matched sources
        ↓
App displays results with color coding
```

---

##  Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| Language | Dart |
| State Management | GetX |
| HTTP Client | http package |
| Backend | Plagiarism Detection API (Node.js + Vercel) |

---

##  Project Structure

```
plagiarism_detector_app/
├── lib/
│   ├── main.dart                  # App entry point
│   ├── controllers/               # GetX controllers
│   ├── views/
│   │   ├── home_screen.dart       # Text input screen
│   │   └── result_screen.dart     # Results display screen
│   └── models/                    # Data models
├── assets/                        # Images, fonts
├── pubspec.yaml
└── README.md
```

---

##  Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) 3.7.2 or above
- Android Studio / VS Code with Flutter extension
- A running instance of the [Plagiarism Detection API](https://github.com/your-username/plagiarism-api)

---

### Step 1 — Clone the Repository

```bash
git clone https://github.com/your-username/plagiarism_detector_app.git
cd plagiarism_detector_app
```

---

### Step 2 — Install Dependencies

```bash
flutter pub get
```

---

### Step 3 — Configure the API URL

Find the API base URL in your code (likely in a constants file or controller) and replace it with your deployed Vercel API URL:

```dart
const String baseUrl = 'https://your-api-name.vercel.app';
```

> If running the API locally, use `http://10.0.2.2:5000` for Android emulator or `http://localhost:5000` for iOS simulator.

---

### Step 4 — Run the App

```bash
# For Android
flutter run

# For a specific device
flutter devices          # list connected devices
flutter run -d device_id
```

---

### Step 5 — Build for Release

**Android APK:**
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

**Android App Bundle (for Play Store):**
```bash
flutter build appbundle --release
```

---

## 🎮 How to Use the App

### 1. Enter Your Text
Paste or type the text you want to check on the home screen.

### 2. Tap "Check Plagiarism"
The app sends your text to the detection API.

### 3. View Your Results

Results are color-coded:

| Score | Label | Color |
|---|---|---|
| 0% – 20% | Mostly Original ✅ | Green |
| 21% – 50% | Moderate Plagiarism ⚠️ | Orange |
| 51% – 100% | High Plagiarism ❌ | Red |

### 4. Review Matched Sources
Each matched source shows:
- The exact trigram phrase that was matched
- A snippet from the reference document
- A **View Source** link to the original document

---

##  Testing the App

Use these sample texts to verify the app is working correctly after setup:

**Should show High Plagiarism (~80%):**
> Artificial intelligence (AI) is intelligence demonstrated by machines, as opposed to the natural intelligence displayed by animals including humans. AI research has been defined as the field of study of intelligent agents, which refers to any system that perceives its environment and takes actions that maximize its chance of achieving its goals.

**Should show 0% (Original):**
> My grandmother makes the best mango pickle in the entire neighborhood. She has been using the same recipe for over forty years and refuses to write it down.

---

##  Troubleshooting

| Problem | Solution |
|---|---|
| App shows 0% for everything | Check that your API URL is correct and the Supabase DB has reference texts loaded |
| Cannot connect to API | Ensure the Vercel deployment is live — visit your API URL in a browser |
| Flutter build errors | Run `flutter clean` then `flutter pub get` |
| Android emulator can't reach localhost | Use `10.0.2.2` instead of `localhost` in the API URL |

---

##  Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.7.2          # State management
  http: ^1.5.0         # API calls
  url_launcher: ^6.3.2 # Open source links in browser
  cupertino_icons: ^1.0.8
```

---

##  Related Repository

This app requires the backend API to be running:

 **[Plagiarism Detection API](https://github.com/your-username/plagiarism-api)** — Node.js + Express + Supabase + Vercel

---

##  License

MIT — free to use, modify, and distribute.
