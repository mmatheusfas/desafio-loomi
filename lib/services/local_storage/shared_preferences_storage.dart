import 'package:loomi_test/services/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements LocalStorage {
  SharedPreferencesStorage();

  @override
  void saveData(String key, String value) async {
    final _sp = await SharedPreferences.getInstance();

    await _sp.setString(key, value);
  }
}
