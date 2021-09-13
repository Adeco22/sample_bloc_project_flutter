import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/services/sample_app_repository.dart';

import 'sample_bloc_event.dart';
import 'sample_bloc_state.dart';

export 'sample_bloc_event.dart';
export 'sample_bloc_state.dart';

// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 11:55 AM

///
class SampleLoginBloc extends Bloc<SampleBlocEvent, SampleLoginState> {
  SampleLoginBloc(this._sampleAppRepository) : super(const InitialState());

  final SampleAppRepository _sampleAppRepository;

  @override
  Stream<SampleLoginState> mapEventToState(SampleBlocEvent event) async* {
    // Initial Event
    if (event is InitialEvent) {
      yield const InitialState();
    }

    // When login button is clicked
    if (event is LoginButtonClickedEvent) {
      yield const LoadingState();
      // Handle data
      final bool isLoggedIn = await _sampleAppRepository.login(
          event.usernameInput, event.passwordInput);

      if (isLoggedIn) {
        yield UserLoggedInSuccessState('Sample User');
      } else {
        yield UserLoggedInErrorState('Invalid username/password!');
      }
    }

    // If mini-app event is called
    if (event is MiniAppEventClicked) {
      yield LoadingState();

      String jsonString = jsonEncode(event.data);
      // Manipulate data

      print(jsonString);
    }
  }
}
