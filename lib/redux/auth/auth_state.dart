import 'package:meta/meta.dart';
import 'package:bbloginredux/model/loading_status.dart';

@immutable
class AuthState {
  final LoadingStatus loadingStatus;
  AuthState({
    this.loadingStatus,
  });

  AuthState copyWith({
    LoadingStatus loadingStatus,
  }) {
    return new AuthState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  factory AuthState.initial() {
    return new AuthState(
      loadingStatus: LoadingStatus.success,
    );
  }
}
