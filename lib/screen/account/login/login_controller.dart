import 'package:appbanhang/screen/account/account_controller.dart';
import 'package:get/get.dart';
import 'package:equatable/equatable.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  void login(String email, String password) async {
    _loginStateStream.value = LoginLoading();

    try {
      await _authenticationController.signIn(email, password);
      _loginStateStream.value = LoginState();
    } catch (e) {
      _loginStateStream.value = LoginFailure(error: "Thông tin đăng nhập sai");
    }
  }
}

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}
