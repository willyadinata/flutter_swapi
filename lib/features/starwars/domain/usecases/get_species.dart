import 'package:fpdart/fpdart.dart';

import '../entities/app_error_entity.dart';
import '../entities/species_entity.dart';
import '../entities/species_params.dart';
import '../repositories/star_wars_repository.dart';
import 'usecase.dart';

class GetSpecies extends UseCase<List<SpeciesEntity>?, SpeciesParams> {
  final StarWarsRepository repository;

  GetSpecies(
    this.repository,
  );

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<AppError, List<SpeciesEntity>?>> call(
    SpeciesParams params,
  ) async {
    return await repository.getSpecies(params.page);
  }
}
