// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProjetModel {
  final String name;
  final String projectId;
  final String serviceAccountJson;
  final List<String> tokens;
  ProjetModel({
    required this.name,
    required this.projectId,
    required this.serviceAccountJson,
    required this.tokens,
  });

  ProjetModel copyWith({
    String? name,
    String? projectId,
    String? serviceAccountJson,
    List<String>? tokens,
  }) {
    return ProjetModel(
      name: name ?? this.name,
      projectId: projectId ?? this.projectId,
      serviceAccountJson: serviceAccountJson ?? this.serviceAccountJson,
      tokens: tokens ?? this.tokens,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'projectId': projectId,
      'serviceAccountJson': serviceAccountJson,
      'tokens': tokens,
    };
  }

  factory ProjetModel.fromMap(Map<String, dynamic> map) {
    return ProjetModel(
      name: map['name'] as String,
      projectId: map['projectId'] as String,
      serviceAccountJson: map['serviceAccountJson'] as String,
      tokens: List<String>.from(
        (map['tokens'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjetModel.fromJson(String source) => ProjetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProjetModel(name: $name, projectId: $projectId, serviceAccountJson: $serviceAccountJson, tokens: $tokens)';
  }

  @override
  bool operator ==(covariant ProjetModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.projectId == projectId && other.serviceAccountJson == serviceAccountJson && listEquals(other.tokens, tokens);
  }

  @override
  int get hashCode {
    return name.hashCode ^ projectId.hashCode ^ serviceAccountJson.hashCode ^ tokens.hashCode;
  }
}
