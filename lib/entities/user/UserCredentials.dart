import 'package:json_annotation/json_annotation.dart';

part 'UserCredentials.g.dart';

@JsonSerializable(explicitToJson: true)

class UserCredentials{
  UserCredentials({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialsToJson(this);
}