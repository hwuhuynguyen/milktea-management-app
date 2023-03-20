class FormatValidator {
  String formatPrice(String value) {
    String result = "";
    for (int i = value.length - 1; i >= 0; i -= 3) {
      if (i > 2) {
        for (int j = i; j >= i - 2; j--) {
          result = value[j] + result;
        }
      } else {
        for (int j = i; j >= 0; j--) {
          result = value[j] + result;
        }
      }
      if (i > 2) result = "," + result;
    }
    return result;
  }
}
