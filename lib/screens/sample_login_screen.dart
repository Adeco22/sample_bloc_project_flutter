import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/blocs/sample_login_bloc/sample_login_bloc.dart';

// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 11:43 AM

///
class SampleLoginScreen extends StatefulWidget {
  const SampleLoginScreen({Key? key}) : super(key: key);

  @override
  _SampleLoginScreenState createState() => _SampleLoginScreenState();
}

class _SampleLoginScreenState extends State<SampleLoginScreen> {
  late SampleLoginBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of<SampleLoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: BlocListener<SampleLoginBloc, SampleLoginState>(
        listener: (BuildContext context, SampleLoginState state) {
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
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Username

                // Password

                _buildLoginButton(),
              ],
            ),
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
    // dynamic widget used for swapping widgets when state is changed
    return BlocBuilder<SampleLoginBloc, SampleLoginState>(
      builder: (BuildContext context, SampleLoginState state) {
        // If loading, return loading widget
        if (state is LoadingState) {
          return CircularProgressIndicator();
        }

        // Else return login button
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
