import 'package:equatable/equatable.dart';

class SpeciesParams extends Equatable {
  final int? id;
  final int page;

  const SpeciesParams({this.id, this.page = 1});

  @override
  List<Object> get props => [page];
}
