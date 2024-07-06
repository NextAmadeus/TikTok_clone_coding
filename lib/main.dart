import 'package:flutter/material.dart';
import 'package:tiktok_clone_second/feature/authentication/sign_up_screen.dart';
import 'package:tiktok_clone_second/feature/inbox/activity_screen.dart';
import "constants/sizes.dart";

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}

//깃허브 저장 명령어

//git add .

//git commit -m "오류 수정: [오류 설명 또는 해결 방법]"

//git push origin main


