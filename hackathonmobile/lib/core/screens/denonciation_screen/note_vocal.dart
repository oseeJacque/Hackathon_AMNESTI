// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathonmobile/core/constants/assert.dart';
import 'package:hackathonmobile/core/screens/app_screens/denonciation_page.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/utils/app_utils_function.dart';
import 'package:hackathonmobile/core/utils/dynamique_button.dart';
import 'package:hackathonmobile/core/utils/helper_preferences.dart';
import 'package:hackathonmobile/core/utils/providers.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../constants/colors.dart';
import '../../widgets/floating_bouton.dart';

class NoteVocalPage extends ConsumerStatefulWidget {
  const NoteVocalPage({super.key});

  @override
  ConsumerState<NoteVocalPage> createState() => _NoteVocalPageState();
}

class _NoteVocalPageState extends ConsumerState<NoteVocalPage> {
  late FlutterSoundRecorder _myRecorder;
  final audioPlayer = AssetsAudioPlayer();
  String filePath = "";
  bool _isPlaying = false;
  bool _isRecording = false;
  bool isLoading = false;
  String _recorderTxt = '00:00';

  @override
  void initState() {
    init();
    super.initState();
    startIt();
  }

  @override
  void dispose() {
    super.dispose();
  }

  init() async {
    var dir = await getApplicationDocumentsDirectory();
    if (!Directory("${dir.path}/audios").existsSync()) {
      Directory("${dir.path}/audios").createSync(recursive: true);
    }
    setState(() {
      filePath = "${dir.path}/audios/$filePath";
    });
  }

