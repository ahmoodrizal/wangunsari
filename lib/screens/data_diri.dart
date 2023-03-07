import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/components/detail_line.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/user.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';

class DataDiri extends StatefulWidget {
  const DataDiri({super.key});

  @override
  State<DataDiri> createState() => _DataDiriState();
}

class _DataDiriState extends State<DataDiri> {
  UserService? user;
  bool _loading = true;
  late List<Roles> roles = [];

  void _getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as UserService;
        List userRoles = user!.data!.user!.roles!;
        for (var element in userRoles) {
          roles.add(element);
        }
        _loading = false;
        // print(roles[1].name);
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
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cek Data Diri',
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
          : Padding(
              padding: EdgeInsets.all(defaultmargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFF3CD),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xffFFEEBA),
                      ),
                    ),
                    child: Text(
                      'Perhatian!\nApabila terdapat kesalahan pada data diri, harap hubungi admin untuk melakukan perbaikan dan konfirmasi data diri.',
                      style: yellowTextStyle.copyWith(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const LineDetail(title: 'Data Penduduk', content: ''),
                  LineDetail(title: 'NIK Penduduk', content: user!.data!.user!.nik ?? 'Error'),
                  LineDetail(title: 'Nama Penduduk', content: user!.data!.user!.name ?? 'Error'),
                  LineDetail(title: 'Tempat Lahir', content: user!.data!.user!.penduduk!.tempatLahir ?? 'Error'),
                  LineDetail(title: 'Tanggal Lahir', content: user!.data!.user!.penduduk!.tanggalLahir ?? 'Error'),
                  LineDetail(title: 'Jenis Kelamin', content: user!.data!.user!.penduduk!.jenisKelamin ?? 'Error'),
                  LineDetail(title: 'Kewarganegaraan', content: user!.data!.user!.penduduk!.wargaNegara ?? 'Error'),
                  LineDetail(title: 'Negara', content: user!.data!.user!.penduduk!.negaraNama ?? 'Error'),
                  LineDetail(title: 'Agama', content: user!.data!.user!.penduduk!.agama ?? 'Error'),
                  LineDetail(title: 'Status Kawin', content: user!.data!.user!.penduduk!.statusKawin ?? 'Error'),
                  LineDetail(title: 'Pendidikan', content: user!.data!.user!.penduduk!.pendidikan ?? 'Error'),
                  LineDetail(title: 'Pekerjaan', content: user!.data!.user!.penduduk!.pekerjaan ?? 'Error'),
                  LineDetail(title: 'Alamat', content: user!.data!.user!.penduduk!.alamat ?? 'Error'),
                ],
              ),
            ),
    );
  }
}
