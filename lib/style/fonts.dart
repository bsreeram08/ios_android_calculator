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
  static final additionalOptions = getAppFont(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );
}

class PrimaryTextFonts {
  static final resultText = getAppFont(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    color: Color(0xffa5a5a5),
  );
  static final panelText = getAppFont(
    fontSize: 58,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );
}
