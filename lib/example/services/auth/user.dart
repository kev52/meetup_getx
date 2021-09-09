class User {}

class AuthenticatedUser extends User {
  final String identifier;
  final String name;

  AuthenticatedUser(this.identifier, this.name);
}