  void startIt() async {
    filePath = 'temp.wav';
    _myRecorder = FlutterSoundRecorder();

    await _myRecorder.openRecorder();

    await _myRecorder.setSubscriptionDuration(const Duration(milliseconds: 10));
    await initializeDateFormatting();

    await Permission.microphone.request();
    await Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(back: true),
      floatingActionButton: FloatingActionButtonWidget(
        rotate: true,
        action: () {},
        icon: AssetData.messageQuestionP,
      ),

      //bottomNavigationBar: const BottomNavigationWidget(currentPage: 0,),

      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            vertical: height * .05, horizontal: width * .03),
        child: Column(
          children: [
            AppText(
              "Note vocale",
              color: AppColor.blueBgColor,
              size: 20.0,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: height * .2,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.blueBgColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  AssetData.microphone2P,
                  color: AppColor.blueBgColor,
                ),

                //Boutton de gestion audion
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Image.asset(AssetData.progressionP),
            SizedBox(
              height: height * .05,
            ),
            AppText(
              _recorderTxt,
              color: AppColor.blueBgColor,
              size: 30.0,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: height * .1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rectangleButton(
                    "",
                    width: 100.0,
                    context,
                    widget: _isRecording
                        ? const Icon(
                            Icons.stop,
                            color: Colors.red,
                            size: 40,
                          )
                        : Icon(
                            Icons.mic,
                            color: AppColor.whiteColor,
                            size: 40,
                          ), ontap: (() {
                  _isRecording ? stopRecord() : record();
                })),
                rectangleButton(
                    "",
                    width: 100.0,
                    context,
                    widget: _isPlaying
                        ? Icon(
                            Icons.pause,
                            color: AppColor.whiteColor,
                            size: 40,
                          )
                        : Icon(
                            Icons.play_arrow,
                            color: AppColor.whiteColor,
                            size: 40,
                          ), ontap: (() {
                  // print("taped 2");
                  _isPlaying ? stopPlaying() : startPlaying();
                })),
              ],
            ),
            SizedBox(
              height: height * .2,
            ),
            //Dénoncer button
            DynamiqueButton(
                childs: isLoading
                    ? CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColor.whiteColor,
                      )
                    : const AppText(
                        "Dénoncer",
                        size: 20.0,
                        weight: FontWeight.w700,
                      ),
                width: width * .45,
                height: height * .15,
                action: () async {
                  setState(() {
                    isLoading = true;
                  });
                  //Urls
                  String urlDeno =
                      'https://doxamiapi.onrender.com/deno/denonciations/';
                  String urlDeAc =
                      'https://doxamiapi.onrender.com/deno/denonciators/';

                  //Get location of user
                  Map<String, String> address = {};
                  await _determinePosition().then((value) async {
                    if (value is Position) {
                      Position pos = value;
                      address['latitude'] = pos.latitude.toString();
                      address['longitude'] = pos.longitude.toString();

                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                        pos.latitude,
                        pos.longitude,
                      );

                      if (placemarks.isNotEmpty) {
                        address['pays'] = placemarks[0].country ?? '';
                        address['arrondissement'] =
                            placemarks[0].administrativeArea ?? '';
                        address['ville'] = placemarks[0].locality ?? '';

                        logd('--------------');
                        logd(placemarks);
                      }
                      logd(address);
                    } else {
                      logd('Not authorized');
                    }
                  });

                  //Create denonciator
                  bool isDeno = await HelperPreferences.checkKey("DENO");
                  int idDeno = 0;

                  if (isDeno) {
                    idDeno = await HelperPreferences.retrieveIntValue("DENO");
                  } else {
                    String phone =
                        await HelperPreferences.retrieveStringValue('NUMBER');
                    await ref.read(dio).post(urlDeAc, data: {
                      'phone': phone,
                      'address': address
                    }).then((value) async {
                      idDeno = value.data['id'];
                      await HelperPreferences.saveIntValue(
                          "DENO", value.data['id']);
                      logd(value);
                    });
                  }

                  //Post File
                  int len = await File(filePath).length();
                  logd(len);
                  if (len != 0) {
                    FormData formData = FormData.fromMap({
                      'audio': await MultipartFile.fromFile(filePath,
                          filename: 'song.wav'),
                      'address': jsonEncode(address),
                      'denonciator_id': idDeno
                    });
                    await ref
                        .read(dio)
                        .postFile(body: formData, url: urlDeno)
                        .then((value) => toast('Soumission avec succès !'));

                    setState(() {
                      isLoading = false;
                    });
                    navigateToNextPageWithTransition(
                        context, const DenonciationPage(),
                        back: false);
                  } else {
                    toast(
                        "Veuillez enregistrer un audio avant de passer à la traduction !");
                  }
                },
                bgColor: AppColor.blueBgColor,
                radius: 10.0)
          ],
        ),
      ),
    );
  }

  Future<void> record() async {
    _myRecorder.openRecorder();
    //startIt();

    await _myRecorder.startRecorder(
      toFile: filePath,
      codec: Codec.pcm16WAV,
    );

    if (kDebugMode) {
      print(filePath);
    }

    setState(() {
      _recorderTxt = '00:00';
      //initialDate = DateTime(0);
      _isRecording = true;
    });

    //discount();
    _myRecorder.onProgress!.listen((event) {
      var date = DateTime.fromMillisecondsSinceEpoch(
          event.duration.inMilliseconds,
          isUtc: true);
      var txt = DateFormat('mm:ss', 'en_GB').format(date);

      setState(() {
        logd(txt);
        _recorderTxt = txt;
      });
    });
  }

  Future<String?> stopRecord() async {
    _myRecorder.closeRecorder();
    setState(() {
      _isRecording = false;
    });
    return await _myRecorder.stopRecorder();
  }

  Future<void> startPlaying() async {
    if (kDebugMode) {
      print("playing");
    }

    setState(() {
      _isPlaying = true;
    });

    audioPlayer.open(
      Audio.file(filePath),
      autoStart: true,
      showNotification: true,
    );
  }

  Future<void> stopPlaying() async {
    setState(() {
      _isPlaying = false;
    });

    audioPlayer.stop();
  }

  Widget rectangleButton(String text, BuildContext context,
      {void Function()? ontap, width, height, radios, widget, offset = true}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width ?? 180,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: AppColor.blueBgColor,
          borderRadius: BorderRadius.circular(radios ?? 35),
          boxShadow: [
            BoxShadow(
              color: AppColor.whiteColor,
              blurRadius: 2,
              offset: offset ? const Offset(0, 5) : const Offset(0, 0),
              blurStyle: BlurStyle.normal,
              spreadRadius: offset ? 0.5 : 2,
            )
          ],
        ),
        child: Center(
          child: widget ??
              AppText(
                text,
                weight: FontWeight.bold,
                size: 18,
              ),
        ),
      ),
    );
  }

  Future<dynamic> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return false;
          // Future.error('Location permissions are denied');
        }
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
      // Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
