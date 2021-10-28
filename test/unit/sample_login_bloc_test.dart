import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bloc/blocs/sample_login_bloc/sample_login_bloc.dart';
import 'package:sample_bloc/services/sample_app_repository.dart';

// Includes
//
// Author - Anthony Deco <amldeco@unionbankph.com>
//
// Created at - 10/28/21 11:16 AM

///
void main() {
  late SampleLoginBloc bloc;
  late SampleAppRepository sampleAppRepository;

  setUp(() {
    sampleAppRepository = MockSampleAppRepository();
    bloc = SampleLoginBloc(sampleAppRepository);
  });

  test('InitialEvent must return InitialState', () {
    bloc.add(const InitialEvent());

    expectLater(
      bloc.stream,
      emitsInOrder(
        <SampleLoginState>[
          const InitialState(),
        ],
      ),
    );
  });

  test(
      'Successful LoginButtonClickedEvent must return UserLoggedInSuccessState',
      () {
    String username = 'usernameInput';
    String password = 'passwordInput';

    when(() => sampleAppRepository.login(username, password))
        .thenAnswer((_) async => true);

    bloc.add(LoginButtonClickedEvent(username, password, false));

    expectLater(
      bloc.stream,
      emitsInOrder(
        <SampleLoginState>[
          const LoadingState(),
          const UserLoggedInSuccessState('Sample User'),
        ],
      ),
    );
  });

  test('Failed LoginButtonClickedEvent must return UserLoggedInErrorState', () {
    String username = 'usernameInput';
    String password = 'passwordInput';

    when(() => sampleAppRepository.login(username, password))
        .thenAnswer((_) async => false);

    bloc.add(LoginButtonClickedEvent(username, password, false));

    expectLater(
      bloc.stream,
      emitsInOrder(
        <SampleLoginState>[
          const LoadingState(),
          const UserLoggedInErrorState('Invalid username/password!'),
        ],
      ),
    );
  });
}
