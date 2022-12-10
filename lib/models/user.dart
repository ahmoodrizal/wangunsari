class User {
  String? token;
  int? id;
  String? name;
  String? email;
  String? nik;
  String? pendudukId;
  String? profile;

  User({
    this.token,
    this.id,
    this.name,
    this.email,
    this.nik,
    this.pendudukId,
    this.profile,
  });

  // function to convert json data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['data']['access_token'],
      id: json['data']['user']['id'],
      name: json['data']['user']['name'],
      email: json['data']['user']['email'],
      nik: json['data']['user']['nik'],
      pendudukId: json['data']['user']['penduduk_id'],
      profile: json['data']['user']['profile_photo_url'],
    );
  }
}
