import 'package:flutter/material.dart';

final mainDestinations = [
  const NavigationDestination(label: 'Zoznamy', icon: Icon(Icons.home)),
  const NavigationDestination(label: 'Termíny', icon: Icon(Icons.date_range)),
  const NavigationDestination(
      label: 'Pracovisko', icon: Icon(Icons.car_repair)),
  const NavigationDestination(label: 'Osoba', icon: Icon(Icons.group)),
];

final destinationsZoznamy = [
  const NavigationDestination(label: 'Osoby', icon: Icon(Icons.group)),
  const NavigationDestination(
      label: 'Pracovisko', icon: Icon(Icons.car_repair)),
  const NavigationDestination(label: 'Personal', icon: Icon(Icons.face_2)),
];

final destinationsTerminy = [
  const NavigationDestination(label: 'Osoby', icon: Icon(Icons.group)),
  const NavigationDestination(
      label: 'Pracoviská', icon: Icon(Icons.car_repair)),
];

class AppRoutes {
  static const String navZoznamy = '/Zoznamy';
  static const String navTerminy = '/Terminy';
  static const String navPracovisko = '/Pracovisko';
  static const String navOsoba = '/Osoba';

  static const String navZoznamyOsoby = '$navZoznamy/Osoby';
  static const String navZoznamyPracoviska = '$navZoznamy/Pracoviska';
  static const String navZoznamyPersonal = '$navZoznamy/Personal';

  static const String navTerminyOsoby = '$navTerminy/Osoby';
  static const String navTerminyPracoviska = '$navTerminy/Pracoviska';
}
