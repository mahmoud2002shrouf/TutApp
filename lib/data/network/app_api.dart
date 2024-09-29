//هان بصير http

import "package:advanced_flutter_arabic/app/constance.dart";
import "package:advanced_flutter_arabic/data/response/response.dart";
import "package:dio/dio.dart";
import "package:retrofit/http.dart";
import "package:retrofit/retrofit.dart";
part 'app_api.g.dart';

@RestApi(baseUrl: Constance.baseUrl)
abstract class AppServicesClient {
  factory AppServicesClient(Dio dio, {String baseUrl}) = _AppServicesClient;
  @POST("/coustamer/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);

  @POST("/coustamer/forgetPassword")
  Future<ForgetPasswordResponse> forgetPassword(@Field("email") String email);

  @POST("/coustamer/regester")
  Future<AuthenticationResponse> regester(
      @Field("user_name") String userName,
      @Field("country_mobile_code") String countryMobileCode,
      @Field("mobil_number") String mobilNumber,
      @Field("email") String email,
      @Field("password") String password,
      @Field("profile_pichture") String profilePichture);

  @GET("/home")
  Future<HomeResponse> home();
  @GET("/store/1")
  Future<StoreDetailsResponse> getStoreDetails();
}
