import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/models/timeofday.g.dart';
import 'package:school_planner/models/user.dart';
import 'package:school_planner/models/weekday.dart';

class LocalDatabase {
  static Future<void> initDb() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(SubjectAdapter());
    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(WeekDayAdapter());
    Hive.registerAdapter(TimeOfDayAdapter());
  }

  Future<Box<User>> getUserBox(String boxName) async {
    return Hive.isBoxOpen(boxName)
        ? Hive.box<User>(boxName)
        : await Hive.openBox<User>(boxName);
  }

  Future<void> saveUser(String key, User user) async {
    Box<User> box = await this.getUserBox('User');

    await box.put(key, user);
  }

  Future<User> getUser(String key) async {
    if (await this.isUSerCreated(key)) {
      Box<User> box = await this.getUserBox('User');

      User? getUser = await box.get(key);

      if (getUser != null) return getUser;
    }
    return new User(name: 'Thiago');
  }

  Future<bool> isUSerCreated(String key) async {
    Box<User> box = await this.getUserBox('User');

    return box.isEmpty
        ? false
        : box.containsKey(key)
            ? true
            : false;
  }

  Future<void> deleteAll() async => await Hive.deleteBoxFromDisk('User');
}
