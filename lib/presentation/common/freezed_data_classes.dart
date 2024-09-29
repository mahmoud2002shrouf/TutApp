import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName, String password) = _LoginObject;
}

@freezed
class ForgetPassword with _$ForgetPassword {
  factory ForgetPassword(String email) = _ForgetPassword;
}

@freezed
class RegesterObject with _$RegesterObject {
  factory RegesterObject(
    String userName,
    String countryMobileCode,
    String mobilNumber,
    String email,
    String password,
    String profilePichture,
  ) = _RegesterObject;
}
