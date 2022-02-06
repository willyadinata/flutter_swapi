import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'common/core/api/api_client.dart';
import 'features/starwars/data/datasources/species_remote_data_source.dart';
import 'features/starwars/data/repositories/star_wars_repository_impl.dart';
import 'features/starwars/domain/repositories/star_wars_repository.dart';
import 'features/starwars/domain/usecases/get_species.dart';
import 'features/starwars/presentation/blocs/species/species_cubit.dart';

final getItInstance = GetIt.I;

Future<void> getItInit() async {
  getItInstance.registerLazySingleton<Client>(
    () => Client(),
  );
  getItInstance.registerLazySingleton<ApiClient>(
    () => ApiClient(getItInstance()),
  );
  getItInstance.registerLazySingleton<SpeciesRemoteDataSource>(
    () => SpeciesRemoteDataSourceImpl(getItInstance()),
  );
  getItInstance.registerLazySingleton<StarWarsRepository>(
    () => StarWarsRepositoryImpl(getItInstance()),
  );
  getItInstance.registerLazySingleton<GetSpecies>(
    () => GetSpecies(getItInstance()),
  );
  getItInstance.registerFactory<SpeciesCubit>(
    () => SpeciesCubit(getSpecies: getItInstance()),
  );
}
