import 'package:app_with_clean_arch/data/network/failure.dart';
import 'package:app_with_clean_arch/domain/model/models.dart';
import 'package:app_with_clean_arch/domain/repository/repository.dart';
import 'package:app_with_clean_arch/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
