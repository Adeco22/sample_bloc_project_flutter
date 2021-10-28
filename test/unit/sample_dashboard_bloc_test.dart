import 'package:flutter_test/flutter_test.dart';
import 'package:sample_bloc/blocs/sample_dashbord_bloc/sample_dashboard_bloc.dart';
import 'package:sample_bloc/services/sample_app_repository.dart';

// Includes
//
// Author - Anthony Deco <amldeco@unionbankph.com>
//
// Created at - 10/28/21 11:13 AM

///
void main() {
  late SampleDashboardBloc bloc;
  late SampleAppRepository sampleAppRepository;

  setUp(() {
    sampleAppRepository = MockSampleAppRepository();
    bloc = SampleDashboardBloc(sampleAppRepository);
  });

  test('InitialEvent must return InitialState', () {
    bloc.add(const InitialEvent());

    expectLater(
      bloc.stream,
      emitsInOrder(
        <SampleDashboardState>[
          const InitialState(),
        ],
      ),
    );
  });
}
