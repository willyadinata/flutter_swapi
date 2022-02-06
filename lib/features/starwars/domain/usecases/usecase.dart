import 'package:fpdart/fpdart.dart';

import '../entities/app_error_entity.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>?> call(Params params);
}
