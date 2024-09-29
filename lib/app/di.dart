import 'package:advanced_flutter_arabic/app/app_prefs.dart';
import 'package:advanced_flutter_arabic/data/data_source/local_data_source.dart';
import 'package:advanced_flutter_arabic/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter_arabic/data/network/app_api.dart';
import 'package:advanced_flutter_arabic/data/network/dio_factory.dart';
import 'package:advanced_flutter_arabic/data/network/network_info.dart';
import 'package:advanced_flutter_arabic/data/repository/reposirtory_impl.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/forgetpassword_usecase.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/home_usecase.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/login_usecase.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/regester_usecase.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/store_details_usecase.dart';
import 'package:advanced_flutter_arabic/domain/repository/repository.dart';
import 'package:advanced_flutter_arabic/presentation/forgot_password/View%20model/forgetPassword_view_model.dart';
import 'package:advanced_flutter_arabic/presentation/login/viewModel/login_view_model.dart';
import 'package:advanced_flutter_arabic/presentation/main/pages/home/view%20model/home_view_model.dart';
import 'package:advanced_flutter_arabic/presentation/register/view%20model/regester_view_model.dart';
import 'package:advanced_flutter_arabic/presentation/store_details/view%20model/store_details_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerSingleton<SharedPreferences>(sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPrefrances>(() => AppPrefrances(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance
      .registerLazySingleton<AppServicesClient>(() => AppServicesClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServicesClient>()));

  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl());

  // repository

  instance.registerLazySingleton<Repository>(
      () => ReposirtoryImpl(instance(), instance(),instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUsecase>()) {
    instance.registerFactory<LoginUsecase>(() => LoginUsecase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgetPasswordModule() {
  if (!GetIt.I.isRegistered<ForgetpasswordViewModel>()) {
    instance.registerFactory<ForgetpasswordUsecase>(
        () => ForgetpasswordUsecase(instance()));
    instance.registerFactory<ForgetpasswordViewModel>(
        () => ForgetpasswordViewModel(instance()));
  }
}

initRegesterModule() {
  if (!GetIt.I.isRegistered<RegesterViewModel>()) {
    instance
        .registerFactory<RegesterUsecase>(() => RegesterUsecase(instance()));
    instance.registerFactory<RegesterViewModel>(
        () => RegesterViewModel(instance()));
    instance.registerLazySingleton<ImagePicker>(() => ImagePicker());
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeViewModel>()) {
    instance.registerFactory<HomeUsecase>(() => HomeUsecase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}
initStoreDetailsModule() {
  if (!GetIt.I.isRegistered<StoreDetailsViewmodel>()) {
    instance.registerFactory<StoreDetailsUsecase>(() => StoreDetailsUsecase(instance()));
    instance.registerFactory<StoreDetailsViewmodel>(() => StoreDetailsViewmodel(instance()));
  }
}
