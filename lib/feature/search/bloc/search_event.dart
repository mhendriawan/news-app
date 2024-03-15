import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchNews extends SearchEvent {
  final String query;

  const SearchNews(this.query);
}