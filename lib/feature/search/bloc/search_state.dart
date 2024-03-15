import 'package:equatable/equatable.dart';

import '../network/network.dart';

class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class InitialSearch extends SearchState {}

class SearchLoading extends SearchState {}

class SearchHasData extends SearchState {
  final SearchResponseModel result;

  const SearchHasData(this.result);

  @override
  List<Object> get props => [result];
}

class SearchNoData extends SearchState {
  final String message;

  const SearchNoData(this.message);

  @override
  List<Object> get props => [message];
}

class SearchNoInternetConnection extends SearchState {}

class SearchError extends SearchState {
  final String errorMessage;

  const SearchError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
