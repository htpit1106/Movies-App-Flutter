class AppConfigs {
  AppConfigs._();
  static const appName = "Movies App";

  //rating format
  static String formatRating(double rating) {
    return rating.toStringAsFixed(1);
  }

  static String getYear(String date) {
    return date.substring(0, 4);
  }
}

class MovieAPIConfig {
  static const String apiKey = '6bab1fbfc70018158386a447060ac385';
}
