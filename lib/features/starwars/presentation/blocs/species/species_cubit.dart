import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/species_entity.dart';
import '../../../domain/entities/species_params.dart';
import '../../../domain/usecases/get_species.dart';

part 'species_state.dart';

class SpeciesCubit extends Cubit<SpeciesState> {
  late final GetSpecies getSpecies;
  int currentPage = 1;

  SpeciesCubit({
    required this.getSpecies,
  }) : super(const SpeciesState()) {
    loadData();
  }

  void loadData({initialLoad = false}) async {
    emit(
      state.copyWith(species: [], status: DataStatus.loading),
    );

    currentPage = 1;

    final speciesEither = await getSpecies(
      SpeciesParams(page: currentPage),
    );

    speciesEither.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          status: DataStatus.failure,
        ),
      ),
      (species) async {
        return emit(
          state.copyWith(
            species: species,
            status: DataStatus.success,
          ),
        );
      },
    );
  }

  void loadMoreData() async {
    emit(state.copyWith(status: DataStatus.loading));

    currentPage++;

    final speciesEither = await getSpecies(
      SpeciesParams(page: currentPage),
    );

    speciesEither.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          status: DataStatus.failure,
        ),
      ),
      (species) async {
        if (state.species.isNotEmpty && species != null) {
          return emit(
            state.copyWith(
              species: state.species + species,
              status: DataStatus.success,
            ),
          );
        }
      },
    );
  }
}
