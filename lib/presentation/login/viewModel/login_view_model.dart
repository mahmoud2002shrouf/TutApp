import 'dart:async';

import 'package:advanced_flutter_arabic/domain/base_usecase/login_usecase.dart';
import 'package:advanced_flutter_arabic/presentation/base/baseviwemodel.dart';
import 'package:advanced_flutter_arabic/presentation/common/freezed_data_classes.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/flow_state.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/state_render.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _allDataValidStreamController =
      StreamController<void>.broadcast();
StreamController<bool> isUserLoggedInSuccess = StreamController<bool>();
  var _loginObject = LoginObject("", "");
  final LoginUsecase _loginUsecase;
  LoginViewModel(this._loginUsecase);

  @override
//base-----------------------------------------------------------------
  void dispose() {
    super.dispose();
    _allDataValidStreamController.close();
    _userNameStreamController.close();
    _passwordStreamController.close();
    isUserLoggedInSuccess.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
    // TODO: implement start
  }
//------------------------------------------------------------

//input-----------------------------------------------------------------
  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;
  @override
  // TODO: implement inputAllDataValid
  Sink get inputAllDataValid => _allDataValidStreamController.sink;

  @override
  login() async {
    inputState.add(
        LoginState(stateRenderType: StateRenderType.pupupLodingStateRender));

    (await _loginUsecase.execute(
            LoginRequestUseCase(_loginObject.userName, _loginObject.password)))
        .fold(
      (l) => {
        inputState
            .add(ErrorState(StateRenderType.pupupErrorStateRender, l.message)),
      },
      (r) => {
        inputState.add(ContentState()),
        isUserLoggedInSuccess.add(true),
      },
    );
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    _loginObject = _loginObject.copyWith(password: password);
    inputAllDataValid.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    _loginObject = _loginObject.copyWith(userName: userName);
    inputAllDataValid.add(null);
  }

//----------------------------------------------------------------------------

//output----------------------------------------------------------------------
  @override
  Stream<bool> get outIsPasswordVaild => _passwordStreamController.stream
      .map((password) => isPasswordVaild(password));

  @override
  Stream<bool> get outIsUserNameVaild => _userNameStreamController.stream
      .map((username) => isUsernameVaild(username));
  @override
  // TODO: implement outIsallInputVaild
  Stream<bool> get outIsallInputVaild =>
      _allDataValidStreamController.stream.map(
        (_) {
          return _arrAllValid();
        },
      );

//---------------------------------------------------------------------------

//function-----------------------------------------------------------------------
  bool isPasswordVaild(String password) {
    return password.isNotEmpty;
  }

  bool isUsernameVaild(String userName) {
    return userName.isNotEmpty;
  }

  bool _arrAllValid() {
    return isPasswordVaild(_loginObject.password) &&
        isUsernameVaild(_loginObject.userName);
  }
//---------------------------------------------------------------------------
}

abstract class LoginViewModelInput {
  setUserName(String userName);
  setPassword(String password);
  login();
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAllDataValid;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outIsUserNameVaild;
  Stream<bool> get outIsPasswordVaild;
  Stream<bool> get outIsallInputVaild;
}
