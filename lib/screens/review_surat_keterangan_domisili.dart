import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/components/detail_line.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/mail_domisili_detail.dart';
import 'package:wangunsari/services/admin_rt.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';

class ReviewSuratKeteranganDomisili extends StatefulWidget {
  final String id;
  const ReviewSuratKeteranganDomisili({super.key, required this.id});

  @override
  State<ReviewSuratKeteranganDomisili> createState() => _ReviewSuratKeteranganDomisiliState();
}

class _ReviewSuratKeteranganDomisiliState extends State<ReviewSuratKeteranganDomisili> {
  MailDomisiliDetailService? domisiliDetail;
  bool loading = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController infoField = TextEditingController();
  TextEditingController notefield = TextEditingController();

  void _getDomisiliDetail() async {
    ApiResponse response = await domisiliMailDetail(widget.id);
    if (response.error == null) {
      setState(() {
        domisiliDetail = response.data as MailDomisiliDetailService;
        loading = false;
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
    _getDomisiliDetail();
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
      body: loading
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
                      'Detail Surat Keterangan Domisili',
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
                    const SizedBox(
                      height: 15,
                    ),
                    LineDetail(title: 'No Resi', content: domisiliDetail!.surat!.noResi ?? 'Error'),
                    LineDetail(title: 'Tanggal Pengajuan', content: domisiliDetail!.surat!.tanggal ?? 'Error'),
                    LineDetail(title: 'NIK Penduduk', content: domisiliDetail!.suratBody!.nik ?? 'Error'),
                    LineDetail(title: 'Nama Penduduk', content: domisiliDetail!.suratBody!.nama ?? 'Error'),
                    LineDetail(title: 'Tempat Lahir', content: domisiliDetail!.suratBody!.tempatLahir ?? 'Error'),
                    LineDetail(title: 'Tanggal Lahir', content: domisiliDetail!.suratBody!.tanggalLahir ?? 'Error'),
                    LineDetail(title: 'Jenis Kelamin', content: domisiliDetail!.suratBody!.jenisKelamin ?? 'Error'),
                    LineDetail(title: 'Kewarganegaraan', content: domisiliDetail!.suratBody!.wargaNegara ?? 'Error'),
                    LineDetail(title: 'Negara', content: domisiliDetail!.suratBody!.negaraNama ?? 'Error'),
                    LineDetail(title: 'Agama', content: domisiliDetail!.suratBody!.agama ?? 'Error'),
                    LineDetail(title: 'Status Kawin', content: domisiliDetail!.suratBody!.statusKawin ?? 'Error'),
                    LineDetail(title: 'Pendidikan', content: domisiliDetail!.suratBody!.pendidikan ?? 'Error'),
                    LineDetail(title: 'Pekerjaan', content: domisiliDetail!.suratBody!.pekerjaan ?? 'Error'),
                    LineDetail(title: 'Alamat', content: domisiliDetail!.suratBody!.alamat ?? 'Error'),
                    LineDetail(title: 'Alamat Asal', content: domisiliDetail!.suratBody!.alamatAsal ?? 'Error'),
                    LineDetail(title: 'Tinggal Sejak', content: domisiliDetail!.suratBody!.tinggalSejak ?? 'Error'),
                  ],
                )
              ],
            ),
    );
  }
}
