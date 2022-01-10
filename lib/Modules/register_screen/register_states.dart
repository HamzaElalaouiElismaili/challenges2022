abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {}

class RegistervisiblepassState extends RegisterStates {}


class CreateUserSuccessState extends RegisterStates{

  late final String uid;
  CreateUserSuccessState(this.uid);
}


class CreateUserErrorState extends RegisterStates{
  late final String error ;

  CreateUserErrorState(this.error);


}