import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/components/detail_line.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/mail_kelahiran_detail.dart';
import 'package:wangunsari/services/admin_rt.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';

class ReviewSuratKelahiran extends StatefulWidget {
  final String id;
  const ReviewSuratKelahiran({super.key, required this.id});

  @override
  State<ReviewSuratKelahiran> createState() => _ReviewSuratKelahiranState();
}

class _ReviewSuratKelahiranState extends State<ReviewSuratKelahiran> {
  MailKelahiranDetailService? kelahiranDetail;
  bool _loading = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController infoField = TextEditingController();
  TextEditingController notefield = TextEditingController();

  void _getKelahiranDetail() async {
    ApiResponse response = await kelahiranMailDetail(widget.id);
    if (response.error == null) {
      setState(() {
        kelahiranDetail = response.data as MailKelahiranDetailService;
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
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        elevation: 0,
                        backgroundColor: const Color.fromARGB(255, 82, 165, 165),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.pop(context);
                          _approveRTMailFunc();
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
                          _rejectRTMailFunc();
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
    _getKelahiranDetail();
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
                      'Detail Surat Kelahiran',
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
                    LineDetail(title: 'No Resi', content: kelahiranDetail!.surat!.noResi ?? 'Error'),
                    LineDetail(title: 'Tanggal Pengajuan', content: kelahiranDetail!.surat!.tanggal ?? 'Error'),
                    const SizedBox(height: 15),
                    const LineDetail(title: 'Data Kelahiran Anak', content: ''),
                    LineDetail(title: 'Nama Anak', content: kelahiranDetail!.suratBody!.namaAnak ?? 'Error'),
                    LineDetail(title: 'Tempat Lahir', content: kelahiranDetail!.suratBody!.tempatLahir ?? 'Error'),
                    LineDetail(title: 'Tanggal Lahir', content: kelahiranDetail!.suratBody!.tanggalLahir ?? 'Error'),
                    LineDetail(title: 'Waktu Lahir', content: kelahiranDetail!.suratBody!.waktuLahir ?? 'Error'),
                    LineDetail(title: 'Jenis Kelamin', content: kelahiranDetail!.suratBody!.jenisKelamin ?? 'Error'),
                    LineDetail(title: 'Berat Anak (gram)', content: '${kelahiranDetail!.suratBody!.berat} gram'),
                    LineDetail(title: 'Tinggi Anak (cm)', content: '${kelahiranDetail!.suratBody!.panjang} cm'),
                    LineDetail(title: 'Status Anak Ke-', content: kelahiranDetail!.suratBody!.anakKe ?? 'Error'),
                    const SizedBox(height: 15),
                    const LineDetail(title: 'Data Ayah', content: ''),
                    LineDetail(title: 'NIK Penduduk', content: kelahiranDetail!.suratBody!.ayahNik ?? 'Error'),
                    LineDetail(title: 'Nama Penduduk', content: kelahiranDetail!.suratBody!.ayahNama ?? 'Error'),
                    LineDetail(title: 'Tempat Lahir', content: kelahiranDetail!.suratBody!.ayahTempatLahir ?? 'Error'),
                    LineDetail(title: 'Tanggal Lahir', content: kelahiranDetail!.suratBody!.ayahTanggalLahir ?? 'Error'),
                    LineDetail(title: 'Pekerjaan', content: kelahiranDetail!.suratBody!.ayahPekerjaan ?? 'Error'),
                    LineDetail(title: 'Agama', content: kelahiranDetail!.suratBody!.ayahAgama ?? 'Error'),
                    LineDetail(title: 'Alamat', content: kelahiranDetail!.suratBody!.ayahAlamat ?? 'Error'),
                    const SizedBox(height: 15),
                    const LineDetail(title: 'Data Ibu', content: ''),
                    LineDetail(title: 'NIK Penduduk', content: kelahiranDetail!.suratBody!.ibuNik ?? 'Error'),
                    LineDetail(title: 'Nama Penduduk', content: kelahiranDetail!.suratBody!.ibuNama ?? 'Error'),
                    LineDetail(title: 'Tempat Lahir', content: kelahiranDetail!.suratBody!.ibuTempatLahir ?? 'Error'),
                    LineDetail(title: 'Tanggal Lahir', content: kelahiranDetail!.suratBody!.ibuTanggalLahir ?? 'Error'),
                    LineDetail(title: 'Pekerjaan', content: kelahiranDetail!.suratBody!.ibuPekerjaan ?? 'Error'),
                    LineDetail(title: 'Agama', content: kelahiranDetail!.suratBody!.ibuAgama ?? 'Error'),
                    LineDetail(title: 'Alamat', content: kelahiranDetail!.suratBody!.ibuAlamat ?? 'Error'),
                  ],
                )
              ],
            ),
    );
  }
}
