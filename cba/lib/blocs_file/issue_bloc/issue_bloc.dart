import 'package:bloc/bloc.dart';
import 'package:cba/model/issue_model.dart';
import 'package:equatable/equatable.dart';

part 'issue_event.dart';
part 'issue_state.dart';

class IssueBloc extends Bloc<IssueEvent, IssueState> {
  IssueBloc() : super(IssueInitial()) {
    on<IssueRetrival>((event, emit) async {
      IssueList ls = IssueList(phoneNo: event.phoneNo);
      ls.init();
      var compLs = ls.comp;
      var comps = compLs.JsonEncode();
      for (var i in comps) {}
    });
  }
}
