import 'package:fpdart/fpdart.dart';

import '../../domain/entities/app_error_entity.dart';
import '../../domain/repositories/star_wars_repository.dart';
import '../datasources/species_remote_data_source.dart';
import '../models/species_model.dart';

class StarWarsRepositoryImpl extends StarWarsRepository {
  final SpeciesRemoteDataSource _remoteDataSource;

  StarWarsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppError, List<SpeciesModel>?>> getSpecies(int page) async {
    try {
      final species = await _remoteDataSource.getSpecies(page);

      return Right(species);
    } on Exception {
      return const Left(AppError('Something went wrong!'));
    }
  }
}
