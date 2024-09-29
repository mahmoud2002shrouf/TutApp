import 'dart:async';

import 'package:advanced_flutter_arabic/app/constance.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/forgetpassword_usecase.dart';
import 'package:advanced_flutter_arabic/presentation/base/baseviwemodel.dart';
import 'package:advanced_flutter_arabic/presentation/common/freezed_data_classes.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/flow_state.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/state_render.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';

class ForgetpasswordViewModel extends BaseViewModel
    implements ForgetPasswordInput, ForgetPasswordOutput {
  final ForgetpasswordUsecase _forgetpasswordUsecase;
  ForgetpasswordViewModel(this._forgetpasswordUsecase);
  final StreamController _inputEmailStreamController =
      StreamController.broadcast();
  var forgetPasswordObget = ForgetPassword("");

  //base////////////////////////////////////////
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _inputEmailStreamController.close();
    super.dispose();
  }

  //base////////////////////////////////////////

  //input////////////////////////////////////
  @override
  void setEmail(String email) {
    inputEmail.add(email);

    forgetPasswordObget = forgetPasswordObget.copyWith(email: email);
  }

  @override
  // TODO: implement inputEmail
  Sink get inputEmail => _inputEmailStreamController.sink;
  @override
  sendRequest() async {
    inputState.add(
        LoginState(stateRenderType: StateRenderType.pupupLodingStateRender));

    (await _forgetpasswordUsecase
            .execute(ForgetPasswordUsecase(email: forgetPasswordObget.email)))
        .fold((l) {
      inputState
          .add(ErrorState(StateRenderType.pupupErrorStateRender, l.message));
    },
            (r) => {
                  inputState.add(SuccessState(
                      StateRenderType.pupupSuccessStateRender,
                      r.support ?? Constance.empty)),
                });
  }

  //input////////////////////////////////////

  //output//////////////////////////////////
  @override
  // TODO: implement outputEmail
  Stream<bool> get outputEmail => _inputEmailStreamController.stream.map(
        (email) => isEmailValid(email),
      );
  //output//////////////////////////////////

  //function///////////////////////////
  bool isEmailValid(String email) {
    return email.isNotEmpty;
  }
  //function///////////////////////////
}

abstract class ForgetPasswordInput {
  setEmail(String email);
  Sink get inputEmail;
  sendRequest();
}

abstract class ForgetPasswordOutput {
  Stream<bool> get outputEmail;
}
