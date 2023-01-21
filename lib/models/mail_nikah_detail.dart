class MailNikahDetailService {
  Rt? rt;
  Rw? rw;
  Surat? surat;
  SuratBody? suratBody;
  List<Trackings>? trackings;

  MailNikahDetailService({this.rt, this.rw, this.surat, this.suratBody, this.trackings});

  MailNikahDetailService.fromJson(Map<String, dynamic> json) {
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
  String? ibuId;
  String? ayahId;
  String? anakId;
  String? calonId;
  String? tanggal;
  String? waktu;
  String? tempat;
  String? denganSeorang;
  String? calonA;
  String? calonB;
  String? ibuNik;
  String? ibuNama;
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
  String? ayahNik;
  String? ayahNama;
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
  String? anakNik;
  String? anakNama;
  String? anakNikJenis;
  String? anakJenisKelamin;
  String? anakTempatLahir;
  String? anakTanggalLahir;
  String? anakAgama;
  String? anakPendidikan;
  String? anakPekerjaan;
  String? anakStatusKawin;
  String? anakNoKk;
  String? anakWargaNegara;
  String? anakNegaraNama;
  String? anakNoPassport;
  String? anakKitasKitap;
  String? anakFotoKtp;
  String? anakAlamat;
  String? calonNik;
  String? calonNama;
  String? calonNikJenis;
  String? calonJenisKelamin;
  String? calonTempatLahir;
  String? calonTanggalLahir;
  String? calonAgama;
  String? calonPendidikan;
  String? calonPekerjaan;
  String? calonStatusKawin;
  String? calonNoKk;
  String? calonWargaNegara;
  String? calonNegaraNama;
  String? calonNoPassport;
  String? calonKitasKitap;
  String? calonFotoKtp;
  String? calonAlamat;
  String? createdAt;
  String? updatedAt;
  String? updatedBy;
  String? createdBy;
  int? ayahUmur;
  int? ibuUmur;

  SuratBody(
      {this.id,
      this.suratId,
      this.ibuId,
      this.ayahId,
      this.anakId,
      this.calonId,
      this.tanggal,
      this.waktu,
      this.tempat,
      this.denganSeorang,
      this.calonA,
      this.calonB,
      this.ibuNik,
      this.ibuNama,
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
      this.ayahNik,
      this.ayahNama,
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
      this.anakNik,
      this.anakNama,
      this.anakNikJenis,
      this.anakJenisKelamin,
      this.anakTempatLahir,
      this.anakTanggalLahir,
      this.anakAgama,
      this.anakPendidikan,
      this.anakPekerjaan,
      this.anakStatusKawin,
      this.anakNoKk,
      this.anakWargaNegara,
      this.anakNegaraNama,
      this.anakNoPassport,
      this.anakKitasKitap,
      this.anakFotoKtp,
      this.anakAlamat,
      this.calonNik,
      this.calonNama,
      this.calonNikJenis,
      this.calonJenisKelamin,
      this.calonTempatLahir,
      this.calonTanggalLahir,
      this.calonAgama,
      this.calonPendidikan,
      this.calonPekerjaan,
      this.calonStatusKawin,
      this.calonNoKk,
      this.calonWargaNegara,
      this.calonNegaraNama,
      this.calonNoPassport,
      this.calonKitasKitap,
      this.calonFotoKtp,
      this.calonAlamat,
      this.createdAt,
      this.updatedAt,
      this.updatedBy,
      this.createdBy,
      this.ayahUmur,
      this.ibuUmur});

  SuratBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    suratId = json['surat_id'];
    ibuId = json['ibu_id'];
    ayahId = json['ayah_id'];
    anakId = json['anak_id'];
    calonId = json['calon_id'];
    tanggal = json['tanggal'];
    waktu = json['waktu'];
    tempat = json['tempat'];
    denganSeorang = json['dengan_seorang'];
    calonA = json['calon_a'];
    calonB = json['calon_b'];
    ibuNik = json['ibu_nik'];
    ibuNama = json['ibu_nama'];
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
    ayahNik = json['ayah_nik'];
    ayahNama = json['ayah_nama'];
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
    anakNik = json['anak_nik'];
    anakNama = json['anak_nama'];
    anakNikJenis = json['anak_nik_jenis'];
    anakJenisKelamin = json['anak_jenis_kelamin'];
    anakTempatLahir = json['anak_tempat_lahir'];
    anakTanggalLahir = json['anak_tanggal_lahir'];
    anakAgama = json['anak_agama'];
    anakPendidikan = json['anak_pendidikan'];
    anakPekerjaan = json['anak_pekerjaan'];
    anakStatusKawin = json['anak_status_kawin'];
    anakNoKk = json['anak_no_kk'];
    anakWargaNegara = json['anak_warga_negara'];
    anakNegaraNama = json['anak_negara_nama'];
    anakNoPassport = json['anak_no_passport'];
    anakKitasKitap = json['anak_kitas_kitap'];
    anakFotoKtp = json['anak_foto_ktp'];
    anakAlamat = json['anak_alamat'];
    calonNik = json['calon_nik'];
    calonNama = json['calon_nama'];
    calonNikJenis = json['calon_nik_jenis'];
    calonJenisKelamin = json['calon_jenis_kelamin'];
    calonTempatLahir = json['calon_tempat_lahir'];
    calonTanggalLahir = json['calon_tanggal_lahir'];
    calonAgama = json['calon_agama'];
    calonPendidikan = json['calon_pendidikan'];
    calonPekerjaan = json['calon_pekerjaan'];
    calonStatusKawin = json['calon_status_kawin'];
    calonNoKk = json['calon_no_kk'];
    calonWargaNegara = json['calon_warga_negara'];
    calonNegaraNama = json['calon_negara_nama'];
    calonNoPassport = json['calon_no_passport'];
    calonKitasKitap = json['calon_kitas_kitap'];
    calonFotoKtp = json['calon_foto_ktp'];
    calonAlamat = json['calon_alamat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
    ayahUmur = json['ayah_umur'];
    ibuUmur = json['ibu_umur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['surat_id'] = this.suratId;
    data['ibu_id'] = this.ibuId;
    data['ayah_id'] = this.ayahId;
    data['anak_id'] = this.anakId;
    data['calon_id'] = this.calonId;
    data['tanggal'] = this.tanggal;
    data['waktu'] = this.waktu;
    data['tempat'] = this.tempat;
    data['dengan_seorang'] = this.denganSeorang;
    data['calon_a'] = this.calonA;
    data['calon_b'] = this.calonB;
    data['ibu_nik'] = this.ibuNik;
    data['ibu_nama'] = this.ibuNama;
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
    data['ayah_nik'] = this.ayahNik;
    data['ayah_nama'] = this.ayahNama;
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
    data['anak_nik'] = this.anakNik;
    data['anak_nama'] = this.anakNama;
    data['anak_nik_jenis'] = this.anakNikJenis;
    data['anak_jenis_kelamin'] = this.anakJenisKelamin;
    data['anak_tempat_lahir'] = this.anakTempatLahir;
    data['anak_tanggal_lahir'] = this.anakTanggalLahir;
    data['anak_agama'] = this.anakAgama;
    data['anak_pendidikan'] = this.anakPendidikan;
    data['anak_pekerjaan'] = this.anakPekerjaan;
    data['anak_status_kawin'] = this.anakStatusKawin;
    data['anak_no_kk'] = this.anakNoKk;
    data['anak_warga_negara'] = this.anakWargaNegara;
    data['anak_negara_nama'] = this.anakNegaraNama;
    data['anak_no_passport'] = this.anakNoPassport;
    data['anak_kitas_kitap'] = this.anakKitasKitap;
    data['anak_foto_ktp'] = this.anakFotoKtp;
    data['anak_alamat'] = this.anakAlamat;
    data['calon_nik'] = this.calonNik;
    data['calon_nama'] = this.calonNama;
    data['calon_nik_jenis'] = this.calonNikJenis;
    data['calon_jenis_kelamin'] = this.calonJenisKelamin;
    data['calon_tempat_lahir'] = this.calonTempatLahir;
    data['calon_tanggal_lahir'] = this.calonTanggalLahir;
    data['calon_agama'] = this.calonAgama;
    data['calon_pendidikan'] = this.calonPendidikan;
    data['calon_pekerjaan'] = this.calonPekerjaan;
    data['calon_status_kawin'] = this.calonStatusKawin;
    data['calon_no_kk'] = this.calonNoKk;
    data['calon_warga_negara'] = this.calonWargaNegara;
    data['calon_negara_nama'] = this.calonNegaraNama;
    data['calon_no_passport'] = this.calonNoPassport;
    data['calon_kitas_kitap'] = this.calonKitasKitap;
    data['calon_foto_ktp'] = this.calonFotoKtp;
    data['calon_alamat'] = this.calonAlamat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    data['ayah_umur'] = this.ayahUmur;
    data['ibu_umur'] = this.ibuUmur;
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
