class Myprofile {
  final String? assetimagepath;
  final String? name;
  final String? aboutme;
  final String? username;
  final String? surname;

  const Myprofile(
      {this.aboutme,
      this.assetimagepath,
      this.name,
      this.username,
      this.surname});

  static const ilmioprofilo = Myprofile(
      aboutme: 'Student at ITS Incom, this website is made with Flutter',
      assetimagepath: 'android/assets/minecraftcharacter.png',
      name: 'Edoardo',
      surname: 'Remondini',
      username: '@devedo');
}
