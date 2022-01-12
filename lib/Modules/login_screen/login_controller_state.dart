abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginWithGoogleLoadingState extends LoginStates {}
class RemoveErrorBarState extends LoginStates {}

class LoginSucsessState extends LoginStates {


  late final String uid;
  LoginSucsessState(this.uid);


}

class LoginWithGoogleSucsessState extends LoginStates {


  late final String uid;
  LoginWithGoogleSucsessState(this.uid);


}

class LoginErrorState extends LoginStates {
  late final String error;
  LoginErrorState(this.error);
}

class LoginvisiblepassState extends LoginStates {}

class CreateUserWithGoogleSingInSuccessState extends LoginStates
{
  late final String uId ;
  CreateUserWithGoogleSingInSuccessState(this.uId);

}

class CreateUserWithGoogleSingInErrorState extends LoginStates
{
  late final String error ;
  CreateUserWithGoogleSingInErrorState(this.error);

}


class GetMyInfoLoading extends LoginStates{}
class GetMyInfoSuccessfully extends LoginStates{

  late final String uId ;
  GetMyInfoSuccessfully(this.uId);
}
class GetMyInfoError extends LoginStates
{
  late final String error ;
  GetMyInfoError(this.error);
}
