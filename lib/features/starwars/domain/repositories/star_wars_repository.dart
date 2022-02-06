import 'package:fpdart/fpdart.dart';

import '../entities/app_error_entity.dart';
import '../entities/species_entity.dart';

abstract class StarWarsRepository {
  Future<Either<AppError, List<SpeciesEntity>?>> getSpecies(int page);
}
