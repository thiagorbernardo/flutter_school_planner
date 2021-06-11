import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/models/timeofday.g.dart';
import 'package:school_planner/models/user.dart';
import 'package:school_planner/models/weekday.dart';

class LocalDatabase {
  static Future initDb() async {
    var dir = await path.getApplicationDocumentsDirectory();
    print(dir.path);
    Hive.init(dir.path);

    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(SubjectAdapter());
    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(WeekDayAdapter());
    Hive.registerAdapter(TimeOfDayAdapter());
  }

  Future<Box> getUserBox(String boxName) async {
    return Hive.isBoxOpen(boxName)
        ? Hive.box<User>(boxName)
        : await Hive.openBox<User>(boxName);
  }

  Future saveUser(String key, User user) async {
    Box box = await this.getUserBox('User');

    await box.put(key, user);
  }

  Future<User> getUser(String key) async {
    if (await this.isUSerCreated(key)) {
      Box box = await this.getUserBox('User');

      return await box.get(key);
    }
    return new User(name: 'Daniela');
  }

  Future<bool> isUSerCreated(String key) async {
    Box box = await this.getUserBox('User');

    return box.isEmpty
        ? false
        : box.containsKey(key)
            ? true
            : false;
  }

  Future deleteAll() async => await Hive.deleteBoxFromDisk('User');
}
