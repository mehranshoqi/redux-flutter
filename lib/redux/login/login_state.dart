import 'package:meta/meta.dart';
import 'package:bbloginredux/model/loading_status.dart';

@immutable
class LoginState {
  final LoadingStatus loadingStatus;
  final String email;
  final String password;
  final String emailError;
  final String passwordError;

  LoginState({
    this.loadingStatus,
    this.email,
    this.password,
    this.emailError,
    this.passwordError,
  });

  LoginState copyWith({
    LoadingStatus loadingStatus,
    String email,
    String password,
    String emailError,
    String passwordError,
  }) {
    return new LoginState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: email ?? this.email,
      passwordError: passwordError ?? this.passwordError,
    );
  }

  factory LoginState.initial() {
    return new LoginState(
      loadingStatus: LoadingStatus.success,
      email: '',
      password: '',
      emailError: '',
      passwordError: '',
    );
  }
}
