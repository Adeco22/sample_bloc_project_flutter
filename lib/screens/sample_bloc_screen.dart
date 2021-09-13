import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/blocs/sample_bloc/sample_bloc.dart';
import 'package:sample_bloc/blocs/sample_bloc/sample_bloc_event.dart';
import 'package:sample_bloc/blocs/sample_bloc/sample_bloc_state.dart';

// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 11:43 AM

///
class SampleBlocScreen extends StatefulWidget {
  const SampleBlocScreen({Key? key}) : super(key: key);

  @override
  _SampleBlocScreenState createState() => _SampleBlocScreenState();
}

class _SampleBlocScreenState extends State<SampleBlocScreen> {
  late SampleBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of<SampleBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: BlocListener<SampleBloc, SampleBlocState>(
        listener: (BuildContext context, SampleBlocState state) {
          // If user logged in successfully, push to another page
          if (state is UserLoggedInSuccessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'dashboard/', (_) => false,
                arguments: {'user': state.sessionToken});
          }
          // If user has login error, show snackBar
          else if (state is UserLoggedInErrorState) {
            SnackBar(
              content: SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(state.error),
                    const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  ],
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: Scaffold(
          body: Column(
            children: <Widget>[
              // Username

              // Password

              _buildLoginButton(),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        // custom back
        Navigator.of(context).pop();
        return false;
      },
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<SampleBloc, SampleBlocState>(
      builder: (BuildContext context, SampleBlocState state) {
        if (state is LoadingState) {
          return CircularProgressIndicator();
        }

        return TextButton(
          onPressed: () {
            bloc.add(LoginButtonClickedEvent('', '', false));
          },
          child: Text('Login'),
        );
      },
    );
  }
}
