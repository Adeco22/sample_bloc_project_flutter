import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/blocs/sample_dashbord_bloc/sample_dashboard_bloc.dart';
import 'package:sample_bloc/screens/sample_dashboard_screen.dart';
import 'package:sample_bloc/screens/sample_login_screen.dart';
import 'package:sample_bloc/services/remote_sample_repository.dart';

import 'blocs/sample_login_bloc/sample_login_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SampleLoginBloc>(
            create: (context) => SampleLoginBloc(RemoteSampleRepository())),
        BlocProvider<SampleDashboardBloc>(
            create: (context) => SampleDashboardBloc(RemoteSampleRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SampleLoginScreen(),
        onGenerateRoute: (RouteSettings settings) {
          // Dashboard screen
          if (settings.name == 'dashboard/') {
            String user = (settings.arguments as Map<String, dynamic>)['user'];
            return MaterialPageRoute(builder: (context) {
              return SampleDashboardScreen(user);
            });
          }
        },
      ),
    );
  }
}
