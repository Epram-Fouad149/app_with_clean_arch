import 'package:app_with_clean_arch/data/network/failure.dart';
import 'package:app_with_clean_arch/domain/model/models.dart';
import 'package:app_with_clean_arch/domain/repository/repository.dart';
import 'package:app_with_clean_arch/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class StoreDetailsUseCase extends BaseUseCase<void, StoreDetails> {
  Repository repository;

  StoreDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) {
    return repository.getStoreDetails();
  }
}
