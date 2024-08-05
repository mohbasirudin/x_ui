extension ExtNumber on num {
  double from(num value) {
    try {
      return (this / 100) * value;
    } catch (e) {
      return toDouble();
    }
  }

  double scale(num value) {
    try {
      return (this * value).toDouble();
    } catch (e) {
      return toDouble();
    }
  }
}
