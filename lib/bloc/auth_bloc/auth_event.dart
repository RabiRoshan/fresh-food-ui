part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AutoSignInEvent extends AuthEvent {
  const AutoSignInEvent();

  @override
  List<Object> get props => null;
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();

  @override
  List<Object> get props => null;
}

class AccountCreateEvent extends AuthEvent {
  final String fullName;
  final String email;
  final String password;

  const AccountCreateEvent(this.fullName, this.email, this.password);

  @override
  List<Object> get props => [fullName, email, password];
}
