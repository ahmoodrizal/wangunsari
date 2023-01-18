class MailKelahiranDetailService {
  Rt? rt;
  Rw? rw;
  Surat? surat;
  SuratBody? suratBody;
  List<Trackings>? trackings;

  MailKelahiranDetailService({this.rt, this.rw, this.surat, this.suratBody, this.trackings});

  MailKelahiranDetailService.fromJson(Map<String, dynamic> json) {
    rt = json['rt'] != null ? new Rt.fromJson(json['rt']) : null;
    rw = json['rw'] != null ? new Rw.fromJson(json['rw']) : null;
    surat = json['surat'] != null ? new Surat.fromJson(json['surat']) : null;
    suratBody = json['surat_body'] != null ? new SuratBody.fromJson(json['surat_body']) : null;
    if (json['trackings'] != null) {
      trackings = <Trackings>[];
      json['trackings'].forEach((v) {
        trackings!.add(new Trackings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rt != null) {
      data['rt'] = this.rt!.toJson();
    }
    if (this.rw != null) {
      data['rw'] = this.rw!.toJson();
    }
    if (this.surat != null) {
      data['surat'] = this.surat!.toJson();
    }
    if (this.suratBody != null) {
      data['surat_body'] = this.suratBody!.toJson();
    }
    if (this.trackings != null) {
      data['trackings'] = this.trackings!.map((v) => v.toJson()).toList();
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
  String? updatedBy;
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
  String? updatedBy;
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

class Surat {
  int? id;
  String? pendudukId;
  String? untukPendudukId;
  String? rtId;
  String? rtPendId;
  String? rwPendId;
  String? kadesPendId;
  String? rwId;
  String? namaPenduduk;
  String? nikPenduduk;
  String? namaUntukPenduduk;
  String? nikUntukPenduduk;
  String? rtNik;
  String? rtNama;
  String? rwNik;
  String? rwNama;
  String? kadesNip;
  String? kadesNama;
  String? kadesJabatan;
  String? noSurat;
  String? noResi;
  String? fotoPbb;
  String? fotoKk;
  String? regNo;
  String? tanggal;
  String? status;
  String? jenis;
  String? dibatalkan;
  String? alasanDibatalkan;
  String? tanggalDibatalkan;
  String? createdAt;
  String? updatedAt;
  String? updatedBy;
  String? createdBy;
  String? tanggalFormat;
  String? tanggalDibatalkanFormat;
  String? tanggalDibatalkanWaktuFormat;

  Surat(
      {this.id,
      this.pendudukId,
      this.untukPendudukId,
      this.rtId,
      this.rtPendId,
      this.rwPendId,
      this.kadesPendId,
      this.rwId,
      this.namaPenduduk,
      this.nikPenduduk,
      this.namaUntukPenduduk,
      this.nikUntukPenduduk,
      this.rtNik,
      this.rtNama,
      this.rwNik,
      this.rwNama,
      this.kadesNip,
      this.kadesNama,
      this.kadesJabatan,
      this.noSurat,
      this.noResi,
      this.fotoPbb,
      this.fotoKk,
      this.regNo,
      this.tanggal,
      this.status,
      this.jenis,
      this.dibatalkan,
      this.alasanDibatalkan,
      this.tanggalDibatalkan,
      this.createdAt,
      this.updatedAt,
      this.updatedBy,
      this.createdBy,
      this.tanggalFormat,
      this.tanggalDibatalkanFormat,
      this.tanggalDibatalkanWaktuFormat});

  Surat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pendudukId = json['penduduk_id'];
    untukPendudukId = json['untuk_penduduk_id'];
    rtId = json['rt_id'];
    rtPendId = json['rt_pend_id'];
    rwPendId = json['rw_pend_id'];
    kadesPendId = json['kades_pend_id'];
    rwId = json['rw_id'];
    namaPenduduk = json['nama_penduduk'];
    nikPenduduk = json['nik_penduduk'];
    namaUntukPenduduk = json['nama_untuk_penduduk'];
    nikUntukPenduduk = json['nik_untuk_penduduk'];
    rtNik = json['rt_nik'];
    rtNama = json['rt_nama'];
    rwNik = json['rw_nik'];
    rwNama = json['rw_nama'];
    kadesNip = json['kades_nip'];
    kadesNama = json['kades_nama'];
    kadesJabatan = json['kades_jabatan'];
    noSurat = json['no_surat'];
    noResi = json['no_resi'];
    fotoPbb = json['foto_pbb'];
    fotoKk = json['foto_kk'];
    regNo = json['reg_no'];
    tanggal = json['tanggal'];
    status = json['status'];
    jenis = json['jenis'];
    dibatalkan = json['dibatalkan'];
    alasanDibatalkan = json['alasan_dibatalkan'];
    tanggalDibatalkan = json['tanggal_dibatalkan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
    tanggalFormat = json['tanggal_format'];
    tanggalDibatalkanFormat = json['tanggal_dibatalkan_format'];
    tanggalDibatalkanWaktuFormat = json['tanggal_dibatalkan_waktu_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['penduduk_id'] = this.pendudukId;
    data['untuk_penduduk_id'] = this.untukPendudukId;
    data['rt_id'] = this.rtId;
    data['rt_pend_id'] = this.rtPendId;
    data['rw_pend_id'] = this.rwPendId;
    data['kades_pend_id'] = this.kadesPendId;
    data['rw_id'] = this.rwId;
    data['nama_penduduk'] = this.namaPenduduk;
    data['nik_penduduk'] = this.nikPenduduk;
    data['nama_untuk_penduduk'] = this.namaUntukPenduduk;
    data['nik_untuk_penduduk'] = this.nikUntukPenduduk;
    data['rt_nik'] = this.rtNik;
    data['rt_nama'] = this.rtNama;
    data['rw_nik'] = this.rwNik;
    data['rw_nama'] = this.rwNama;
    data['kades_nip'] = this.kadesNip;
    data['kades_nama'] = this.kadesNama;
    data['kades_jabatan'] = this.kadesJabatan;
    data['no_surat'] = this.noSurat;
    data['no_resi'] = this.noResi;
    data['foto_pbb'] = this.fotoPbb;
    data['foto_kk'] = this.fotoKk;
    data['reg_no'] = this.regNo;
    data['tanggal'] = this.tanggal;
    data['status'] = this.status;
    data['jenis'] = this.jenis;
    data['dibatalkan'] = this.dibatalkan;
    data['alasan_dibatalkan'] = this.alasanDibatalkan;
    data['tanggal_dibatalkan'] = this.tanggalDibatalkan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    data['tanggal_format'] = this.tanggalFormat;
    data['tanggal_dibatalkan_format'] = this.tanggalDibatalkanFormat;
    data['tanggal_dibatalkan_waktu_format'] = this.tanggalDibatalkanWaktuFormat;
    return data;
  }
}

class SuratBody {
  int? id;
  String? suratId;
  String? ayahId;
  String? ibuId;
  String? namaAnak;
  String? tempatLahir;
  String? tanggalLahir;
  String? waktuLahir;
  String? anakKe;
  String? berat;
  String? panjang;
  String? jenisKelamin;
  String? ibuNama;
  String? ibuNik;
  String? ibuNikJenis;
  String? ibuJenisKelamin;
  String? ibuTempatLahir;
  String? ibuTanggalLahir;
  String? ibuAgama;
  String? ibuPendidikan;
  String? ibuPekerjaan;
  String? ibuStatusKawin;
  String? ibuNoKk;
  String? ibuWargaNegara;
  String? ibuNegaraNama;
  String? ibuNoPassport;
  String? ibuKitasKitap;
  String? ibuFotoKtp;
  String? ibuAlamat;
  String? ayahNama;
  String? ayahNik;
  String? ayahNikJenis;
  String? ayahJenisKelamin;
  String? ayahTempatLahir;
  String? ayahTanggalLahir;
  String? ayahAgama;
  String? ayahPendidikan;
  String? ayahPekerjaan;
  String? ayahStatusKawin;
  String? ayahNoKk;
  String? ayahWargaNegara;
  String? ayahNegaraNama;
  String? ayahNoPassport;
  String? ayahKitasKitap;
  String? ayahFotoKtp;
  String? ayahAlamat;
  String? createdAt;
  String? updatedAt;
  String? updatedBy;
  String? createdBy;
  String? tanggalLahirFormat;
  String? pukulFormat;

  SuratBody(
      {this.id,
      this.suratId,
      this.ayahId,
      this.ibuId,
      this.namaAnak,
      this.tempatLahir,
      this.tanggalLahir,
      this.waktuLahir,
      this.anakKe,
      this.berat,
      this.panjang,
      this.jenisKelamin,
      this.ibuNama,
      this.ibuNik,
      this.ibuNikJenis,
      this.ibuJenisKelamin,
      this.ibuTempatLahir,
      this.ibuTanggalLahir,
      this.ibuAgama,
      this.ibuPendidikan,
      this.ibuPekerjaan,
      this.ibuStatusKawin,
      this.ibuNoKk,
      this.ibuWargaNegara,
      this.ibuNegaraNama,
      this.ibuNoPassport,
      this.ibuKitasKitap,
      this.ibuFotoKtp,
      this.ibuAlamat,
      this.ayahNama,
      this.ayahNik,
      this.ayahNikJenis,
      this.ayahJenisKelamin,
      this.ayahTempatLahir,
      this.ayahTanggalLahir,
      this.ayahAgama,
      this.ayahPendidikan,
      this.ayahPekerjaan,
      this.ayahStatusKawin,
      this.ayahNoKk,
      this.ayahWargaNegara,
      this.ayahNegaraNama,
      this.ayahNoPassport,
      this.ayahKitasKitap,
      this.ayahFotoKtp,
      this.ayahAlamat,
      this.createdAt,
      this.updatedAt,
      this.updatedBy,
      this.createdBy,
      this.tanggalLahirFormat,
      this.pukulFormat});

  SuratBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    suratId = json['surat_id'];
    ayahId = json['ayah_id'];
    ibuId = json['ibu_id'];
    namaAnak = json['nama_anak'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    waktuLahir = json['waktu_lahir'];
    anakKe = json['anak_ke'];
    berat = json['berat'];
    panjang = json['panjang'];
    jenisKelamin = json['jenis_kelamin'];
    ibuNama = json['ibu_nama'];
    ibuNik = json['ibu_nik'];
    ibuNikJenis = json['ibu_nik_jenis'];
    ibuJenisKelamin = json['ibu_jenis_kelamin'];
    ibuTempatLahir = json['ibu_tempat_lahir'];
    ibuTanggalLahir = json['ibu_tanggal_lahir'];
    ibuAgama = json['ibu_agama'];
    ibuPendidikan = json['ibu_pendidikan'];
    ibuPekerjaan = json['ibu_pekerjaan'];
    ibuStatusKawin = json['ibu_status_kawin'];
    ibuNoKk = json['ibu_no_kk'];
    ibuWargaNegara = json['ibu_warga_negara'];
    ibuNegaraNama = json['ibu_negara_nama'];
    ibuNoPassport = json['ibu_no_passport'];
    ibuKitasKitap = json['ibu_kitas_kitap'];
    ibuFotoKtp = json['ibu_foto_ktp'];
    ibuAlamat = json['ibu_alamat'];
    ayahNama = json['ayah_nama'];
    ayahNik = json['ayah_nik'];
    ayahNikJenis = json['ayah_nik_jenis'];
    ayahJenisKelamin = json['ayah_jenis_kelamin'];
    ayahTempatLahir = json['ayah_tempat_lahir'];
    ayahTanggalLahir = json['ayah_tanggal_lahir'];
    ayahAgama = json['ayah_agama'];
    ayahPendidikan = json['ayah_pendidikan'];
    ayahPekerjaan = json['ayah_pekerjaan'];
    ayahStatusKawin = json['ayah_status_kawin'];
    ayahNoKk = json['ayah_no_kk'];
    ayahWargaNegara = json['ayah_warga_negara'];
    ayahNegaraNama = json['ayah_negara_nama'];
    ayahNoPassport = json['ayah_no_passport'];
    ayahKitasKitap = json['ayah_kitas_kitap'];
    ayahFotoKtp = json['ayah_foto_ktp'];
    ayahAlamat = json['ayah_alamat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
    tanggalLahirFormat = json['tanggal_lahir_format'];
    pukulFormat = json['pukul_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['surat_id'] = this.suratId;
    data['ayah_id'] = this.ayahId;
    data['ibu_id'] = this.ibuId;
    data['nama_anak'] = this.namaAnak;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['waktu_lahir'] = this.waktuLahir;
    data['anak_ke'] = this.anakKe;
    data['berat'] = this.berat;
    data['panjang'] = this.panjang;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['ibu_nama'] = this.ibuNama;
    data['ibu_nik'] = this.ibuNik;
    data['ibu_nik_jenis'] = this.ibuNikJenis;
    data['ibu_jenis_kelamin'] = this.ibuJenisKelamin;
    data['ibu_tempat_lahir'] = this.ibuTempatLahir;
    data['ibu_tanggal_lahir'] = this.ibuTanggalLahir;
    data['ibu_agama'] = this.ibuAgama;
    data['ibu_pendidikan'] = this.ibuPendidikan;
    data['ibu_pekerjaan'] = this.ibuPekerjaan;
    data['ibu_status_kawin'] = this.ibuStatusKawin;
    data['ibu_no_kk'] = this.ibuNoKk;
    data['ibu_warga_negara'] = this.ibuWargaNegara;
    data['ibu_negara_nama'] = this.ibuNegaraNama;
    data['ibu_no_passport'] = this.ibuNoPassport;
    data['ibu_kitas_kitap'] = this.ibuKitasKitap;
    data['ibu_foto_ktp'] = this.ibuFotoKtp;
    data['ibu_alamat'] = this.ibuAlamat;
    data['ayah_nama'] = this.ayahNama;
    data['ayah_nik'] = this.ayahNik;
    data['ayah_nik_jenis'] = this.ayahNikJenis;
    data['ayah_jenis_kelamin'] = this.ayahJenisKelamin;
    data['ayah_tempat_lahir'] = this.ayahTempatLahir;
    data['ayah_tanggal_lahir'] = this.ayahTanggalLahir;
    data['ayah_agama'] = this.ayahAgama;
    data['ayah_pendidikan'] = this.ayahPendidikan;
    data['ayah_pekerjaan'] = this.ayahPekerjaan;
    data['ayah_status_kawin'] = this.ayahStatusKawin;
    data['ayah_no_kk'] = this.ayahNoKk;
    data['ayah_warga_negara'] = this.ayahWargaNegara;
    data['ayah_negara_nama'] = this.ayahNegaraNama;
    data['ayah_no_passport'] = this.ayahNoPassport;
    data['ayah_kitas_kitap'] = this.ayahKitasKitap;
    data['ayah_foto_ktp'] = this.ayahFotoKtp;
    data['ayah_alamat'] = this.ayahAlamat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    data['tanggal_lahir_format'] = this.tanggalLahirFormat;
    data['pukul_format'] = this.pukulFormat;
    return data;
  }
}

class Trackings {
  int? id;
  String? suratId;
  String? dariPegawaiId;
  String? kePegawaiId;
  String? keterangan;
  String? catatan;
  String? waktu;
  String? dariNama;
  String? dariNip;
  String? keNama;
  String? keNip;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? updatedBy;
  String? createdBy;
  String? waktuOrigin;

  Trackings(
      {this.id,
      this.suratId,
      this.dariPegawaiId,
      this.kePegawaiId,
      this.keterangan,
      this.catatan,
      this.waktu,
      this.dariNama,
      this.dariNip,
      this.keNama,
      this.keNip,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.updatedBy,
      this.createdBy,
      this.waktuOrigin});

  Trackings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    suratId = json['surat_id'];
    dariPegawaiId = json['dari_pegawai_id'];
    kePegawaiId = json['ke_pegawai_id'];
    keterangan = json['keterangan'];
    catatan = json['catatan'];
    waktu = json['waktu'];
    dariNama = json['dari_nama'];
    dariNip = json['dari_nip'];
    keNama = json['ke_nama'];
    keNip = json['ke_nip'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
    waktuOrigin = json['waktu_origin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['surat_id'] = this.suratId;
    data['dari_pegawai_id'] = this.dariPegawaiId;
    data['ke_pegawai_id'] = this.kePegawaiId;
    data['keterangan'] = this.keterangan;
    data['catatan'] = this.catatan;
    data['waktu'] = this.waktu;
    data['dari_nama'] = this.dariNama;
    data['dari_nip'] = this.dariNip;
    data['ke_nama'] = this.keNama;
    data['ke_nip'] = this.keNip;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    data['waktu_origin'] = this.waktuOrigin;
    return data;
  }
}
