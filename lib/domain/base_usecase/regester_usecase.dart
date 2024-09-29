import 'package:advanced_flutter_arabic/data/network/failure.dart';
import 'package:advanced_flutter_arabic/data/network/request.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/base_usecase.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RegesterUsecase
    extends BaseUsecase<RegesterRequestUseCase, Authentication> {
  final Repository _repository;
  RegesterUsecase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      RegesterRequestUseCase input) async {
    final res = await _repository.regester(RegesterRequest(
        input.userName,
        input.countryMobileCode,
        input.mobilNumber,
        input.email,
        input.password,
        input.profilePichture));
        return res;
  }
}

class RegesterRequestUseCase {
  String userName;
  String countryMobileCode;
  String mobilNumber;
  String email;
  String password;
  String profilePichture;
  RegesterRequestUseCase(this.userName, this.countryMobileCode,
      this.mobilNumber, this.email, this.password, this.profilePichture);
}
