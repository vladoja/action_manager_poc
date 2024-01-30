enum ExamEventAppliationStatus {
  vytvoreny("VYTVORENY"),
  aktivny("AKTIVNY"),
  odhlaseny("ODHLASENY"),
  ukonceny_neuspesne("UKONCENY_NEUSPESNE"),
  ukonceny_uspesny("UKONCENY_USPESNY");

  const ExamEventAppliationStatus(this.role);
  final String role;

  @override
  toString() {
    return role;
  }
}
