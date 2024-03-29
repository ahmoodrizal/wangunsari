import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/components/card_surat_admin_rw.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/surat.dart';
import 'package:wangunsari/services/admin_rw.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';

class AdminRWArea extends StatefulWidget {
  const AdminRWArea({super.key});

  @override
  State<AdminRWArea> createState() => _AdminRWAreaState();
}

class _AdminRWAreaState extends State<AdminRWArea> {
  List<dynamic> _getAdminMails = [];
  bool _loading = true;

  // fetch mails
  Future<void> fetchRWMails() async {
    ApiResponse response = await getRWMails();
    if (response.error == null) {
      setState(() {
        _getAdminMails = response.data as List<dynamic>;
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
    fetchRWMails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halaman RW',
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
          : _getAdminMails.isNotEmpty
              ? RefreshIndicator(
                  backgroundColor: whiteColor,
                  color: primaryColor,
                  onRefresh: () => fetchRWMails(),
                  child: ListView.builder(
                    padding: EdgeInsets.all(defaultmargin),
                    itemCount: _getAdminMails.length,
                    itemBuilder: (context, index) {
                      Surats surat = _getAdminMails[index];
                      return CardSuratAdminRW(
                        tipe: 'rw',
                        name: surat.namaPenduduk!,
                        nik: surat.nikPenduduk!,
                        id: surat.id.toString(),
                        title: surat.jenis!,
                        date: surat.createdStr!,
                        status: surat.status! == 'DIBATALKAN'
                            ? '${surat.trackingStatus} - ${surat.alasanDibatalkan}'
                            : '${surat.trackingStatus} - ${surat.trackingKeterangan}',
                        resi: surat.noResi!,
                      );
                    },
                  ),
                )
              : Center(
                  child: Text(
                    'belum ada surat yang diajukan',
                    style: darkTextStyle,
                  ),
                ),
    );
  }
}
