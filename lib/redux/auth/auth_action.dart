import 'package:bbloginredux/model/loading_status.dart';
import 'dart:developer';
import 'package:bbloginredux/services/auth.dart';

class AnymousSigninAction {
  final AuthServices _auth = AuthServices();
  Future anymousSigninAction() async {
    debugger();
    dynamic res = _auth.signInAnonymously();
    if (res == null) {
      return null;
    } else {
      debugger();
      return res;
    }
  }
}

class LoadingStatusAction {
  final LoadingStatus loadingStatus;
  LoadingStatusAction({
    this.loadingStatus,
  });
}
