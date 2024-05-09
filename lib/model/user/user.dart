import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';



@JsonSerializable()
class User{

  // @JsonKey(name: "id")
  // String id;

  @JsonKey(name: "fullName")
  String fullName;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "number")
  String number;

  @JsonKey(name: "password")
  String password;

  @JsonKey(name: "gid")
  String? gid;



  User(/*this.id,*/ this.fullName, this.number, this.password,this.email,this.gid);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);


  Map<String, dynamic> toJson() => _$UserToJson(this);

}
