import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathonmobile/core/models/user_model.dart';
import 'package:hackathonmobile/core/services/parse_result.dart';
import 'package:hackathonmobile/core/utils/app_utils_function.dart';
import 'package:hackathonmobile/core/utils/conf_string.dart';
import 'package:hackathonmobile/core/utils/helper_preferences.dart';
import 'package:hackathonmobile/core/utils/providers.dart';

class UserAuth extends ChangeNotifier {
  String token = "";
  UserModel me = UserModel.initial();
}

class UserController {
  final Ref ref;

  String url = Urls.BASE_URL + Urls.AUTH;
  UserController(this.ref);

  Future<FetchData> login(String email, String password) async {
    FetchData result = FetchData(data: null, error: "");
    logd('$email : $password');
    await ref.read(dio).post('${url}login/',
        data: {'email': email, 'password': password}).then((value) async {
      logd(value);
      logd("RESPONSE ");

      if (value.statusCode == 200) {
        result.data = value.data['token']; // data;
        logd('tokennnnn- ----------------> ${value.data['token']['access']}');

        ref.read(userAuth.notifier).token = value.data['token']['access'];
        await HelperPreferences.saveStringValue(
            'TOKEN', value.data['token']['access']);
        // ignore: await_only_futures
        await ref.refresh(dio);
        //getMyInfos
        await getMe();
        bool okay =
            false; //await ref.read(locationController).getLocationInfos();
        logd(okay);
        logd('---------------------');
        if (okay) {
          logd("Okayyyyyyyyy");
          toast(value.data['msg']);
        } else {
          toast("Vous n'avez aucune location en cours");
          result.error = "Vous n'avez aucune location en cours";
        }

        result.data = true;
      } else {
        result.error = "Une erreur s'est produite... (${value.statusMessage})";
        logd(result.error);
        toast('Email ou mot de passe incorrecte !');
      }
    });
    return result;
  }

  Future<bool> getMe() async {
    String urlLink = '${url}profile/';
    UserModel userModel = UserModel.initial();
    logd('############# GETTING ME ##################');
    await ref.read(dio).get(urlLink, withAuthorization: true).then((value) {
      logd(value);
      if (value.statusCode == 200) {
        userModel = UserModel.fromMap(value.data);
        logd(userModel);
        ref.read(userAuth.notifier).me = userModel;
        return true;
      } else {
        logd('Une erreur est survenue !');
        return false;
      }
    });

    return false;
  }
}
