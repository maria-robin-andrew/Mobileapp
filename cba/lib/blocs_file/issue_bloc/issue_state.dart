part of 'issue_bloc.dart';

class IssueState extends Equatable {
  const IssueState();

  @override
  List<Object> get props => [];
}

class IssueInitial extends IssueState {}

class Issues extends IssueState {
  List<dynamic> issue = [];
}
