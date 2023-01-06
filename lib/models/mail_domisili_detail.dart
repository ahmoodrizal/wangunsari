class MailDomisiliDetailService {
  Rt? rt;
  Rw? rw;
  Surat? surat;
  SuratBody? suratBody;
  List<Trackings>? trackings;

  MailDomisiliDetailService({this.rt, this.rw, this.surat, this.suratBody, this.trackings});

  MailDomisiliDetailService.fromJson(Map<String, dynamic> json) {
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
  Null? kadesNip;
  String? kadesNama;
  String? kadesJabatan;
  Null? noSurat;
  String? noResi;
  Null? fotoPbb;
  Null? fotoKk;
  Null? regNo;
  String? tanggal;
  String? status;
  String? jenis;
  String? dibatalkan;
  Null? alasanDibatalkan;
  Null? tanggalDibatalkan;
  String? createdAt;
  String? updatedAt;
  Null? updatedBy;
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
  String? alamat;
  String? alamatAsal;
  String? tinggalSejak;
  String? nik;
  String? nama;
  Null? nikJenis;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? agama;
  String? pendidikan;
  String? pekerjaan;
  String? statusKawin;
  Null? noKk;
  String? wargaNegara;
  String? negaraNama;
  Null? noPassport;
  Null? kitasKitap;
  Null? fotoKtp;
  String? createdAt;
  String? updatedAt;
  Null? updatedBy;
  String? createdBy;
  String? tanggalLahirFormat;
  String? tanggalSejakFormat;

  SuratBody(
      {this.id,
      this.suratId,
      this.alamat,
      this.alamatAsal,
      this.tinggalSejak,
      this.nik,
      this.nama,
      this.nikJenis,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.agama,
      this.pendidikan,
      this.pekerjaan,
      this.statusKawin,
      this.noKk,
      this.wargaNegara,
      this.negaraNama,
      this.noPassport,
      this.kitasKitap,
      this.fotoKtp,
      this.createdAt,
      this.updatedAt,
      this.updatedBy,
      this.createdBy,
      this.tanggalLahirFormat,
      this.tanggalSejakFormat});

  SuratBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    suratId = json['surat_id'];
    alamat = json['alamat'];
    alamatAsal = json['alamat_asal'];
    tinggalSejak = json['tinggal_sejak'];
    nik = json['nik'];
    nama = json['nama'];
    nikJenis = json['nik_jenis'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    agama = json['agama'];
    pendidikan = json['pendidikan'];
    pekerjaan = json['pekerjaan'];
    statusKawin = json['status_kawin'];
    noKk = json['no_kk'];
    wargaNegara = json['warga_negara'];
    negaraNama = json['negara_nama'];
    noPassport = json['no_passport'];
    kitasKitap = json['kitas_kitap'];
    fotoKtp = json['foto_ktp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
    tanggalLahirFormat = json['tanggal_lahir_format'];
    tanggalSejakFormat = json['tanggal_sejak_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['surat_id'] = this.suratId;
    data['alamat'] = this.alamat;
    data['alamat_asal'] = this.alamatAsal;
    data['tinggal_sejak'] = this.tinggalSejak;
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['nik_jenis'] = this.nikJenis;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['agama'] = this.agama;
    data['pendidikan'] = this.pendidikan;
    data['pekerjaan'] = this.pekerjaan;
    data['status_kawin'] = this.statusKawin;
    data['no_kk'] = this.noKk;
    data['warga_negara'] = this.wargaNegara;
    data['negara_nama'] = this.negaraNama;
    data['no_passport'] = this.noPassport;
    data['kitas_kitap'] = this.kitasKitap;
    data['foto_ktp'] = this.fotoKtp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    data['tanggal_lahir_format'] = this.tanggalLahirFormat;
    data['tanggal_sejak_format'] = this.tanggalSejakFormat;
    return data;
  }
}

class Trackings {
  int? id;
  String? suratId;
  Null? dariPegawaiId;
  Null? kePegawaiId;
  String? keterangan;
  Null? catatan;
  String? waktu;
  String? dariNama;
  String? dariNip;
  String? keNama;
  String? keNip;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? updatedBy;
  Null? createdBy;
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
