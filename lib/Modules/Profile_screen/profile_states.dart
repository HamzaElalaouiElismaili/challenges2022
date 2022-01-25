import 'dart:io';

abstract class ProfileStates {}

class UpdateLoading extends ProfileStates{}
class Appinitialstate extends ProfileStates{}
class UpdateSuccessflly extends ProfileStates{}
class CoverImagePicckedSuccessState extends ProfileStates{

  late final File picture ;
  CoverImagePicckedSuccessState(this.picture);
}
class CoverImagePicckedLoadingState extends ProfileStates{}
class CoverImagePicckedErrorState extends ProfileStates{}
class UpdateError extends ProfileStates
{
  late final String error ;
  UpdateError(this.error);
}

class SocialCreateMessageImageLoadingState extends ProfileStates{}
class SocialCreateMessageImageErrorState extends ProfileStates{}

