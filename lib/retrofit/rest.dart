import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;


part 'rest.g.dart';


@RestApi(baseUrl: 'https://api.sophis-web.com')
abstract class UserGetNetwork {

  factory UserGetNetwork(Dio dio, {String baseUrl}) = _UserGetNetwork;


  @Headers(<String, String>{'Content-Type': 'application/json'})
  @PUT('/users/mypage/updateFcmAlert')
  Future emailByPhoneNumber(@Body() Map<String, String> map);


  /// PUT 방식
///  @Headers(<String, String>{'Content-Type': 'application/json'})
//   @PUT('/users/mypage/updateFcmAlert')
//   Future emailByPhoneNumber(@Body() Map<String, String> map);

  /// POST 방식
  // @Headers(<String, String>{'Content-Type': 'application/json'})
  // @POST('/users/auth/findEmail')
  // Future emailByPhoneNumber(@Body() Map<String, String> map);

  /// GET 방식
  // @GET('/users/mypage/selectUserinfo?user_id={userID}')
  // Future emailByPhoneNumber(@Path('userID') String userID);

}

