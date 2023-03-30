import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathonmobile/core/controller/user_controller.dart';
import 'package:hackathonmobile/core/services/dio_client.dart';

final dio = Provider((ref) => DioClient('Urls.BASE_URL', ref.read(userAuth).token));
final userAuth = ChangeNotifierProvider<UserAuth>((ref) => UserAuth());

final userController = Provider<UserController>((ref) => UserController(ref));