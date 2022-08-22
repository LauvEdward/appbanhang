import 'package:appbanhang/@core/shared_preference.dart';
import 'package:appbanhang/api/api.dart';
import 'package:appbanhang/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;

  Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}

abstract class AuthenticationService extends GetxService {
  Future<User?> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FakeAuthenticationService extends AuthenticationService {
  @override
  Future<User?> getCurrentUser() async {
    // simulated delay
    await Future.delayed(Duration(seconds: 2));
    return null;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    final response = await API.share.postLogin(email, password);
    if (response.statusCode == 200) {
      bool setToken = await AppSharePreference.share
          .setTokenSharePreference(response.data["data"]["access_token"]);
      if (setToken) {
        return User(response.data["data"]["access_token"],
            email: email, password: password);
      } else {
        throw AuthenticationException(message: 'Vui lòng đăng nhập lại');
      }
    } else {
      throw AuthenticationException(message: 'Tên đăng nhập hoặc mật khẩu sai');
    }
  }

  @override
  Future<void> signOut() async {}
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}
