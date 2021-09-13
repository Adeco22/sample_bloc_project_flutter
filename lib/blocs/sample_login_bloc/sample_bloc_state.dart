import 'package:equatable/equatable.dart';

// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 11:49 AM

///
abstract class SampleLoginState extends Equatable {
  const SampleLoginState();

  @override
  List<Object> get props => [];
}

class InitialState extends SampleLoginState {
  const InitialState();
}

class LoadingState extends SampleLoginState {
  const LoadingState();
}

class UserLoggedInSuccessState extends SampleLoginState {
  const UserLoggedInSuccessState(
    this.sessionToken,
  );

  final String sessionToken;

  // Always add all equatable data
  @override
  List<Object> get props => [sessionToken];
}

class UserLoggedInErrorState extends SampleLoginState {
  const UserLoggedInErrorState(
    this.error,
  );

  final String error;

  @override
  List<Object> get props => [error];
}
