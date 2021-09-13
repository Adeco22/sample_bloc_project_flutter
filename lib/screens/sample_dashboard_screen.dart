import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/blocs/sample_dashbord_bloc/sample_dashboard_bloc.dart';

// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 3:30 PM

///
class SampleDashboardScreen extends StatefulWidget {
  const SampleDashboardScreen(this.user, {Key? key}) : super(key: key);

  final String user;

  @override
  _SampleDashboardScreenState createState() => _SampleDashboardScreenState();
}

class _SampleDashboardScreenState extends State<SampleDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: BlocListener<SampleDashboardBloc, SampleDashboardState>(
        listener: (BuildContext context, SampleDashboardState state) {
          // Put different states here
        },
        child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Username

                // Password

                Text('Welcome ${widget.user}!'),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        return true;
      },
    );
  }
}
