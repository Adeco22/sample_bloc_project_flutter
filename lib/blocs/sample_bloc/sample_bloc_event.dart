// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 11:45 AM

///
abstract class SampleBlocEvent {
  const SampleBlocEvent();
}

class InitialEvent extends SampleBlocEvent {
  const InitialEvent();
}

class LoginButtonClickedEvent extends SampleBlocEvent {
  const LoginButtonClickedEvent(
    this.usernameInput,
    this.passwordInput,
    this.rememberMe,
  );

  final String usernameInput;
  final String passwordInput;
  final bool rememberMe;
}

class MiniAppEventClicked extends SampleBlocEvent {
  const MiniAppEventClicked(this.message, this.data);
  final String message;
  final dynamic data;
}
