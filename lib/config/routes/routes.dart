import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:action_manager_poc/features/app/domain/entities/person/person.dart';
import 'package:action_manager_poc/features/app/presentation/pages/akcie/akcie_page.dart';
import 'package:action_manager_poc/features/app/presentation/pages/akcie/edit_action_page.dart';
import 'package:action_manager_poc/features/app/presentation/pages/home/home_page.dart';
import 'package:action_manager_poc/features/app/presentation/pages/personal/edit_person_page.dart';
import 'package:action_manager_poc/features/app/presentation/pages/personal/personal_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomePage());

      case '/Personal':
        return _materialRoute(const PersonalPage());
      case '/Personal/New':
        return _materialRoute(const EditPersonPage());
      case '/Personal/Details':
        PersonEntity? person = settings.arguments as PersonEntity?;
        return _materialRoute(EditPersonPage(
          person: person,
        ));
      case '/Akcie':
        return _materialRoute(const AkciePage());
      case '/Akcie/New':
        return _materialRoute(const EditActionPage());
      case '/Akcie/Details':
        ActionEntity? action = settings.arguments as ActionEntity?;
        return _materialRoute(EditActionPage(
          action: action,
        ));
      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(
      builder: (_) => view,
    );
  }
}
