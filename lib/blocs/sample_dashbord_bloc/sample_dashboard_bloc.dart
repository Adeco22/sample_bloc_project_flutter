import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/services/sample_app_repository.dart';

import 'sample_dashboard_event.dart';
import 'sample_dashboard_state.dart';

export 'sample_dashboard_event.dart';
export 'sample_dashboard_state.dart';

// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 3:37 PM

///
class SampleDashboardBloc
    extends Bloc<SampleDashboardEvent, SampleDashboardState> {
  SampleDashboardBloc(this._sampleAppRepository) : super(InitialState());

  final SampleAppRepository _sampleAppRepository;

  @override
  Stream<SampleDashboardState> mapEventToState(
      SampleDashboardEvent event) async* {
    if (event is InitialEvent) {
      yield const InitialState();
    }
  }
}
