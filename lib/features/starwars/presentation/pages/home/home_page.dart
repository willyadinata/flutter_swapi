import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_locator.dart';
import '../../blocs/species/species_cubit.dart';
import 'species_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SpeciesCubit _speciesCubit = getItInstance<SpeciesCubit>();

    return BlocProvider(
      create: (context) => _speciesCubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Species of Star Wars'),
        ),
        body: Column(
          children: [
            Expanded(
              child: SpeciesList(
                speciesCubit: _speciesCubit,
              ),
            )
          ],
        ),
      ),
    );
  }
}
