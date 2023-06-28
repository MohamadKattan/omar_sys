import 'package:hive/hive.dart';

final dataBase = DataBase();

class DataBase {
  var box = Hive.openBox('AppDataBase');

  // ----------------- Token -----------------//
  get getToken => localDataBase.read('token');

  set saveToken(String value) {
    localDataBase.put('token', value);
  }

  //=======Admin set / get val from locale =====

  get getAdminName => localDataBase.read('admin');

  set saveAccseseAdmin(String val) {
    localDataBase.put('admin', val);
  }

  // ----------------- Dark Mood -----------------//

  get getDarkMood => localDataBase.read('darkMood');

  set saveDarkMood(String value) {
    localDataBase.put('darkMood', value);
  }

  // ----------------- Theme Mood -----------------//

  get getThemeMood => localDataBase.read('themeMood');

  set saveThemeMood(dynamic value) {
    localDataBase.put('themeMood', value);
  }

  // ----------------- Language Code -----------------//

  get getLanguageCode => localDataBase.read('languageCode');

  set saveLanguageCode(String value) {
    localDataBase.put('languageCode', value);
  }

  get getCountryCode => localDataBase.read('countryCode');

  set saveCountryCode(String value) {
    localDataBase.put('countryCode', value);
  }

  // ----------------- Currency -----------------//

  get getCurrency => localDataBase.read('currency');

  set saveCurrency(String value) {
    localDataBase.put('currency', value);
  }
}

class LocalDataBase {
  var box = Hive.box('AppDataBase');

  // ----------------- Read Function -----------------//

  read(key) {
    var value = box.get(key);
    return value;
  }
  // ----------------- Put Function -----------------//

  put(key, value) {
    box.put(key, value);
  }
  // ----------------- Delete Function -----------------//

  delete(key) {
    box.delete(key);
  }
  // ----------------- Make value null Function -----------------//

  makeNull(key) {
    box.put(key, null);
  }
}

final localDataBase = LocalDataBase();
