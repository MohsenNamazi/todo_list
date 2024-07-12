import 'package:todo_list/data/model/project/project.dart';

import 'file_loader.dart';

abstract class ProjectFake {
  static Future<Project> getData() async {
    final testData = await FileLoader().loadFile('test/assets/project.json');
    return Project.fromJson(testData);
  }
}
