import 'package:postgres/postgres.dart';

import '../shared/contsents.dart';

class AppDataBase {
  final String host ="192.168.0.105" ;
  final int port = 5432;
  final String dbName ="omrtest" ;
  final  String dbAdmin = "omradmin";
  final  String dbPassword= "Omr\$\$123";//Omr$$123
  String emailValue = "";
  PostgreSQLConnection? connection;
  PostgreSQLResult? newRegistrationResult;
  PostgreSQLResult? userAlreadyRegister;
  PostgreSQLResult? loginResult;
  PostgreSQLResult? registrationResult;
  final String queryChekUserRegister ='select * from registertable where dbusername = @username OR dbphoneNumber = @phoneNumber';
  final String  queryRegister ='''INSERT INTO registertable(
  dbusername,
  dbphonenumber,
  dbpincode,
  dbname);''';
  final String  queryChekUserIsRegistered ='select dbusername,dbpincode,dbuserid from registertable where dbusername = @username ';
  String registerUser = "";
  String loginUser = "" ;

  AppDataBase()
  {
    connection = (connection == null || connection!.isClosed == true ? PostgreSQLConnection(this.host, this.port,this.dbName,username: this.dbAdmin,password:dbPassword,timeoutInSeconds: 30):connection);
  }

  Future<String> registration({required String username ,required String phone ,required String name ,required String password})async {
    try {
      await connection!.open();
      print("connected");
      await connection!.transaction((connectionRegister) async {
        userAlreadyRegister = await connectionRegister.query(
          queryChekUserRegister,
          allowReuse: true ,
          timeoutInSeconds: 30,
          substitutionValues:
          {
            "username" : username,
            "phoneNumber" : phone,
          }

        );
        if(userAlreadyRegister!.affectedRowCount > 0)
        {
          registerUser = 'AlreadyRegister';
          print("AlreadyRegister");
        }
        else {
          newRegistrationResult = await connectionRegister.query(
              queryRegister,
              allowReuse: true ,
              timeoutInSeconds: 30,
              substitutionValues: {
                "username" : username,
                "phonenumber" : phone,
                "pincode" : password,
                "name" : name ,
              }
          );
          registerUser = (newRegistrationResult!.affectedRowCount> 0 ? "Register" : "NotRegister");
          print("Register");
        }

      });
    }catch (e)
    {
      registerUser = "RegisterFailed";
      print(e.toString());
    }
    return registerUser;
  }

  Future<String> login({required String password , required String username}) async {
    try {
      await connection!.open();
      await connection!.transaction((connectionLogin) async{
        loginResult = await connectionLogin.query(
            queryChekUserIsRegistered,
            allowReuse: true ,
            timeoutInSeconds: 30,
            substitutionValues:
            {
              "username":username,
            }
        );
        if(loginResult!.affectedRowCount > 0)
        {
          if(loginResult!.first.elementAt(1).contains(password) == true)
          {
            loginUser = "LoginDone";
            userid =loginResult!.first.elementAt(2);
            print(userid.runtimeType);

          }
          else if(loginResult!.first.elementAt(1).contains(password) == false)
          {
            loginUser = "PasswordNotCorrect";
          }
          else
          {
            loginUser = "LoginFailed";
          }
        }
        else
        {
          loginUser = "NotRegister";
        }

      });

    }
    catch (e)
    {
      loginUser = "LoginFailed";
      print(e.toString());
    }

    return loginUser;
  }


}
