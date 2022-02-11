import 'package:shared_preferences/shared_preferences.dart';
import '/app/core/models/token_model.dart';
import '/app/core/models/user_model.dart';

class SessionControllService {
  late SharedPreferences _prefs;

  final String _userDataKey = 'userData';
  final String _tokenDataKey = 'tokenData';
  Future<void> insertUserData(UserModel userData) async {
    await _init();
    await _prefs.setString(_userDataKey, userData.toJson());
  }

  Future<void> insertTokens(TokenModel tokens) async {
    await _init();
    await _prefs.setString(_tokenDataKey, tokens.toJson());
  }

  Future<UserModel?> getUserData() async {
    await _init();
    final String? userMapData = _prefs.getString(_userDataKey);
    if (userMapData == null) {
      return null;
    } else {
      return UserModel.fromJson(userMapData);
    }
  }

  Future<TokenModel?> getTokens() async {
    await _init();
    final String? tokenMapData =  _prefs.getString(_tokenDataKey);
    if (tokenMapData == null) {
      return null;
    } else {
      return TokenModel.fromJson(tokenMapData);
    }
  }

  Future<void> clearData() async {
    await _init();
    await _prefs.clear();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
