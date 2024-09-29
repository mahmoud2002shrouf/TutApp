import 'dart:async';
import 'dart:io';

import 'package:advanced_flutter_arabic/domain/base_usecase/regester_usecase.dart';
import 'package:advanced_flutter_arabic/presentation/base/baseviwemodel.dart';
import 'package:advanced_flutter_arabic/presentation/common/freezed_data_classes.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/flow_state.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/state_render.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class RegesterViewModel extends BaseViewModel
    implements RegesterViewModelInput, RegesterViewModelOutput {
  final RegesterUsecase _regesterUsecase;
  var _regesterObject = RegesterObject("", "", "", "", "", "");
  RegesterViewModel(this._regesterUsecase);

  //base/////////////////////////////
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _mobileNumberStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _profilePictureStreamController =
      StreamController<File>.broadcast();
  final StreamController _areAllDataVaildStreamController =
      StreamController<void>.broadcast();
  StreamController isUserRegisteredInSuccessfullyStreamController =
      StreamController<bool>();

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _usernameStreamController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    _areAllDataVaildStreamController.close();
    isUserRegisteredInSuccessfullyStreamController.close();

    super.dispose();
  }
  //base/////////////////////////////

//user name////////////////////////////////////////////

  @override
  setUserName(String userName) {
    usernameInput.add(userName);
    if (_isUserNameVaild(userName)) {
      _regesterObject = _regesterObject.copyWith(userName: userName);
    } else {
      _regesterObject = _regesterObject.copyWith(userName: "");
    }
    validate();
  }

  @override
  // TODO: implement usernameInput
  Sink get usernameInput => _usernameStreamController.sink;

  @override
  // TODO: implement usernameOutput
  Stream<bool> get usernameOutput => _usernameStreamController.stream.map(
        (event) => _isUserNameVaild(event),
      );
  @override
  // TODO: implement errorUsernameOutput
  Stream<String?> get errorUsernameOutput => usernameOutput.map(
        (event) => event ? null : AppStrings.userNameInvalid.tr(),
      );
//user name////////////////////////////////////////////

//email////////////////////////////////////////////////
  @override
  // TODO: implement emailInput
  Sink get emailInput => _emailStreamController.sink;

  @override
  // TODO: implement emailOutput
  Stream<bool> get emailOutput => _emailStreamController.stream.map(
        (event) => _isemailVaild(event),
      );

  @override
  setEmail(String email) {
    emailInput.add(email);
    if (_isemailVaild(email)) {
      _regesterObject = _regesterObject.copyWith(email: email);
    } else {
      _regesterObject = _regesterObject.copyWith(email: "");
    }
    validate();
  }

  @override
  // TODO: implement erroremailOutput
  Stream<String?> get erroremailOutput => emailOutput.map(
        (event) => event ? null : AppStrings.invalidEmail.tr(),
      );
//email////////////////////////////////////////////////

//all////////////////////

  @override
  // TODO: implement isAllDataVaildInput
  Sink get isAllDataVaildInput => _areAllDataVaildStreamController.sink;

  @override
  // TODO: implement isAllDataVaildOutput
  Stream<bool> get isAllDataVaildOutput =>
      _areAllDataVaildStreamController.stream.map(
        (_) => _isAllValid(),
      );
//all////////////////////

//mobile number//////////////////////////
  @override
  // TODO: implement mobileNumberInput
  Sink get mobileNumberInput => _mobileNumberStreamController.sink;

  @override
  // TODO: implement mobileNumberOutput
  Stream<bool> get mobileNumberOutput =>
      _mobileNumberStreamController.stream.map(
        (event) => _ismobileValid(event),
      );

  @override
  setMobileNumber(String mobileNumber) {
    mobileNumberInput.add(mobileNumber);
    if (_ismobileValid(mobileNumber)) {
      _regesterObject = _regesterObject.copyWith(mobilNumber: mobileNumber);
    } else {
      _regesterObject = _regesterObject.copyWith(mobilNumber: "");
    }
    validate();
  }

  @override
  // TODO: implement errormobileNumberOutput
  Stream<String?> get errormobileNumberOutput => mobileNumberOutput.map(
        (event) => event ? null : AppStrings.mobileNumberInvalid.tr(),
      );

//mobile number//////////////////////////

