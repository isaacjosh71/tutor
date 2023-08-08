
abstract class SignInEvents{
  const SignInEvents();
}

class EmailEvents extends SignInEvents{
  final String email;
  const EmailEvents(this.email);
}

class PasswordEvents extends SignInEvents{
  final String password;
  const PasswordEvents(this.password);
}