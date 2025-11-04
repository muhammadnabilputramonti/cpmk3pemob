import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Color primaryNavy = const Color(0xFF002A45); 
  final Color accentMustard = const Color(0xFFFFD358);
  final Color darkCharcoal = const Color(0xFF1A202C); 
  final Color backgroundWhite = const Color(0xFFF0F2F5);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Sosial Media GetX",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryNavy,
        colorScheme: ColorScheme.light(
          primary: primaryNavy,
          secondary: accentMustard,
          surface: Colors.white, 
          background: backgroundWhite,
          onPrimary: Colors.white, 
          onSecondary: darkCharcoal, 
          onSurface: darkCharcoal,
          onBackground: darkCharcoal,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: backgroundWhite, 
        
        appBarTheme: AppBarTheme(
          backgroundColor: primaryNavy, 
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: darkCharcoal),
          labelLarge: TextStyle(color: darkCharcoal),
          titleLarge: TextStyle(color: darkCharcoal, fontWeight: FontWeight.bold),
        ),
        
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: accentMustard, width: 2.0), 
          ),
          labelStyle: TextStyle(color: darkCharcoal.withOpacity(0.6)),
          hintStyle: TextStyle(color: Colors.grey.shade400),
          contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
        ),
      ),
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
