import 'package:redux/redux.dart';
import 'package:bbloginredux/redux/app_reducer.dart';
import 'package:bbloginredux/redux/app_state.dart';

createStore() => Store(
      rootReducer,
      initialState: new AppState.initial(),
    );
