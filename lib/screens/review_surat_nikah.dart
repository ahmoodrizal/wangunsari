import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/components/detail_line.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/mail_nikah_detail.dart';
import 'package:wangunsari/services/admin_rt.dart';
import 'package:wangunsari/services/admin_rw.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';

class ReviewSuratNikah extends StatefulWidget {
  final String id;
  final String tipe;
  const ReviewSuratNikah({super.key, required this.id, required this.tipe});

  @override
  State<ReviewSuratNikah> createState() => _ReviewSuratNikahState();
}

class _ReviewSuratNikahState extends State<ReviewSuratNikah> {
  MailNikahDetailService? nikahDetail;
  bool _loading = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController infoField = TextEditingController();
  TextEditingController notefield = TextEditingController();
  TextEditingController regField = TextEditingController();
  String calonA = '';
  String calonB = '';

  void _getNikahDetail() async {
    ApiResponse response = await nikahMailDetail(widget.id);
    if (response.error == null) {
      setState(() {
        nikahDetail = response.data as MailNikahDetailService;
        switch (nikahDetail!.suratBody!.calonA) {
          case 'Mempelai Pria':
            calonA = 'LAKI-LAKI';
            calonB = 'PEREMPUAN';
            break;
          case 'Mempelai Wanita':
            calonA = 'PEREMPUAN';
            calonB = 'LAKI-LAKI';
            break;
          default:
            calonA = 'Error';
            calonB = 'Error';
        }
        _loading = false;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => context.goNamed('login'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

  // fungis terima surat oleh rt
  void _approveRTMailFunc() async {
    ApiResponse response = await approveRTMails(widget.id, infoField.text, notefield.text);
    if (response.error == null) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Surat Berhasil Disetujui',
            style: darkTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: (() => context.goNamed('admin-rt-area')),
              child: Text('Ok', style: darkTextStyle),
            ),
          ],
        ),
      );
    } else if (response.error == unauthorized) {
      logout().then((value) => context.goNamed('login'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

// fungis terima surat oleh rw
  void _approveRWMailFunc() async {
    ApiResponse response = await approveRWMails(widget.id, infoField.text, notefield.text, regField.text);
    if (response.error == null) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Surat Berhasil Disetujui',
            style: darkTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: (() => context.goNamed('admin-rw-area')),
              child: Text('Ok', style: darkTextStyle),
            ),
          ],
        ),
      );
    } else if (response.error == unauthorized) {
      logout().then((value) => context.goNamed('login'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

// fungis tolak surat oleh rt
  void _rejectRTMailFunc() async {
    ApiResponse response = await rejectRTMails(widget.id, infoField.text, notefield.text);
    if (response.error == null) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Surat Berhasil Ditolak',
            style: darkTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: (() => context.goNamed('admin-rt-area')),
              child: Text('Ok', style: darkTextStyle),
            ),
          ],
        ),
      );
    } else if (response.error == unauthorized) {
      logout().then((value) => context.goNamed('login'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

// fungis tolak surat oleh rw
  void _rejectRWMailFunc() async {
    ApiResponse response = await rejectRWMails(widget.id, infoField.text, notefield.text);
    if (response.error == null) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Surat Berhasil Ditolak',
            style: darkTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: (() => context.goNamed('admin-rw-area')),
              child: Text('Ok', style: darkTextStyle),
            ),
          ],
        ),
      );
    } else if (response.error == unauthorized) {
      logout().then((value) => context.goNamed('login'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

// fungsi form persetujuan
  void _showApproveModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(
            6,
          ),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(defaultmargin),
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Setujui Pengajuan Surat',
                style: darkTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClearMailField(title: 'Keterangan', type: TextInputType.text, controller: infoField),
                    ClearMailField(title: 'Catatan', type: TextInputType.text, controller: notefield),
                    widget.tipe == 'rw'
                        ? ClearMailField(title: 'Nomor Registrasi', type: TextInputType.text, controller: regField)
                        : const SizedBox(),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        elevation: 0,
                        backgroundColor: const Color.fromARGB(255, 82, 165, 165),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.pop(context);
                          switch (widget.tipe) {
                            case 'rt':
                              _approveRTMailFunc();
                              // print('disetujui rt');
                              break;
                            case 'rw':
                              _approveRWMailFunc();
                              // print('disetujui rw');
                              break;
                            default:
                              print('error approve system');
                          }
                          // _approveRTMailFunc();
                          // print('Surat Disetujui RT');
                        }
                      },
                      child: Text(
                        'Setujui Surat',
                        style: whiteTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// fungsi form penolakan
  void _showRejectModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(
            6,
          ),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(defaultmargin),
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tolak Pengajuan Surat',
                style: darkTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClearMailField(title: 'Keterangan', type: TextInputType.text, controller: infoField),
                    ClearMailField(title: 'Catatan', type: TextInputType.text, controller: notefield),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        elevation: 0,
                        backgroundColor: const Color.fromARGB(255, 206, 92, 92),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.pop(context);
                          switch (widget.tipe) {
                            case 'rt':
                              _rejectRTMailFunc();
                              // print('ditolak rt');
                              break;
                            case 'rw':
                              _rejectRWMailFunc();
                              // print('ditolak rw');
                              break;
                            default:
                              print('error approve system');
                          }
                          // _rejectRTMailFunc();
                          // print('Surat Ditolak RT');
                        }
                      },
                      child: Text(
                        'Tolak Surat',
                        style: whiteTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _getNikahDetail();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Pengajuan Surat',
          style: whiteTextStyle,
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : ListView(
              padding: EdgeInsets.all(defaultmargin),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Surat Nikah',
                      style: darkTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(8),
                                  elevation: 0,
                                  backgroundColor: const Color.fromARGB(255, 82, 165, 165),
                                ),
                                onPressed: () {
                                  infoField.text = 'Untuk di proses dan diperiksa';
                                  notefield.text = 'ok';
                                  _showApproveModal();
                                  // print('surat diterima');
                                },
                                child: Text(
                                  'Setujui Surat',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(8),
                                  elevation: 0,
                                  backgroundColor: const Color.fromARGB(255, 206, 92, 92),
                                ),
                                onPressed: () {
                                  infoField.text = '';
                                  notefield.text = '';
                                  _showRejectModal();
                                  // print('surat ditolak');
                                },
                                child: Text(
                                  'Tolak Surat',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: defaultmargin,
                    ),
                    LineDetail(title: 'No Resi', content: '2023ABC92FKAXN'),
                    LineDetail(title: 'Tanggal Pengajuan', content: '2023-01-03'),
                    const SizedBox(height: 15),
                    const LineDetail(title: 'Data Acara Pernikahan', content: ''),
                    LineDetail(title: 'Tanggal Acara', content: nikahDetail!.suratBody!.tanggal ?? 'Error'),
                    LineDetail(title: 'Waktu', content: nikahDetail!.suratBody!.waktu ?? 'Error'),
                    const SizedBox(height: 15),
                    const LineDetail(title: 'Data Anak - Calon Mempelai', content: ''),
                    LineDetail(title: 'NIK Penduduk', content: nikahDetail!.suratBody!.anakNik ?? 'Error'),
                    LineDetail(title: 'Nomor Kartu Keluarga', content: nikahDetail!.suratBody!.anakNoKk ?? 'Error'),
                    LineDetail(title: 'Nama Lengkap', content: nikahDetail!.suratBody!.anakNama ?? 'Error'),
                    LineDetail(title: 'Tempat Lahir', content: nikahDetail!.suratBody!.anakTempatLahir ?? 'Error'),
                    LineDetail(title: 'Tanggal Lahir', content: nikahDetail!.suratBody!.anakTanggalLahir ?? 'Error'),
                    LineDetail(title: 'Jenis Kelamin', content: calonA),
                    LineDetail(title: 'Warga Negara', content: nikahDetail!.suratBody!.anakWargaNegara ?? 'Error'),
                    LineDetail(title: 'Negara', content: nikahDetail!.suratBody!.anakNegaraNama ?? 'Error'),
                    LineDetail(title: 'Agama', content: nikahDetail!.suratBody!.anakAgama ?? 'Error'),
                    LineDetail(title: 'Status Perkawinan', content: nikahDetail!.suratBody!.anakStatusKawin ?? 'Error'),
                    LineDetail(title: 'Pendidikan', content: nikahDetail!.suratBody!.anakPendidikan ?? 'Error'),
                    LineDetail(title: 'Pekerjaan', content: nikahDetail!.suratBody!.anakPekerjaan ?? 'Error'),
                    LineDetail(title: 'Alamat', content: nikahDetail!.suratBody!.anakAlamat ?? 'Error'),
                    const SizedBox(height: 15),
                    const LineDetail(title: 'Data Orang Tua - Ayah', content: ''),
                    LineDetail(title: 'NIK Penduduk', content: nikahDetail!.suratBody!.ayahNik ?? 'Error'),
                    LineDetail(title: 'Nama Lengkap', content: nikahDetail!.suratBody!.ayahNama ?? 'Error'),
                    LineDetail(title: 'Tanggal Lahir', content: nikahDetail!.suratBody!.ayahTanggalLahir ?? 'Error'),
                    LineDetail(title: 'Warga Negara', content: nikahDetail!.suratBody!.ayahWargaNegara ?? 'Error'),
                    LineDetail(title: 'Negara Nama', content: nikahDetail!.suratBody!.ayahNegaraNama ?? 'Error'),
                    LineDetail(title: 'Agama', content: nikahDetail!.suratBody!.ayahAgama ?? 'Error'),
                    LineDetail(title: 'Pekerjaan', content: nikahDetail!.suratBody!.ayahPekerjaan ?? 'Error'),
                    LineDetail(title: 'Alamat', content: nikahDetail!.suratBody!.ayahAlamat ?? 'Error'),
                    const SizedBox(height: 15),
                    const LineDetail(title: 'Data Orang Tua - Ibu', content: ''),
                    LineDetail(title: 'NIK Penduduk', content: nikahDetail!.suratBody!.ibuNik ?? 'Error'),
                    LineDetail(title: 'Nama Lengkap', content: nikahDetail!.suratBody!.ibuNama ?? 'Error'),
                    LineDetail(title: 'Tanggal Lahir', content: nikahDetail!.suratBody!.ibuTanggalLahir ?? 'Error'),
                    LineDetail(title: 'Warga Negara', content: nikahDetail!.suratBody!.ibuWargaNegara ?? 'Error'),
                    LineDetail(title: 'Negara Nama', content: nikahDetail!.suratBody!.ibuNegaraNama ?? 'Error'),
                    LineDetail(title: 'Agama', content: nikahDetail!.suratBody!.ibuAgama ?? 'Error'),
                    LineDetail(title: 'Pekerjaan', content: nikahDetail!.suratBody!.ibuPekerjaan ?? 'Error'),
                    LineDetail(title: 'Alamat', content: nikahDetail!.suratBody!.ibuAlamat ?? 'Error'),
                    const SizedBox(height: 15),
                    const LineDetail(title: 'Data Calon Mempelai', content: ''),
                    LineDetail(title: 'NIK Penduduk', content: nikahDetail!.suratBody!.calonNik ?? 'Error'),
                    LineDetail(title: 'Nomor Kartu Keluarga', content: nikahDetail!.suratBody!.calonNoKk ?? 'Error'),
                    LineDetail(title: 'Nama Lengkap', content: nikahDetail!.suratBody!.calonNama ?? 'Error'),
                    LineDetail(title: 'Tempat Lahir', content: nikahDetail!.suratBody!.calonTempatLahir ?? 'Error'),
                    LineDetail(title: 'Tanggal Lahir', content: nikahDetail!.suratBody!.calonTanggalLahir ?? 'Error'),
                    LineDetail(title: 'Jenis Kelamin', content: calonB),
                    LineDetail(title: 'Warga Negara', content: nikahDetail!.suratBody!.calonWargaNegara ?? 'Error'),
                    LineDetail(title: 'Negara', content: nikahDetail!.suratBody!.calonNegaraNama ?? 'Error'),
                    LineDetail(title: 'Agama', content: nikahDetail!.suratBody!.calonAgama ?? 'Error'),
                    LineDetail(title: 'Status Perkawinan', content: nikahDetail!.suratBody!.calonStatusKawin ?? 'Error'),
                    LineDetail(title: 'Pendidikan', content: nikahDetail!.suratBody!.calonPendidikan ?? 'Error'),
                    LineDetail(title: 'Pekerjaan', content: nikahDetail!.suratBody!.calonPekerjaan ?? 'Error'),
                    LineDetail(title: 'Alamat', content: nikahDetail!.suratBody!.calonAlamat ?? 'Error'),
                  ],
                )
              ],
            ),
    );
  }
}
