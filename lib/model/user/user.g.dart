// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      // json['id'] as String,
      json['fullName'] as String,
      json['number'] as String,
      json['password'] as String,
      json['email'] as String,
      json['gid'] as String
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      // 'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'number': instance.number,
      'password': instance.password,
      'gid': instance.gid
    };
