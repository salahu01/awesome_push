// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationModel {
  final String? title;
  final String? body;
  final String? image;
  final dynamic data;
  NotificationModel({
    this.title,
    this.body,
    this.image,
    required this.data,
  });

  NotificationModel copyWith({
    String? title,
    String? body,
    String? image,
    dynamic data,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      body: body ?? this.body,
      image: image ?? this.image,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'image': image,
      'data': data,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      data: map['data'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) => NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(title: $title, body: $body, image: $image, data: $data)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.body == body && other.image == image && other.data == data;
  }

  @override
  int get hashCode {
    return title.hashCode ^ body.hashCode ^ image.hashCode ^ data.hashCode;
  }
}
