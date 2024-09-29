import 'package:advanced_flutter_arabic/data/data_source/local_data_source.dart';
import 'package:advanced_flutter_arabic/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter_arabic/data/mapper/mapper.dart';
import 'package:advanced_flutter_arabic/data/network/error_handel.dart';
import 'package:advanced_flutter_arabic/data/network/failure.dart';
import 'package:advanced_flutter_arabic/data/network/network_info.dart';
import 'package:advanced_flutter_arabic/data/network/request.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ReposirtoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  ReposirtoryImpl(
      this._networkInfo, this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequests) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.login(loginRequests);
        if (response.status == ApiInternalHandel.SUCCESS) {
          return Right(response.toDomine());
        } else {
          return Left(
            Failure(ApiInternalHandel.FAILURE,
                response.message ?? ResponseMessage.DEFAULT),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, FogetPassword>> forgetPassword(
      ForgetPasswordRequest loginReq) async {
    if (await _networkInfo.isConnect) {
      try {
        final res = await _remoteDataSource.forgetPassword(loginReq);
        if (res.status == ApiInternalHandel.SUCCESS) {
          print("ssssssssssss");
          return Right(res.toDomine());
        } else {
          return Left(
            Failure(ApiInternalHandel.FAILURE,
                res.message ?? ResponseMessage.DEFAULT),
          );
        }
      } catch (err) {
        print(err);
        print("ggggggggggg");
        return Left(ErrorHandler.handle(err).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> regester(
      RegesterRequest reqReq) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.regester(reqReq);
        if (response.status == ApiInternalHandel.SUCCESS) {
          return right(response.toDomine());
        } else {
          return left(Failure(ApiInternalHandel.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (err) {
        return Left(ErrorHandler.handle(err).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Home>> home() async {
    try {
      final res = await _localDataSource.home();
      print(res);
      return Right(res.toDomine());
    } catch (err) {
      print(err);
      if (await _networkInfo.isConnect) {
        try {
          final res = await _remoteDataSource.home();
          if (res.status == ApiInternalHandel.SUCCESS) {
            _localDataSource.saveHomeToCache(res);

            return Right(res.toDomine());
          } else {
            return left(Failure(ApiInternalHandel.FAILURE,
                res.message ?? ResponseMessage.DEFAULT));
          }
        } catch (err) {
          return left(ErrorHandler.handle(err).failure);
        }
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() async {
  try {
      final res = await _localDataSource.getStoreDetails();
      return Right(res.toDomine());
    } catch (err) {
      if (await _networkInfo.isConnect) {
        try {
          final res = await _remoteDataSource.getStoreDetails();
          if (res.status == ApiInternalHandel.SUCCESS) {
            _localDataSource.saveStoreDetailsToCache(res);

            return Right(res.toDomine());
          } else {
            return left(Failure(ApiInternalHandel.FAILURE,
                res.message ?? ResponseMessage.DEFAULT));
          }
        } catch (err) {
          return left(ErrorHandler.handle(err).failure);
        }
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
}
