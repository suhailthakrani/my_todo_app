// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Notes {
  List<Note> notes = [];
}

class Note {
  final int id;
  final String title;
  final String body;
  final DateTime creationDateTime;

  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.creationDateTime,
  });

  Note copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? creationDateTime,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      creationDateTime: creationDateTime ?? this.creationDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'creationDateTime': creationDateTime.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
      creationDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['creationDateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(id: $id, title: $title, body: $body, creationDateTime: $creationDateTime)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.body == body &&
        other.creationDateTime == creationDateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        body.hashCode ^
        creationDateTime.hashCode;
  }
}
