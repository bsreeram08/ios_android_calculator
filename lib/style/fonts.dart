part of styles;

TextStyle getAppFont({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

class PrimaryButtonFonts {
  static final primaryWhite = getAppFont(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static final primaryBlack = getAppFont(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
