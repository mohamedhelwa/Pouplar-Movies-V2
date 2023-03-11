part of 'MainDataImports.dart';

class MainData {
  static ThemeData defaultThem = ThemeData(
    focusColor: MyColors.primary,
    primaryColor: MyColors.primary,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: MyColors.primary),
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: TextTheme(
      titleMedium: TextStyle(fontFamily: GoogleFonts.cairo().fontFamily),
    ),
  );
}
