import 'species_model.dart';

class SpeciesResultModel {
  SpeciesResultModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.species,
  });

  late final int count;
  late final String next;
  late final String previous;
  late final List<SpeciesModel> species;

  SpeciesResultModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'] ?? '';
    previous = json['previous'] ?? '';
    species = List.from(json['results'])
        .map((e) => SpeciesModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['next'] = next;
    _data['previous'] = previous;
    _data['results'] = species.map((e) => e.toJson()).toList();
    return _data;
  }
}
