import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  ThemeData get light => lightTheme(ThemeData.light().textTheme);

  ThemeData get dark => darkTheme(ThemeData.dark().textTheme);

  static lightTheme(TextTheme textTheme) => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyLarge: GoogleFonts.lato(
            textStyle: textTheme.bodyLarge,
          ),
          bodyMedium: GoogleFonts.lato(
            textStyle: textTheme.bodyMedium,
          ),
          labelLarge: GoogleFonts.lato(
            textStyle: textTheme.labelLarge,
          ),
          bodySmall: GoogleFonts.lato(
            textStyle: textTheme.bodySmall,
          ),
          displayLarge: GoogleFonts.lato(
            textStyle: textTheme.displayLarge,
          ),
          displayMedium: GoogleFonts.lato(
            textStyle: textTheme.displayMedium,
          ),
          displaySmall: GoogleFonts.lato(
            textStyle: textTheme.displaySmall,
          ),
          headlineMedium: GoogleFonts.lato(
            textStyle: textTheme.headlineMedium,
          ),
          headlineSmall: GoogleFonts.lato(
            textStyle: textTheme.headlineSmall,
          ),
          titleLarge: GoogleFonts.lato(
            textStyle: textTheme.titleLarge,
          ),
          labelSmall: GoogleFonts.lato(
            textStyle: textTheme.labelSmall,
          ),
          titleMedium: GoogleFonts.lato(
            textStyle: textTheme.titleMedium,
          ),
          titleSmall: GoogleFonts.lato(
            textStyle: textTheme.titleSmall,
          ),
        ),
      );

  static ThemeData darkTheme(TextTheme textTheme) => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: ColorSwatch(
          0xFFE65100,
          {
            100: Colors.yellowAccent.shade100,
            200: Colors.yellowAccent.shade200,
            400: Colors.yellowAccent.shade400,
            700: Colors.yellowAccent.shade700,
          },
        ),
        // Google Text Theme monospace
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyLarge: GoogleFonts.lato(
            textStyle: textTheme.bodyLarge,
          ),
          bodyMedium: GoogleFonts.lato(
            textStyle: textTheme.bodyMedium,
          ),
          labelLarge: GoogleFonts.lato(
            textStyle: textTheme.labelLarge,
          ),
          bodySmall: GoogleFonts.lato(
            textStyle: textTheme.bodySmall,
          ),
          displayLarge: GoogleFonts.lato(
            textStyle: textTheme.displayLarge,
          ),
          displayMedium: GoogleFonts.lato(
            textStyle: textTheme.displayMedium,
          ),
          displaySmall: GoogleFonts.lato(
            textStyle: textTheme.displaySmall,
          ),
          headlineMedium: GoogleFonts.lato(
            textStyle: textTheme.headlineMedium,
          ),
          headlineSmall: GoogleFonts.lato(
            textStyle: textTheme.headlineSmall,
          ),
          titleLarge: GoogleFonts.lato(
            textStyle: textTheme.titleLarge,
          ),
          labelSmall: GoogleFonts.lato(
            textStyle: textTheme.labelSmall,
          ),
          titleMedium: GoogleFonts.lato(
            textStyle: textTheme.titleMedium,
          ),
          titleSmall: GoogleFonts.lato(
            textStyle: textTheme.titleSmall,
          ),
        ),
      );
}
