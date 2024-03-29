import 'package:flutter/material.dart';

final mainDestinations = [
  const NavigationDestination(label: 'Zoznamy', icon: Icon(Icons.home)),
  const NavigationDestination(label: 'Termíny', icon: Icon(Icons.date_range)),
  const NavigationDestination(
      label: 'Pracovisko', icon: Icon(Icons.car_repair)),
  const NavigationDestination(label: 'OSO', icon: Icon(Icons.group)),
];

final destinationsZoznamy = [
  const NavigationDestination(label: 'Osoby', icon: Icon(Icons.group)),
  const NavigationDestination(
      label: 'Pracovisko', icon: Icon(Icons.car_repair)),
  const NavigationDestination(label: 'Personal', icon: Icon(Icons.face_2)),
  const NavigationDestination(
      label: 'Žiadosti o skúšku', icon: Icon(Icons.assignment_outlined)),
];

final destinationsTerminy = [
  const NavigationDestination(label: 'Osoby', icon: Icon(Icons.group)),
  const NavigationDestination(
      label: 'Pracoviská', icon: Icon(Icons.car_repair)),
];

final destinationsOSO = [
  const NavigationDestination(label: 'Zoznam', icon: Icon(Icons.group)),
  const NavigationDestination(
      label: 'Zakladne Skol', icon: Icon(Icons.school_outlined)),
];

class AppRoutes {
  static const String navZoznamy = '/Zoznamy';
  static const String navTerminy = '/Terminy';
  static const String navPracovisko = '/Pracovisko';
  static const String navOSO = '/OSO';

  static const String navZoznamyOsoby = '$navZoznamy/Osoby';
  static const String navZoznamyPracoviska = '$navZoznamy/Pracoviska';
  static const String navZoznamyPersonal = '$navZoznamy/Personal';
  static const String navZoznamyZiadostiOSkusku = '$navZoznamy/ZiadostiOSkusku';

  static const String navTerminyOsoby = '$navTerminy/Osoby';
  static const String navTerminyPracoviska = '$navTerminy/Pracoviska';

  static const String navOSOZoznam = '$navOSO/Zoznam';
}
