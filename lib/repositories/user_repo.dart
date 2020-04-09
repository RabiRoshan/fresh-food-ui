import 'package:fresh_food/models/sign_in_response.dart';

import '../locator.dart';
import '../models/user.dart';
import '../utils/http_helper.dart';
import '../utils/logger.dart';

abstract class UserRepo {
  Future<User> getUser();
  Future<SignInResponse> signInUser(String email, String password);
  Future<SignInResponse> createUser(
      String fullName, String email, String password);
}

class UserFakeRepo implements UserRepo {
  // Logger Head value
  final logger = getLogger("UserFakeRepo()");

  UserFakeRepo() {
    logger.i('Constructed');
  }

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<SignInResponse> signInUser(String email, String password) {
    // TODO: implement userSignIn
    return null;
  }

  @override
  Future<SignInResponse> createUser(
      String fullName, String email, String password) {
    // TODO: implement createUser
    return null;
  }
}

class UserHttpRepo implements UserRepo {
  // Logger Head value
  final logger = getLogger("UserHttpRepo()");

  // Http Helper
  HttpHelper _httpHelper = getIt<HttpHelper>();

  UserHttpRepo() {
    logger.i('Constructed');
  }

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<SignInResponse> signInUser(String email, String password) async {
    return signInResponseFromJson((await _httpHelper.makeRestCall(
            RestType.POST, "login",
            payload: {"email": email, "password": password},
            authenticated: false))
        .body);
  }

  @override
  Future<SignInResponse> createUser(
      String fullName, String email, String password) async {
    return signInResponseFromJson((await _httpHelper.makeRestCall(
            RestType.POST, "register",
            payload: {"email": email, "password": password},
            authenticated: false))
        .body);
  }
}
