import 'dart:convert';
import 'dart:io';

class FileLoader {
  Future<T> loadFile<T>(String path) async {
    final file = File(path);
    final contents = file.readAsStringSync();
    return jsonDecode(contents) as T;
  }
}
