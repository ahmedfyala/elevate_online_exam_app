import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class MyServices {
  static final MyServices _instance = MyServices._internal();
  SharedPreferences? sharedPreferences;

  MyServices._internal() {
    _init();
  }

  factory MyServices() {
    return _instance;
  }

  Future<SharedPreferences> _init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!;
  }

  Future<SharedPreferences> getSharedPreferences() async {
    if (sharedPreferences == null) {
      return await _init();
    }
    return sharedPreferences!;
  }
}
