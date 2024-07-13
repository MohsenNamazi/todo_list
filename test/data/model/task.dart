import 'package:todo_list/data/model/task/task.dart';

import 'file_loader.dart';

abstract class TaskFake {
  static Future<Task> getData() async {
    final testData = await FileLoader().loadFile('test/assets/task.json');
    return Task.fromJson(testData);
  }
}
