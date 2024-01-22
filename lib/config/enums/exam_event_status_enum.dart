enum ExamEventStatus {
  aktivny("AKTIVNY"),
  ukonceny_neuspesne("UKONCENY_NEUSPESNE"),
  ukonceny_uspesny("UKONCENY_USPESNY");

  const ExamEventStatus(this.role);
  final String role;

  @override
  toString() {
    return role;
  }
}
