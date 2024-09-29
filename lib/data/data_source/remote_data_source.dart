import 'package:advanced_flutter_arabic/data/network/app_api.dart';
import 'package:advanced_flutter_arabic/data/network/request.dart';
import 'package:advanced_flutter_arabic/data/response/response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginReq);
  Future<ForgetPasswordResponse> forgetPassword(ForgetPasswordRequest loginReq);
  Future<AuthenticationResponse> regester(RegesterRequest regReq);
  Future<HomeResponse> home();
  Future<StoreDetailsResponse> getStoreDetails();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServicesClient _appServicesClient;
  RemoteDataSourceImpl(this._appServicesClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginReq) async {
    final res =
        await _appServicesClient.login(loginReq.email, loginReq.password);
    return res;
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest loginReq) async {
    final res = await _appServicesClient.forgetPassword(loginReq.email);
    print(res);
    return res;
  }

  @override
  Future<AuthenticationResponse> regester(RegesterRequest regReq) async {
    final res = await _appServicesClient.regester(
        regReq.userName,
        regReq.countryMobileCode,
        regReq.mobilNumber,
        regReq.email,
        regReq.password,
        regReq.profilePichture);
    return res;
  }

  @override
  Future<HomeResponse> home() async {
    return await _appServicesClient.home();
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    return await _appServicesClient.getStoreDetails();
  }
}
