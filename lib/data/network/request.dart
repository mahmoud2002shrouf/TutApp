class LoginRequest {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}

class ForgetPasswordRequest {
  String email;
  ForgetPasswordRequest(this.email);
}

class RegesterRequest {
  String userName;
  String countryMobileCode;
  String mobilNumber;
  String email;
  String password;
  String profilePichture;
  RegesterRequest(this.userName, this.countryMobileCode, this.mobilNumber,
      this.email, this.password, this.profilePichture);
}
