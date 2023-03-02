import 'package:flutter/material.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/components/detail_line.dart';
import 'package:wangunsari/components/tracking_item.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/tracking_mail.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/services/utility.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class DetailSurat extends StatefulWidget {
  final String id;
  const DetailSurat({
    super.key,
    required this.id,
  });

  @override
  State<DetailSurat> createState() => _DetailSuratState();
}

class _DetailSuratState extends State<DetailSurat> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController reasonField = TextEditingController();
  TrackingMailService? detail;
  bool _loading = true;
  late List<Trackings> tracks = [];

  Future<void> getMailDetail() async {
    ApiResponse response = await mailDetail(widget.id);
    if (response.error == null) {
      setState(() {
        detail = response.data as TrackingMailService;
        tracks = [];
        List tracksData = detail!.trackings!;
        for (var e in tracksData) {
          tracks.add(e);
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

  void _abortMailFunc() async {
    ApiResponse response = await abortedMail(widget.id, reasonField.text);
    if (response.error == null) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Pembatalan Surat Berhasil',
            style: darkTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: (() => context.goNamed('status')),
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

  void _showReasonModal() {
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
                'Ajukan Pembatalan Surat',
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
                    ClearMailField(title: 'Alasan Pembatalan', type: TextInputType.text, controller: reasonField),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        elevation: 0,
                        backgroundColor: const Color.fromARGB(255, 206, 92, 92),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.pop(context);
                          _abortMailFunc();
                          // print('Surat Batal');
                        }
                      },
                      child: Text(
                        'Ajukan Pembatalan',
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
    // print(widget.id);
    getMailDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Surat',
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
          : RefreshIndicator(
              color: primaryColor,
              backgroundColor: whiteColor,
              onRefresh: () => getMailDetail(),
              child: ListView(
                padding: EdgeInsets.all(defaultmargin),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail ${detail!.surat!.jenis}',
                        style: darkTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: defaultmargin,
                      ),
                      LineDetail(title: 'Nama', content: detail!.surat!.namaPenduduk ?? 'Error'),
                      LineDetail(title: 'NIK', content: detail!.surat!.nikPenduduk ?? 'Error'),
                      LineDetail(title: 'Tanggal Pengajuan', content: detail!.surat!.tanggal ?? 'Error'),
                      LineDetail(title: 'No Resi', content: detail!.surat!.noResi ?? 'Error'),
                      LineDetail(title: 'RT', content: detail!.surat!.rtNama ?? 'Error'),
                      LineDetail(title: 'RW', content: detail!.surat!.rwNama ?? 'Error'),
                      LineDetail(title: 'Kades', content: detail!.surat!.kadesNama ?? 'Error'),
                      detail!.surat!.status != 'DIBATALKAN'
                          ? detail!.surat!.status != 'SELESAI'
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Menu',
                                      style: darkTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              padding: const EdgeInsets.all(8),
                                              elevation: 0,
                                              backgroundColor: const Color.fromARGB(255, 206, 92, 92),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                reasonField.text = '';
                                              });
                                              _showReasonModal();
                                            },
                                            child: Text(
                                              'Batalkan Surat',
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
                                              backgroundColor: const Color.fromARGB(255, 82, 165, 165),
                                            ),
                                            onPressed: () {
                                              switch (detail!.surat!.jenis!) {
                                                case 'SURAT DOMISILI':
                                                  context.goNamed('edit-surat-domisili', params: {'suratId': widget.id, 'id': widget.id});
                                                  // print('edit surat domisili');
                                                  break;
                                                case 'SURAT KETERANGAN':
                                                  // print('edit surat keterangan');
                                                  context.goNamed('edit-surat-keterangan', params: {'suratId': widget.id, 'id': widget.id});
                                                  break;
                                                case 'SURAT KELAHIRAN':
                                                  // print('edit surat kelahiran');
                                                  context.goNamed('edit-surat-kelahiran', params: {'suratId': widget.id, 'id': widget.id});
                                                  break;
                                                case 'SURAT NIKAH':
                                                  // print('edit surat nikah');
                                                  context.goNamed('edit-surat-nikah', params: {'suratId': widget.id, 'id': widget.id});
                                                  break;
                                                default:
                                              }
                                            },
                                            child: Text(
                                              'Edit Data Surat',
                                              style: whiteTextStyle.copyWith(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : const SizedBox()
                          : const SizedBox(),
                      SizedBox(
                        height: defaultmargin,
                      ),
                      Text(
                        'Tracking Surat',
                        style: darkTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: defaultmargin,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: tracks.length,
                        itemBuilder: (context, index) {
                          Trackings data = tracks[index];
                          return TrackingItem(
                            date: data.waktu ?? 'Error',
                            content: data.catatan != null ? '${data.keterangan} - ${data.catatan}' : '${data.keterangan}',
                            status: data.status ?? 'Error',
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
