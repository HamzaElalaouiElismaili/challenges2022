
class UserModel {

  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerified = false;
  String? password;
  int? userid;
  String? key;
  String? name;
  String? username;
  String? phoneNumber;
  String? pinCode;
  int? latitude;
  int? longitude;
  String? battery;
  String? deviceToken;
  String? bio;
  List? followers;
  List? following;
  String? posts;
  String? userImage;
  String? userImageBackground;
  String?  isOnline ;
  String? hasFingerprint;
  String? deviceName;
  String? showCountriesNames;
  String? verified;
  String? website;
  String? locationProfile;
  String? mapStyle;
  String? alwaysShowMyLocation;
  bool? isPrivateAccount;
  String? profileViews;
  String? dateOfBirth;
  String? typingTo;
  String? instagramLink;
  String? youtubeLink;
  String? behanceLink;
  String? twitterLink;
  String? dribbleLink;
  String? pinterestLink;
  String? facebookLink;
  String? snapchatLink;
  String? tiktokLink;
  String? enableAutoMapMode;
  bool? showYourRank;
  bool? loginVerification;
  bool? showFollowers;
  bool? showFollowing;


  UserModel({
    this.phone,
    this.password, this.name, this.email,
    this.uId, this.username, this.phoneNumber,
    this.alwaysShowMyLocation, this.battery, this.behanceLink,
    this.bio, this.dateOfBirth, this.deviceName,
    this.deviceToken, this.dribbleLink, this.enableAutoMapMode,
    this.facebookLink, this.followers, this.following,
    this.hasFingerprint, this.instagramLink, this.isEmailVerified,
    this.isOnline, this.isPrivateAccount, this.key,
    this.latitude, this.locationProfile, this.loginVerification,
    this.longitude, this.mapStyle, this.pinCode,
    this.pinterestLink, this.posts, this.profileViews,
    this.showCountriesNames, this.showFollowers, this.showFollowing,
    this.showYourRank, this.snapchatLink, this.tiktokLink,
    this.twitterLink, this.typingTo, this.userid,
    this.userImage, this.userImageBackground, this.verified,
    this.website, this.youtubeLink});

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
    userid = json['userid'] ;
    key= json['key'];
    username = json['username'];
    phoneNumber= json['phoneNumber'];
    pinCode= json['pinCode'];
    pinCode= json['pinCode'];
    longitude= json['longitude'];
    battery= json['battery'];
    deviceToken= json['deviceToken'] ;
    bio= json['bio'];
    followers= json['followers'];
    following= json['following'];
    posts= json['posts'];
    userImage= json['userImage'];
    userImageBackground= json['userImageBackground'];
    isOnline = json['isOnline'];
    hasFingerprint = json['hasFingerprint'];
    deviceName= json['deviceName'];
    showCountriesNames= json['showCountriesNames'];
    verified= json['verified'];
    website= json['website'];
    locationProfile= json['locationProfile'];
    mapStyle= json['mapStyle'];
    alwaysShowMyLocation= json['alwaysShowMyLocation'];
    isPrivateAccount= json['isPrivateAccount'];
    profileViews= json['profileViews'];
    dateOfBirth= json['dateOfBirth'];
    typingTo= json['typingTo'];
    instagramLink= json['instagramLink'];
    youtubeLink= json['youtubeLink'];
    behanceLink= json['behanceLink'];
    twitterLink= json['twitterLink'];
    dribbleLink= json['dribbleLink'];
    pinterestLink= json['pinterestLink'];
    facebookLink= json['facebookLink'];
    snapchatLink= json['snapchatLink'];
    tiktokLink= json['tiktokLink'];
    enableAutoMapMode= json['enableAutoMapMode'];
    showYourRank= json['showYourRank'];
    loginVerification= json['loginVerification'];
    showFollowers= json['showFollowers'];
    showFollowing= json['showFollowing'];
  }

  Map<String, dynamic> toMap() {
    return {
      "name" : name ,
      "email" : email ,
      "uId" : uId ,
      "isEmailVerified" : isEmailVerified ,
      "userid" : userid ,
      "key" : key,
      "username" : username,
      "phoneNumber" : phoneNumber,
      "pinCode" : pinCode,
      "latitude" : latitude,
      "longitude" : longitude,
      "battery" : battery,
      "deviceToken" : deviceToken,
      "bio" : bio,
      "followers" : followers,
      "following" : following,
      "posts" : posts,
      "userImage" : userImage,
      "userImageBackground" : userImageBackground,
      "isOnline" : isOnline,
      "hasFingerprint" : hasFingerprint,
      "deviceName" : deviceName,
      "showCountriesNames" : showCountriesNames,
      "verified" : verified,
      "website" : website,
      "locationProfile" : locationProfile,
      "mapStyle" : mapStyle,
      "alwaysShowMyLocation" : alwaysShowMyLocation,
      "isPrivateAccount" : isPrivateAccount,
      "profileViews" : profileViews,
      "dateOfBirth" : dateOfBirth,
      "typingTo" : typingTo,
      "instagramLink" : instagramLink,
      "youtubeLink" : youtubeLink,
      "behanceLink" : behanceLink,
      "twitterLink" : twitterLink,
      "dribbleLink" : dribbleLink,
      "pinterestLink" : pinterestLink,
      "facebookLink" : facebookLink,
      "snapchatLink" : snapchatLink,
      "tiktokLink" : tiktokLink,
      "enableAutoMapMode" : enableAutoMapMode,
      "showYourRank" : showYourRank,
      "loginVerification" : loginVerification,
      "showFollowers" : showFollowers,
    };
  }

}

UserModel userModel = UserModel();