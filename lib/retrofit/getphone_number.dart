import 'package:dio/dio.dart';
import 'package:flutter_retrofit2/retrofit/rest.dart';

class GetTest{

  late UserGetNetwork client;
  Dio dio = Dio();

  GetTest(){
    client = UserGetNetwork(dio);
  }

  Future getPhoneNumber(userID, type, value) async {
    return await client.emailByPhoneNumber(
      {
        "user_id":"$userID",
        "type":"$type",
        "value":"$value"
      }
    );
  }

}