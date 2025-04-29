import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_recorder/util/constant_util.dart';

class RecordPageController extends GetxController {
  RxString pageTitle = "中英文".obs;

  RxString languageName =
      (Get.arguments != null ? Get.arguments[ConstantUtil.languageName] : "中英文")
          .obs;

  RxBool recording = false.obs;
  RxBool isPlaying = false.obs;

  FlutterSoundRecorder? _recorder;
  bool _isRecording = false;
  String? _filePath;

  @override
  onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    _recorder = FlutterSoundRecorder();
    await _recorder!.openRecorder();
  }

  Future<void> startRecording() async {
    final directory = await getApplicationDocumentsDirectory();
    _filePath = '${directory.path}/recording.aac';

    await _recorder!.startRecorder(
      toFile: _filePath,
      codec: Codec.aacADTS,
    );
    _isRecording = true;
  }

  Future<String?> stopRecording() async {
    await _recorder!.stopRecorder();
    _isRecording = false;
    return _filePath;
  }

  Future<bool> isRecording() async {
    return _isRecording;
  }

  Future<void> dispose() async {
    await _recorder!.closeRecorder();
    _recorder = null;
  }
}
