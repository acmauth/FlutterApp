import 'package:meta/meta.dart';

@immutable
abstract class SearchState {
  SearchState(this.history);

  final List<String> history;
}

class InitSearchState extends SearchState {
  InitSearchState() : super(List<String>());
}

class NuSearchState extends SearchState {
  NuSearchState(List<String> history) : super(history);
}
