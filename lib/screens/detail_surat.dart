import 'package:flutter/material.dart';
import 'package:wangunsari/components/detail_line.dart';
import 'package:wangunsari/components/tracking_item.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/surat_detail.dart';
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
  SuratDetailService? detail;
  bool _loading = true;
  late List<Trackings> tracks = [];

  void getMailDetail() async {
    ApiResponse response = await mailDetail(widget.id);
    if (response.error == null) {
      setState(() {
        detail = response.data as SuratDetailService;
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
          : ListView(
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
                          content: data.keterangan ?? 'Error',
                          status: data.status ?? 'Error',
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
