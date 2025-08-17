import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:plagiarism_app/src/screens/homeScreen/home_screen.dart';
import 'package:plagiarism_app/src/screens/splashScreen/splash_screen.dart';
import 'package:plagiarism_app/src/themes/app_theme.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    try {
      // Firebase initialization with connectivity verification
      if (kIsWeb) {
        await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyD1QuAK2inpkHSKlP69WR-JJ6Hhr9vsI1k',
            authDomain: 'plagiarism-app-6017f.firebaseapp.com',
            projectId: 'plagiarism-app-6017f',
            storageBucket: 'plagiarism-app-6017f.appspot.com',
            messagingSenderId: '587267939106',
            appId: '1:587267939106:web:f0d49f0f3a59c6dcc5e37b',
          ),
        ).then((value) {
          print('Firebase initialized successfully for Web.');
          Get.put(AuthenticationRepository());
        });
      } else {
        await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: Platform.isIOS
                ? 'AIzaSyDeD1yyA8GW9Wd47wDaLoGh3gb2DW8ng94'
                : 'AIzaSyAxGhrKFCteKkx3W6Q9zwSMsz_vw3mbTh0',
            appId: Platform.isIOS
                ? '1:587267939106:ios:26ea2fa73a402d23c5e37b'
                : '1:587267939106:android:082d9c122ff93c29c5e37b',
            messagingSenderId: '587267939106',
            projectId: 'plagiarism-app-6017f',
          ),
        ).then((value) {
          print(
              'Firebase initialized successfully for ${Platform.isIOS ? 'iOS' : 'Android'}.');
          Get.put(AuthenticationRepository());
        });
      }

      // Log the connectivity status
      final connectivityStatus =
          await FirebaseAuth.instance.authStateChanges().first;
      print(connectivityStatus == null
          ? 'No user is logged in. Firebase connection verified.'
          : 'User is already logged in. Firebase connection verified.');

      runApp(const MyApp());
    } catch (error) {
      print('Failed to initialize Firebase: $error');
    }
  }, (error, stackTrace) {
    print('Uncaught error: $error');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightThemeData,
      darkTheme: TAppTheme.darkThemeData,
      themeMode: ThemeMode.light,
      title: "Plagiarism App",
      home: const HomeScreen(),
    );
  }
}
