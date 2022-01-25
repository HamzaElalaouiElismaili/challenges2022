import 'dart:io';

abstract class Appstates {}

class Appinitialstate extends Appstates {}
class initialstate extends Appstates {}
class OpenDrawerState extends Appstates {}
class AnimationDrawer extends Appstates {}
class CoverImagePicckedSuccessState extends Appstates{

  late final File picture ;
  CoverImagePicckedSuccessState(this.picture);
}class CoverImagePicckedErrorState extends Appstates {}
class getImage extends Appstates {}


class LanguageChangedArabic extends Appstates {}
class LanguageChangedFrance extends Appstates {}

class AppChangeBottomNavBarState extends Appstates {}

class Darkmodetogglestate extends Appstates {}
class GetMyInfoLoading extends Appstates{}


class GetMyInfoSuccessfully extends Appstates{}
class ChangeDrawer extends Appstates{}
class EmitAndGetMyInfo extends Appstates{}
class GetMyInfoError extends Appstates{
  late final String error ;
  GetMyInfoError(this.error);

}




class UpdateLoading extends Appstates{}
class UpdateSuccessflly extends Appstates{}

class CoverImagePicckedLoadingState extends Appstates{}
class UpdateError extends Appstates
{
  late final String error ;
  UpdateError(this.error);
}

class SocialCreateMessageImageLoadingState extends Appstates{}
class SocialCreateMessageImageErrorState extends Appstates{}
class ProfileImageUploadSuccessState extends Appstates{}
class UploadingLoadingState extends Appstates{}
class ProfileImageUploadErrorState extends Appstates{}

