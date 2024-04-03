part of 'issue_bloc.dart';

class IssueEvent extends Equatable {
  const IssueEvent();

  @override
  List<Object> get props => [];
}

class IssueRetrival extends IssueEvent {
  final String phoneNo;

  const IssueRetrival({required this.phoneNo});
}
