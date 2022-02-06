part of 'species_cubit.dart';

enum DataStatus { initial, loading, success, failure }

class SpeciesState extends Equatable {
  final DataStatus status;
  final List<SpeciesEntity> species;

  final String errorMessage;

  const SpeciesState({
    this.status = DataStatus.initial,
    this.species = const [],
    this.errorMessage = '',
  });

  SpeciesState copyWith({
    DataStatus? status,
    List<SpeciesEntity>? species,
    int? currentPage,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return SpeciesState(
      status: status ?? this.status,
      species: species ?? this.species,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, species, errorMessage];
}
