import 'package:equatable/equatable.dart';

// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 3:35 PM

///
abstract class SampleDashboardState extends Equatable {
  const SampleDashboardState();

  @override
  List<Object> get props => [];
}

class InitialState extends SampleDashboardState {
  const InitialState();
}

class LoadingState extends SampleDashboardState {
  const LoadingState();
}
