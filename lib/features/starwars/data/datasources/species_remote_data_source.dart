import '../../../../common/core/api/api_client.dart';
import '../../../../common/core/api/api_constants.dart';
import '../models/species_model.dart';
import '../models/species_result_model.dart';

abstract class SpeciesRemoteDataSource {
  Future<List<SpeciesModel>?> getSpecies(int page);
}

class SpeciesRemoteDataSourceImpl extends SpeciesRemoteDataSource {
  final ApiClient _client;

  SpeciesRemoteDataSourceImpl(this._client);

  @override
  Future<List<SpeciesModel>?> getSpecies(int page) async {
    final response = await _client.get(ApiConst.pathSpecies, queryParameters: {
      'page': '$page',
    });

    return SpeciesResultModel.fromJson(response).species;
  }
}
