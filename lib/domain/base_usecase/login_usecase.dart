import 'package:advanced_flutter_arabic/data/network/failure.dart';
import 'package:advanced_flutter_arabic/data/network/request.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/base_usecase.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase implements BaseUsecase<LoginRequestUseCase, Authentication> {
  final Repository _repository;
  LoginUsecase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginRequestUseCase input) async {
    
      return  await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginRequestUseCase {
  String email;
  String password;
  LoginRequestUseCase(this.email, this.password);
}
