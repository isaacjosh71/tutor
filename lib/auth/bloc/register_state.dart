class RegisterState{
  final String email;
  final String password;
  final String userName;
  final String rePassword;
  RegisterState({this.userName='', this.rePassword='', this.email='',
    this.password=''});

  RegisterState copyWith({
    String? email,
    String? password,
    String? userName, String? rePassword
  }){
    return RegisterState(
      email: email??this.email,
      password: password??this.password,
      userName: userName??this.userName,
      rePassword: rePassword??this.rePassword,
    );
  }
}