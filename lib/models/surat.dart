class SuratService {
  int? dataTotal;
  int? dataFiltered;
  List<Surats>? surats;

  SuratService({this.dataTotal, this.dataFiltered, this.surats});

  SuratService.fromJson(Map<String, dynamic> json) {
    dataTotal = json['data_total'];
    dataFiltered = json['data_filtered'];
    if (json['surats'] != null) {
      surats = <Surats>[];
      json['surats'].forEach((v) {
        surats!.add(new Surats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_total'] = this.dataTotal;
    data['data_filtered'] = this.dataFiltered;
    if (this.surats != null) {
      data['surats'] = this.surats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Surats {
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
  String? created;
  String? createdStr;
  String? updated;
  String? updatedStr;
  String? createdByStr;
  Null? updatedByStr;
  String? tanggalStr;
  String? trackingStatus;
  String? trackingWaktu;
  String? trackingDariNama;
  String? trackingKeNama;
  String? trackingKeterangan;
  String? trackingWaktuFormat;
  int? dTRowIndex;

  Surats(
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
      this.created,
      this.createdStr,
      this.updated,
      this.updatedStr,
      this.createdByStr,
      this.updatedByStr,
      this.tanggalStr,
      this.trackingStatus,
      this.trackingWaktu,
      this.trackingDariNama,
      this.trackingKeNama,
      this.trackingKeterangan,
      this.trackingWaktuFormat,
      this.dTRowIndex});

  Surats.fromJson(Map<String, dynamic> json) {
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
    created = json['created'];
    createdStr = json['created_str'];
    updated = json['updated'];
    updatedStr = json['updated_str'];
    createdByStr = json['created_by_str'];
    updatedByStr = json['updated_by_str'];
    tanggalStr = json['tanggal_str'];
    trackingStatus = json['tracking_status'];
    trackingWaktu = json['tracking_waktu'];
    trackingDariNama = json['tracking_dari_nama'];
    trackingKeNama = json['tracking_ke_nama'];
    trackingKeterangan = json['tracking_keterangan'];
    trackingWaktuFormat = json['tracking_waktu_format'];
    dTRowIndex = json['DT_RowIndex'];
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
    data['created'] = this.created;
    data['created_str'] = this.createdStr;
    data['updated'] = this.updated;
    data['updated_str'] = this.updatedStr;
    data['created_by_str'] = this.createdByStr;
    data['updated_by_str'] = this.updatedByStr;
    data['tanggal_str'] = this.tanggalStr;
    data['tracking_status'] = this.trackingStatus;
    data['tracking_waktu'] = this.trackingWaktu;
    data['tracking_dari_nama'] = this.trackingDariNama;
    data['tracking_ke_nama'] = this.trackingKeNama;
    data['tracking_keterangan'] = this.trackingKeterangan;
    data['tracking_waktu_format'] = this.trackingWaktuFormat;
    data['DT_RowIndex'] = this.dTRowIndex;
    return data;
  }
}
