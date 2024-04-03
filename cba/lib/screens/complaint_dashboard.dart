import 'package:cba/blocs_file/firey_bloc.dart';
import 'package:cba/screens/dashboard.dart';
import 'package:cba/utils/shared_preference_functions.dart';
import 'package:cba/widgets/dashboard_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintDashboard extends StatefulWidget {
  const ComplaintDashboard({super.key, required this.phoneNo});
  final String phoneNo;

  @override
  State<ComplaintDashboard> createState() => _ComplaintDashboardState();
}

class _ComplaintDashboardState extends State<ComplaintDashboard> {
  Future<void> fetchData() async {
    String? p = await loadData('phoneNo');

    _phone = p;
  }

  String? _phone;

  @override
  void initState() {
    super.initState();
    fetchData();
    context.read<DatafireBloc>().add(FetchItem(phoneNo: _phone ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Complaint Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<DatafireBloc, DatabaseState>(
        builder: (context, state) {
          if (state is DatabaseInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DatabaseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DatabaseSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                      child: const Text(
                        "Complaint Dashoard",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: ((context, index) {
                        final item = state.items[index];
                        return DashboardListTile(
                          issueModel: item,
                        );
                      }),
                    )),
                  ],
                ),
              ),
            );
          } else if (state is DatabaseErrorState) {
            return const Center(
              child: Text(
                "Something Went Wrong \n Try refreshing the page",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
            // showSnackBar(context, state.error);
          } else {
            return const Center(
              child: Text(
                "Something Went Wrong \n Try refreshing the page",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Dashboard()));
        },
        tooltip: 'Register Issue',
        child: const Icon(Icons.add),
      ),
    );
  }
}
