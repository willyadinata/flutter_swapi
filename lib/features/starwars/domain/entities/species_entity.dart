import 'package:equatable/equatable.dart';

class SpeciesEntity extends Equatable {
  final String? name;
  final String? classification;
  final String? averageHeight;
  final String? averageLifespan;
  final String? language;
  final String? eyeColors;
  final String? hairColors;
  final String? skinColors;

  const SpeciesEntity({
    required this.name,
    required this.classification,
    required this.averageHeight,
    required this.averageLifespan,
    required this.language,
    required this.eyeColors,
    required this.hairColors,
    required this.skinColors,
  });

  @override
  List<Object?> get props {
    return [
      name,
      classification,
      averageHeight,
      averageLifespan,
      language,
      eyeColors,
      hairColors,
      skinColors
    ];
  }

  @override
  bool get stringify => true;
}
