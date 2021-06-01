// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    email: json['email'] as String,
    username: json['username'] as String,
    profile: json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    token: json['token'] as String?,
    confirmed: json['confirmed'] as bool?,
    isLoggedIn: json['isLoggedIn'] as bool?,
    surveyResults: (json['surveyResults'] as List<dynamic>?)
        ?.map((e) => UserSurveyResult.fromJson(e as Map<String, dynamic>))
        .toList(),
    posts: (json['posts'] as List<dynamic>?)
        ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList(),
    comments: (json['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
    likes: (json['likes'] as List<dynamic>?)
        ?.map((e) => Like.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'profile': instance.profile?.toJson(),
      'token': instance.token,
      'confirmed': instance.confirmed,
      'isLoggedIn': instance.isLoggedIn,
      'surveyResults': instance.surveyResults?.map((e) => e.toJson()).toList(),
      'posts': instance.posts?.map((e) => e.toJson()).toList(),
      'comments': instance.comments?.map((e) => e.toJson()).toList(),
      'likes': instance.likes?.map((e) => e.toJson()).toList(),
    };
