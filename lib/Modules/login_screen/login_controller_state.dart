abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSucsessState extends LoginStates {


  late final String uid;
  LoginSucsessState(this.uid);


}

class LoginErrorState extends LoginStates {

  late final String error;
  LoginErrorState(this.error);
}

class LoginvisiblepassState extends LoginStates {}
//class GetUserLoadingState extends LoginStates{}




class GetMyInfoLoading extends LoginStates{}
class GetMyInfoSuccessfully extends LoginStates{

  late final String uId ;
  GetMyInfoSuccessfully(this.uId);
}
class GetMyInfoError extends LoginStates{
  late final String error ;
  GetMyInfoError(this.error);

}