class SuratDetailService {
  Surat? surat;
  List<Trackings>? trackings;

  SuratDetailService({this.surat, this.trackings});

  SuratDetailService.fromJson(Map<String, dynamic> json) {
    surat = json['surat'] != null ? Surat.fromJson(json['surat']) : null;
    if (json['trackings'] != null) {
      trackings = <Trackings>[];
      json['trackings'].forEach((v) {
        trackings!.add(Trackings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.surat != null) {
      data['surat'] = this.surat!.toJson();
    }
    if (this.trackings != null) {
      data['trackings'] = this.trackings!.map((v) => v.toJson()).toList();
    }
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
      this.createdBy});

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
