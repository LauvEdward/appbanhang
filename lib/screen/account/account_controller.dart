import 'package:appbanhang/@core/shared_preference.dart';
import 'package:appbanhang/model/user.dart';
import 'package:appbanhang/screen/account/authen_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  final AuthenticationService _authenticationService;
  final _authenticationStateStream = AuthenticationState().obs;

  AuthenticationState get state => _authenticationStateStream.value;

  AuthenticationController(this._authenticationService);

  // Called immediately after the contoller is allocated in memory.
  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<void> signIn(String email, String password) async {
    final user = await _authenticationService.signInWithEmailAndPassword(
        email, password);
    _authenticationStateStream.value = Authenticated(user: user);
  }

  void signOut() async {
    await _authenticationService.signOut();
    _authenticationStateStream.value = UnAuthenticated();
  }

  void getProfile() async {
    await _authenticationService.signOut();
    _authenticationStateStream.value = UnAuthenticated();
  }

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();
    String token = await AppSharePreference.share.getTokenSharePreference();

    if (token == "") {
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      _authenticationStateStream.value = Authenticated(
          user: User(token, password: "password", email: "email"));
    }
  }
}
