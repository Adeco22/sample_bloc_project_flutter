import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/blocs/sample_bloc/sample_bloc.dart';
import 'package:sample_bloc/screens/sample_bloc_screen.dart';
import 'package:sample_bloc/services/remote_sample_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<SampleBloc>(
            create: (context) => SampleBloc(RemoteSampleRepository()))
      ], child: SampleBlocScreen()),
      onGenerateRoute: (settings) {},
    );
  }
}
