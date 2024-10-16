import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class MyServices {
  static final MyServices _instance = MyServices._internal();
  late SharedPreferences sharedPreferences;

  // Private constructor
  MyServices._internal();

  // Factory constructor to return the same instance
  factory MyServices() {
    return _instance;
  }

  // Initialization method
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
