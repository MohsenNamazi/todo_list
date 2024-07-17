import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/network/todoist/todoist_network.dart';

// Extend the Mock class to create a mock TodoistNetwork class
class TodoistNetworkMock extends Mock implements TodoistNetwork {}
