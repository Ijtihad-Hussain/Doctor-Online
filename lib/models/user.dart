class AppUser {
  String id;
  String name;
  String? email;
  String avatarUrl;

  AppUser({required this.id, required this.name, required this.avatarUrl, this.email});
}