//password////////////////////////
  @override
  // TODO: implement passwordInput
  Sink get passwordInput => _passwordStreamController.sink;

  @override
  // TODO: implement passwordOutput
  Stream<bool> get passwordOutput => _passwordStreamController.stream.map(
        (event) => _ispasswoedVaild(event),
      );
  @override
  setPassword(String password) {
    passwordInput.add(password);
    if (_ispasswoedVaild(password)) {
      _regesterObject = _regesterObject.copyWith(password: password);
    } else {
      _regesterObject = _regesterObject.copyWith(password: "");
    }
    validate();
  }

  @override
  // TODO: implement errorpasswordOutput
  Stream<String?> get errorpasswordOutput => passwordOutput.map(
        (event) => event ? null : AppStrings.passwordInvalid.tr(),
      );
//password////////////////////////

//profile picutre/////////////////////////////////
  @override
  // TODO: implement profilePictureInput
  Sink get profilePictureInput => _profilePictureStreamController.sink;

  @override
  // TODO: implement profilePictureOutput
  Stream<File> get profilePictureOutput =>
      _profilePictureStreamController.stream.map(
        (event) => event,
      );
  @override
  setProfilePicture(File profilePicture) {
    profilePictureInput.add(profilePicture);

    if (profilePicture.path.isNotEmpty) {
      _regesterObject =
          _regesterObject.copyWith(profilePichture: profilePicture.path);
    } else {
      _regesterObject = _regesterObject.copyWith(profilePichture: "");
    }
    validate();
  }

//profile picutre/////////////////////////////////

//function///////////////////////////////////////////
  @override
  regester() async {
    inputState.add(
        LoginState(stateRenderType: StateRenderType.pupupLodingStateRender));

    (await _regesterUsecase.execute(RegesterRequestUseCase(
            _regesterObject.userName,
            _regesterObject.countryMobileCode,
            _regesterObject.mobilNumber,
            _regesterObject.email,
            _regesterObject.password,
            "")))
        .fold(
      (l) {
        inputState
            .add(ErrorState(StateRenderType.pupupErrorStateRender, l.message));
      },
      (r) {
        isUserRegisteredInSuccessfullyStreamController.add(true);
      },
    );
  }

  bool _isUserNameVaild(String username) {
    return username.length > 5;
  }

  bool _isemailVaild(String email) {
    return email.contains("@");
  }

  bool _ispasswoedVaild(String password) {
    return password.length > 6 && RegExp(r'[.*?@]').hasMatch(password);
  }

  bool _ismobileValid(String mobile) {
    String phoneNumber = "1234567890";

    if (RegExp(r'^\d{10}$').hasMatch(phoneNumber) && mobile.length==10) {
      return true;
    } else {
      return false;
    }
  }

  bool _isAllValid() {
    return _isUserNameVaild(_regesterObject.userName) &&
        _regesterObject.profilePichture.isNotEmpty &&
        _isemailVaild(_regesterObject.email) &&
        _ispasswoedVaild(_regesterObject.password) &&
        _ismobileValid(_regesterObject.mobilNumber) &&
        _regesterObject.countryMobileCode.isNotEmpty;
  }

  validate() {
    isAllDataVaildInput.add(null);
  }

  @override
  setCountryCode(String countryCode) {
    if (countryCode.isNotEmpty) {
      _regesterObject =
          _regesterObject.copyWith(countryMobileCode: countryCode);
    } else {
      _regesterObject = _regesterObject.copyWith(countryMobileCode: '');
    }
    validate();
  }
//function///////////////////////////////////////////
}

abstract class RegesterViewModelInput {
  Sink get usernameInput;
  Sink get mobileNumberInput;
  Sink get emailInput;
  Sink get passwordInput;
  Sink get profilePictureInput;
  Sink get isAllDataVaildInput;
  setUserName(String userName);
  setMobileNumber(String mobileNumber);
  setEmail(String email);
  setPassword(String password);
  setProfilePicture(File profilePicture);
  setCountryCode(String countryCode);
  regester();
}

abstract class RegesterViewModelOutput {
  Stream<bool> get usernameOutput;
  Stream<String?> get errorUsernameOutput;

  Stream<bool> get mobileNumberOutput;
  Stream<String?> get errormobileNumberOutput;

  Stream<bool> get emailOutput;
  Stream<String?> get erroremailOutput;

  Stream<bool> get passwordOutput;
  Stream<String?> get errorpasswordOutput;

  Stream<File> get profilePictureOutput;

  Stream<bool> get isAllDataVaildOutput;
}
