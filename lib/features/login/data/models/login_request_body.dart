import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';


@JsonSerializable()
class LoginRequestBody{
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});

  //-------------- Basic Here oroignal code --------------

  // Map<String , dynamic> toJson()=>{
  //   'email':email,
  //   'password':password,
  // };

  Map<String , dynamic> toJson()=> _$LoginRequestBodyToJson(this) ;

}