import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:toleg/screens/home_screen.dart";
import "package:toleg/utils/text_styles.dart";
import 'constants/colors.dart'; // AppColors sabitleri için

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .copyWith(textScaleFactor: 1.0),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.darkBackgraund, // Genel arka plan rengi
          appBarTheme: AppBarTheme(
            toolbarHeight: 70,
            backgroundColor: AppColors.darkCard,
            titleTextStyle: AppTextStyles.appBarStyle,
            actionsIconTheme: IconThemeData(
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
