import 'package:flutter/material.dart';

final mainDestinations = [
  const NavigationDestination(label: 'Zoznamy', icon: Icon(Icons.home)),
  const NavigationDestination(label: 'Termíny', icon: Icon(Icons.date_range)),
  const NavigationDestination(
      label: 'Pracovisko', icon: Icon(Icons.car_repair)),
  const NavigationDestination(label: 'Osoba', icon: Icon(Icons.group)),
];

class AppRoutes {
  static const String navZoznamy = '/Zoznamy';
  static const String navTerminy = '/Termíny';
  static const String navPracovisko = '/Pracovisko';
  static const String navOsoba = '/Osoba';

  static const String navZoznamyOsoby = '$navZoznamy/Osoby';
  static const String navZoznamyPracoviska = '$navZoznamy/Pracoviska';
  static const String navZoznamyPersonal = '$navZoznamy/Personal';
}
