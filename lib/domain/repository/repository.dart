import 'package:app_with_clean_arch/data/network/failure.dart';
import 'package:app_with_clean_arch/data/network/requests.dart';
import 'package:app_with_clean_arch/domain/model/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, String>> forgotPassword(String email);
}
