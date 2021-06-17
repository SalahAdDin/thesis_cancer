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

Map<String, dynamic> _$_$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'email': instance.email,
    'username': instance.username,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profile', instance.profile?.toJson());
  writeNotNull('token', instance.token);
  writeNotNull('confirmed', instance.confirmed);
  writeNotNull(
      'surveyResults', instance.surveyResults?.map((e) => e.toJson()).toList());
  writeNotNull('posts', instance.posts?.map((e) => e.toJson()).toList());
  writeNotNull('comments', instance.comments?.map((e) => e.toJson()).toList());
  writeNotNull('likes', instance.likes?.map((e) => e.toJson()).toList());
  return val;
}
