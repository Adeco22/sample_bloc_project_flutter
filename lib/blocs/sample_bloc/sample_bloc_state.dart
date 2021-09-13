// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 11:49 AM

import 'package:equatable/equatable.dart';

///
abstract class SampleBlocState extends Equatable {
  const SampleBlocState();

  @override
  List<Object> get props => [];
}

class InitialState extends SampleBlocState {
  const InitialState();
}

class LoadingState extends SampleBlocState {
  const LoadingState();
}

class UserLoggedInSuccessState extends SampleBlocState {
  const UserLoggedInSuccessState(
    this.sessionToken,
  );

  final String sessionToken;

  @override
  List<Object> get props => [sessionToken];
}

class UserLoggedInErrorState extends SampleBlocState {
  const UserLoggedInErrorState(
    this.error,
  );

  final String error;

  @override
  List<Object> get props => [error];
}
