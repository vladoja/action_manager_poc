enum PersonalRole {
  skusajuci("SKUSAJUCI"),
  prisediaci("PRISEDIACI"),
  predseda("PREDSEDA"),
  ministersky("MINISTERSKY");

  const PersonalRole(this.role);
  final String role;

  @override
  toString() {
    return role;
  }
}
