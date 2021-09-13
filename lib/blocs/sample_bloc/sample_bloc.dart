import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/blocs/sample_bloc/sample_bloc_event.dart';
import 'package:sample_bloc/blocs/sample_bloc/sample_bloc_state.dart';
import 'package:sample_bloc/services/sample_app_repository.dart';

// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 11:55 AM

///
class SampleBloc extends Bloc<SampleBlocEvent, SampleBlocState> {
  SampleBloc(this._sampleAppRepository) : super(const InitialState());

  final SampleAppRepository _sampleAppRepository;

  @override
  Stream<SampleBlocState> mapEventToState(SampleBlocEvent event) async* {
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
        yield UserLoggedInSuccessState('');
      } else {
        yield UserLoggedInErrorState('');
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
