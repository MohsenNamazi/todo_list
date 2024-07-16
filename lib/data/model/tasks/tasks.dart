import 'package:todo_list/data/model/task/task.dart';
import 'package:todo_list/data/model/task_filter/task_filter.dart';

typedef Tasks = List<Task>;

extension TasksExptension on Tasks {
  Tasks fiter(TaskFilter filter) {
    Tasks tasks = this;
    // Filter the list
    if (filter.projectId != null) {
      tasks = where((task) => task.projectId == filter.projectId).toList();
    }
    if (filter.priority != null) {
      tasks = where((task) => task.priority == filter.priority).toList();
    }

    return tasks;
  }
}
