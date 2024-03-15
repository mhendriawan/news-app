import 'package:equatable/equatable.dart';

abstract class HeadlineEvent extends Equatable {
  const HeadlineEvent();

  @override
  List<Object> get props => [];
}

class HeadlineFetched extends HeadlineEvent {}

class ShowMoreDescEvent extends HeadlineEvent {}