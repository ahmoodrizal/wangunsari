class UserService {
  Data? data;

  UserService({this.data});

  UserService.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  User? user;

  Data({this.accessToken, this.tokenType, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  Null? email;
  String? nik;
  Null? emailVerifiedAt;
  Null? twoFactorConfirmedAt;
  Null? currentTeamId;
  Null? profilePhotoPath;
  String? active;
  String? createdAt;
  String? updatedAt;
  String? pendudukId;
  Null? updatedBy;
  String? createdBy;
  String? profilePhotoUrl;
  List<Roles>? roles;
  Penduduk? penduduk;

  User(
      {this.id,
      this.name,
      this.email,
      this.nik,
      this.emailVerifiedAt,
      this.twoFactorConfirmedAt,
      this.currentTeamId,
      this.profilePhotoPath,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.pendudukId,
      this.updatedBy,
      this.createdBy,
      this.profilePhotoUrl,
      this.roles,
      this.penduduk});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nik = json['nik'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pendudukId = json['penduduk_id'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
    profilePhotoUrl = json['profile_photo_url'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    penduduk = json['penduduk'] != null ? new Penduduk.fromJson(json['penduduk']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['nik'] = this.nik;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['penduduk_id'] = this.pendudukId;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    data['profile_photo_url'] = this.profilePhotoUrl;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.penduduk != null) {
      data['penduduk'] = this.penduduk!.toJson();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles({this.id, this.name, this.guardName, this.createdAt, this.updatedAt, this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? modelId;
  String? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_id'] = this.modelId;
    data['role_id'] = this.roleId;
    data['model_type'] = this.modelType;
    return data;
  }
}

class Penduduk {
  int? id;
  String? rtId;
  String? nik;
  String? nama;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  Null? tanggalMati;
  String? agama;
  String? pendidikan;
  String? pekerjaan;
  String? statusKawin;
  String? noKk;
  String? hubDgnKk;
  String? hubDgnKkUrutan;
  String? wargaNegara;
  String? negaraNama;
  Null? noPassport;
  Null? kitasKitap;
  Null? fotoKtp;
  String? alamat;
  String? pendudukAda;
  String? createdAt;
  String? updatedAt;
  Null? updatedBy;
  String? createdBy;
  String? tanggalLahirText;
  Rt? rt;
  Rw? rw;

  Penduduk(
      {this.id,
      this.rtId,
      this.nik,
      this.nama,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.tanggalMati,
      this.agama,
      this.pendidikan,
      this.pekerjaan,
      this.statusKawin,
      this.noKk,
      this.hubDgnKk,
      this.hubDgnKkUrutan,
      this.wargaNegara,
      this.negaraNama,
      this.noPassport,
      this.kitasKitap,
      this.fotoKtp,
      this.alamat,
      this.pendudukAda,
      this.createdAt,
      this.updatedAt,
      this.updatedBy,
      this.createdBy,
      this.tanggalLahirText,
      this.rt,
      this.rw});

  Penduduk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rtId = json['rt_id'];
    nik = json['nik'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    tanggalMati = json['tanggal_mati'];
    agama = json['agama'];
    pendidikan = json['pendidikan'];
    pekerjaan = json['pekerjaan'];
    statusKawin = json['status_kawin'];
    noKk = json['no_kk'];
    hubDgnKk = json['hub_dgn_kk'];
    hubDgnKkUrutan = json['hub_dgn_kk_urutan'];
    wargaNegara = json['warga_negara'];
    negaraNama = json['negara_nama'];
    noPassport = json['no_passport'];
    kitasKitap = json['kitas_kitap'];
    fotoKtp = json['foto_ktp'];
    alamat = json['alamat'];
    pendudukAda = json['penduduk_ada'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
    tanggalLahirText = json['tanggal_lahir_text'];
    rt = json['rt'] != null ? new Rt.fromJson(json['rt']) : null;
    rw = json['rw'] != null ? new Rw.fromJson(json['rw']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rt_id'] = this.rtId;
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['tanggal_mati'] = this.tanggalMati;
    data['agama'] = this.agama;
    data['pendidikan'] = this.pendidikan;
    data['pekerjaan'] = this.pekerjaan;
    data['status_kawin'] = this.statusKawin;
    data['no_kk'] = this.noKk;
    data['hub_dgn_kk'] = this.hubDgnKk;
    data['hub_dgn_kk_urutan'] = this.hubDgnKkUrutan;
    data['warga_negara'] = this.wargaNegara;
    data['negara_nama'] = this.negaraNama;
    data['no_passport'] = this.noPassport;
    data['kitas_kitap'] = this.kitasKitap;
    data['foto_ktp'] = this.fotoKtp;
    data['alamat'] = this.alamat;
    data['penduduk_ada'] = this.pendudukAda;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    data['tanggal_lahir_text'] = this.tanggalLahirText;
    if (this.rt != null) {
      data['rt'] = this.rt!.toJson();
    }
    if (this.rw != null) {
      data['rw'] = this.rw!.toJson();
    }
    return data;
  }
}

class Rt {
  int? id;
  String? nomor;
  String? namaDaerah;
  String? rwId;
  String? createdAt;
  String? updatedAt;
  Null? updatedBy;
  String? createdBy;

  Rt({this.id, this.nomor, this.namaDaerah, this.rwId, this.createdAt, this.updatedAt, this.updatedBy, this.createdBy});

  Rt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomor = json['nomor'];
    namaDaerah = json['nama_daerah'];
    rwId = json['rw_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomor'] = this.nomor;
    data['nama_daerah'] = this.namaDaerah;
    data['rw_id'] = this.rwId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    return data;
  }
}

class Rw {
  int? id;
  String? nomor;
  String? createdAt;
  String? updatedAt;
  Null? updatedBy;
  String? createdBy;

  Rw({this.id, this.nomor, this.createdAt, this.updatedAt, this.updatedBy, this.createdBy});

  Rw.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomor = json['nomor'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomor'] = this.nomor;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    return data;
  }
}
