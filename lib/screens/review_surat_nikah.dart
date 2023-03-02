import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/components/detail_line.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/mail_nikah_detail.dart';
import 'package:wangunsari/services/admin_rt.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';

class ReviewSuratNikah extends StatefulWidget {
  final String id;
  const ReviewSuratNikah({super.key, required this.id});

  @override
  State<ReviewSuratNikah> createState() => _ReviewSuratNikahState();
}

class _ReviewSuratNikahState extends State<ReviewSuratNikah> {
  MailNikahDetailService? nikahDetail;
  bool _loading = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController infoField = TextEditingController();
  TextEditingController notefield = TextEditingController();

  void _getNikahDetail() async {
    ApiResponse response = await nikahMailDetail(widget.id);
    if (response.error == null) {
      setState(() {
        nikahDetail = response.data as MailNikahDetailService;
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
                    LineDetail(title: 'NIK Penduduk', content: '030210002100212'),
                    LineDetail(title: 'Nama Penduduk', content: 'Kim Minju'),
                  ],
                )
              ],
            ),
    );
  }
}
