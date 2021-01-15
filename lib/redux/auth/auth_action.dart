import 'package:bbloginredux/model/loading_status.dart';


class LoadingStatusAction {
  final LoadingStatus loadingStatus;
  LoadingStatusAction(this.loadingStatus);
}

class AnymousSigninAction {
  dynamic userId;
  AnymousSigninAction(this.userId);
}
