import 'package:bee_ui/helper/helper.dart';

extension ExtNum on num {
  double w() {
    return percent(Screen.w());
  }

  double h() {
    return percent(Screen.h());
  }

  double percent(num from) {
    return (this / 100) * from;
  }

  double from(num value) {
    return percent(value);
  }
}
