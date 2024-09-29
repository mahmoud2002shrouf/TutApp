import 'package:advanced_flutter_arabic/data/network/failure.dart';
import 'package:advanced_flutter_arabic/data/network/request.dart';
import 'package:advanced_flutter_arabic/domain/base_usecase/base_usecase.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ForgetpasswordUsecase
    extends BaseUsecase<ForgetPasswordUsecase, FogetPassword> {
  final Repository _repository;
  ForgetpasswordUsecase(this._repository);

  @override
  Future<Either<Failure, FogetPassword>> execute(input) async {
    return await _repository.forgetPassword(ForgetPasswordRequest(input.email));
  }
}

class ForgetPasswordUsecase {
  String email;
  ForgetPasswordUsecase({required this.email});
}
//forgetPasswordRseponse json
//forgetPasswordRequesr 
//forgetPasswordModel