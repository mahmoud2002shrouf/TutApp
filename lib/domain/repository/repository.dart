//هان بنحول لطبيقة العرض
//هان بكون بعد ما اسوي الطلب ع الباك بكون راجع اله الريسبونس

import 'package:advanced_flutter_arabic/data/network/failure.dart';
import 'package:advanced_flutter_arabic/data/network/request.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginReq);
  Future<Either<Failure, Authentication>> regester(RegesterRequest reqReq);
  Future<Either<Failure, FogetPassword>> forgetPassword(ForgetPasswordRequest loginReq);
  Future<Either<Failure, Home>> home();
  Future<Either<Failure, StoreDetails>> getStoreDetails();
}
