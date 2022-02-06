import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../blocs/species/species_cubit.dart';
import '../../widgets/custom_shimmer.dart';
import 'species_detail.dart';

class SpeciesList extends StatefulWidget {
  final SpeciesCubit speciesCubit;

  const SpeciesList({
    Key? key,
    required this.speciesCubit,
  }) : super(key: key);

  @override
  State<SpeciesList> createState() => _SpeciesListState();
}

class _SpeciesListState extends State<SpeciesList> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpeciesCubit, SpeciesState>(
      bloc: widget.speciesCubit,
      buildWhen: (previous, current) {
        return previous.species != current.species;
      },
      listener: (context, state) {
        switch (state.status) {
          case DataStatus.loading:
            _refreshController.requestLoading();
            break;
          case DataStatus.success:
            _refreshController.loadComplete();
            break;
          default:
            _refreshController.loadNoData();
        }
      },
      builder: (context, state) {
        if (state.status == DataStatus.loading && state.species.isEmpty) {
          return const CustomShimmer();
        } else {
          return SmartRefresher(
            onLoading: _onLoading,
            controller: _refreshController,
            enablePullDown: false,
            enablePullUp: true,
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: state.species.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SpeciesDetail(
                          species: state.species[index],
                        ),
                      ),
                    ),
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(
                      state.species[index].name ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Class ${state.species[index].classification ?? ''}',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  void _onLoading() async {
    widget.speciesCubit.loadMoreData();
  }
}
