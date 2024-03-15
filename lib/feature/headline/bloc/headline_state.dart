import 'package:equatable/equatable.dart';
import 'package:news_app/feature/headline/headline.dart';

class HeadlineState extends Equatable {
  const HeadlineState();

  @override
  List<Object> get props => [];
}

class InitialHeadline extends HeadlineState {}

class HeadlineLoading extends HeadlineState {}

class HeadlineHasData extends HeadlineState {
  final HeadlineResponseModel result;

  const HeadlineHasData(this.result);

  @override
  List<Object> get props => [result];
}

class HeadlineNoData extends HeadlineState {
  final String message;

  const HeadlineNoData(this.message);

  @override
  List<Object> get props => [message];
}

class HeadlineNoInternetConnection extends HeadlineState {}

class HeadlineError extends HeadlineState {
  final String errorMessage;

  const HeadlineError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}