
/*
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_sound/flutter_sound.dart';

final pathToSaveAudio="denonciation.acc";

class SoundRecorder{
FlutterSoundRecorder? _audioRecorder;
bool isRecorderInitialized=false;

//Initialisation du recorder
Future init()async{
  _audioRecorder=FlutterSoundRecorder();
  final status =await Permission.microphone.request();
  if(status !=PermissionStatus.granted){
    throw RecordingPermissionException("Microphone permission");
  }
  //await _audioRecorder!.openAudioSession();
}
Future _record()async{
await _audioRecorder!.startRecorder(toFile: pathToSaveAudio);
}

Future _stop()async{
  await _audioRecorder!.stopRecorder();
}
Future toggleRecording()async{
  if(_audioRecorder!.isRecording){
    await _record();
  }else{
    await _stop();
  }
}
}*/