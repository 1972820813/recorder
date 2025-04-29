import 'dart:io';

class WriteFile {
  void writeDataToFile(String path, String message) async {
    var file = File(path);
    try {
      await file.writeAsString(message);
    } catch (e) {
      print('Error: $e');
    }
  }
}
