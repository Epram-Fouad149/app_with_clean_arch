import 'dart:async';

import 'package:app_with_clean_arch/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs implements BaseViewModelOutputs {
  // shared variables and function that will be used through any view model.
  final StreamController _inputStreamController = BehaviorSubject<FlowState>();
  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); // start view model job

  void dispose(); // will be called when view model dies

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  // will be implemented later

  Stream<FlowState> get outputState;
}
