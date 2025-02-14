// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import 'package:awesome_push/imports.dart';

class ProjetModel {
  final String name;
  final String projectId;
  final String serviceAccountJson;
  final List<String> tokens;
  final List<NotificationModel> notifications;
  ProjetModel({
    required this.name,
    required this.projectId,
    required this.serviceAccountJson,
    required this.tokens,
    required this.notifications,
  });

  ProjetModel copyWith({
    String? name,
    String? projectId,
    String? serviceAccountJson,
    List<String>? tokens,
    List<NotificationModel>? notifications,
  }) {
    return ProjetModel(
      name: name ?? this.name,
      projectId: projectId ?? this.projectId,
      serviceAccountJson: serviceAccountJson ?? this.serviceAccountJson,
      tokens: tokens ?? this.tokens,
      notifications: notifications ?? this.notifications,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'projectId': projectId,
      'serviceAccountJson': serviceAccountJson,
      'tokens': tokens,
      'notifications': notifications.map((x) => x.toMap()).toList(),
    };
  }

  factory ProjetModel.fromMap(Map<String, dynamic> map) {
    return ProjetModel(
      name: map['name'] as String,
      projectId: map['projectId'] as String,
      serviceAccountJson: map['serviceAccountJson'] as String,
      tokens: List<String>.from((map['tokens'] as List<String>)),
      notifications: List<NotificationModel>.from(
        (map['notifications'] as List).map<NotificationModel>(
          (x) => NotificationModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjetModel.fromJson(String source) => ProjetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProjetModel(name: $name, projectId: $projectId, serviceAccountJson: $serviceAccountJson, tokens: $tokens, notifications: $notifications)';
  }

  @override
  bool operator ==(covariant ProjetModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.projectId == projectId && other.serviceAccountJson == serviceAccountJson && listEquals(other.tokens, tokens) && listEquals(other.notifications, notifications);
  }

  @override
  int get hashCode {
    return name.hashCode ^ projectId.hashCode ^ serviceAccountJson.hashCode ^ tokens.hashCode ^ notifications.hashCode;
  }
}
