import '../../domain/entities/species_entity.dart';

class SpeciesModel extends SpeciesEntity {
  final String? designation;
  final String? homeworld;
  final List<String>? people;
  final List<String>? films;
  final String? created;
  final String? edited;
  final String? url;

  const SpeciesModel({
    required String name,
    required String classification,
    required String averageHeight,
    required String skinColors,
    required String hairColors,
    required String eyeColors,
    required String averageLifespan,
    required String language,
    this.designation,
    this.homeworld,
    this.people,
    this.films,
    this.created,
    this.edited,
    this.url,
  }) : super(
          name: name,
          classification: classification,
          averageHeight: averageHeight,
          averageLifespan: averageLifespan,
          language: language,
          eyeColors: eyeColors,
          hairColors: hairColors,
          skinColors: skinColors,
        );

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      name: json['name'],
      classification: json['classification'],
      designation: json['designation'],
      averageHeight: json['average_height'],
      skinColors: json['skin_colors'],
      hairColors: json['hair_colors'],
      eyeColors: json['eye_colors'],
      averageLifespan: json['average_lifespan'],
      homeworld: json['homeworld'] ?? '',
      language: json['language'],
      people: List.castFrom<dynamic, String>(json['people']),
      films: List.castFrom<dynamic, String>(json['films']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['classification'] = classification;
    _data['designation'] = designation;
    _data['average_height'] = averageHeight;
    _data['skin_colors'] = skinColors;
    _data['hair_colors'] = hairColors;
    _data['eye_colors'] = eyeColors;
    _data['average_lifespan'] = averageLifespan;
    _data['homeworld'] = homeworld;
    _data['language'] = language;
    _data['people'] = people;
    _data['films'] = films;
    _data['created'] = created;
    _data['edited'] = edited;
    _data['url'] = url;
    return _data;
  }
}
