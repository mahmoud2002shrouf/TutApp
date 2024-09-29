import 'package:advanced_flutter_arabic/data/network/failure.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/base_usecase.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class HomeUsecase extends BaseUsecase<void, Home> {
  final Repository _repository;
  HomeUsecase(this._repository);
  @override
  Future<Either<Failure, Home>> execute(void input) async {
    return await _repository.home();
  }
}
