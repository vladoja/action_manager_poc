import 'package:flutter/material.dart';

final mainDestinations = [
  const NavigationDestination(label: 'Zoznamy', icon: Icon(Icons.home)),
  const NavigationDestination(label: 'Termíny', icon: Icon(Icons.date_range)),
  const NavigationDestination(
      label: 'Pracovisko', icon: Icon(Icons.car_repair)),
  const NavigationDestination(label: 'Osoba', icon: Icon(Icons.group)),
];

class AppRoutes {
  static const String navZoznamyOsoby = 'Osoby';
  static const String navZoznamyPracoviska = 'Pracoviska';
  static const String navZoznamyPersonal = 'Personal';
}
