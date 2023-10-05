import 'package:desafio/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/src/overlay_state_finder.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'MeuProntuario',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF4E97FE),
            onPrimary: Color(0xFFFFFFFF),
            // secondary: Color(0xFF2A1773),
            // onSecondary: Color(0xFFFFFFFF),
            error: Color(0x66EB5757),
            onError: Color(0x66EB5757),
            // background: Color(0xFFF3F2F3),
            // onBackground: Color(0xFFF3F2F3),
            // surface: Color(0xFFFFFFFF),
            // onSurface: Color(0xFFA4AAB4),
          ),
          fontFamily: 'Open Sans',
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              color: Color(0xFF1A1C1E),
              fontSize: 22.60,
              fontWeight: FontWeight.w700,
            ),
            headlineMedium: TextStyle(
              color: Color(0xFF001B3D),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            titleLarge: TextStyle(
              color: Color(0xFF202020),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            titleMedium: TextStyle(
              color: Color(0xFF1A1C1E),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            titleSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF909094),
            ),
            bodyLarge: TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            // bodyMedium: TextStyle(
            //   color: Color(0xFF4F4F4F),
            //   fontSize: 16,
            //   fontWeight: FontWeight.w400,
            // ),
            // bodySmall: TextStyle(
            //   color: Color(0xFF4F4F4F),
            //   fontSize: 14,
            //   fontWeight: FontWeight.w400,
            // ),
            // labelSmall: TextStyle(
            //   fontSize: 14,
            //   color: Color(0xFF4F4F4F),
            //   fontWeight: FontWeight.w400,
            // ),
          ),
        ),
        home: const HomePageScreen(),
        routes: {
          HomePageScreen.routeName: (ctx) => const HomePageScreen(),
        },
      ),
    );
  }
}
