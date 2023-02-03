// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Notes {
  List<Note> notes = [];
}

class Note {
  final String title;
  final String description;
  final String date;
  final String time;
  Note({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });

  Note copyWith({
    String? title,
    String? description,
    String? date,
    String? time,
  }) {
    return Note(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'time': time,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(title: $title, description: $description, date: $date, time: $time)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.date == date &&
      other.time == time;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      date.hashCode ^
      time.hashCode;
  }
}
