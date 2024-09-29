import 'dart:async';

import 'package:advanced_flutter_arabic/presentation/common/state%20render/flow_state.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseviwemodelInput
    implements BaseviwemodelOutput {
  final  _inputStreamController =
      BehaviorSubject<FlowState>();

  @override
  // TODO: implement inputState
  Sink get inputState => _inputStreamController.sink;
  @override
  // TODO: implement outputState
  Stream<FlowState> get outputState => _inputStreamController.stream.map((flowState) => flowState);
    @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseviwemodelInput {
  void start(); //initState
  void dispose();
  Sink get inputState;
}

abstract class BaseviwemodelOutput {
  Stream<FlowState> get outputState;
}

