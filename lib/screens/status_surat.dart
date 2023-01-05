import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/components/card_surat.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/surat.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/services/utility.dart';
import 'package:wangunsari/theme.dart';

class StatusSurat extends StatefulWidget {
  const StatusSurat({super.key});

  @override
  State<StatusSurat> createState() => _StatusSuratState();
}

class _StatusSuratState extends State<StatusSurat> {
  List<dynamic> _getMails = [];
  bool _loading = true;

  // fetch mails
  Future<void> fetchMails() async {
    ApiResponse response = await getMails();

    if (response.error == null) {
      setState(() {
        _getMails = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => context.goNamed('login'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${response.error}',
            style: whiteTextStyle,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    fetchMails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Cek Status Surat',
          style: whiteTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : _getMails.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.all(defaultmargin),
                  itemCount: _getMails.length,
                  itemBuilder: (context, index) {
                    Surats surat = _getMails[index];
                    return CardSurat(
                      id: surat.id.toString(),
                      title: surat.jenis!,
                      date: surat.createdStr!,
                      status: surat.status! == 'DIBATALKAN'
                          ? '${surat.trackingStatus} - ${surat.alasanDibatalkan}'
                          : '${surat.trackingStatus} - ${surat.trackingKeterangan}',
                      resi: surat.noResi!,
                    );
                  },
                )
              : Center(
                  child: Text(
                    'Anda belum melakukan pengajuan surat',
                    style: darkTextStyle,
                  ),
                ),
    );
  }
}
