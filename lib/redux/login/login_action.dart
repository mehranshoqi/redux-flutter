import 'package:bbloginredux/model/loading_status.dart';
import 'package:bbloginredux/model/screen.dart';

class ValidateEmailAction {
  final String email;
  final Screen screen;
  ValidateEmailAction(
    this.email,
    this.screen,
  );
}

class ValidatePasswordAction {
  final String password;
  final Screen screen;
  ValidatePasswordAction(
    this.password,
    this.screen,
  );
}
