import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class OsobaEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String? title;
  final String? phone;
  final String? city;
  final String? employer;

  const OsobaEntity(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.title,
      required this.phone,
      required this.city,
      required this.employer});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'title': title,
      'phone': phone,
      'city': city,
      'employer': employer,
    };
  }

  factory OsobaEntity.fromMap(Map<String, dynamic> map) {
    return OsobaEntity(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      title: map['title'],
      phone: map['phone'],
      city: map['city'],
      employer: map['employer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OsobaEntity.fromJson(String source) =>
      OsobaEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OsobaEntity(id: $id, firstName: $firstName, lastName: $lastName, title: $title, phone: $phone, city: $city, employer: $employer)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      title,
      phone,
      city,
      employer,
    ];
  }

  OsobaEntity copyWith({
    int? id,
    String? firstName,
    String? lastName,
    ValueGetter<String?>? title,
    ValueGetter<String?>? phone,
    ValueGetter<String?>? city,
    ValueGetter<String?>? employer,
  }) {
    return OsobaEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      title: title?.call() ?? this.title,
      phone: phone?.call() ?? this.phone,
      city: city?.call() ?? this.city,
      employer: employer?.call() ?? this.employer,
    );
  }
}
