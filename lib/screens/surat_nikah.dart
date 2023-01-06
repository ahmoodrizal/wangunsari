import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/components/alert_card.dart';
import 'package:wangunsari/theme.dart';

class SuratNikah extends StatefulWidget {
  const SuratNikah({super.key});

  @override
  State<SuratNikah> createState() => _SuratNikahState();
}

class _SuratNikahState extends State<SuratNikah> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(defaultmargin),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Form Pengajuan\nSurat Keterangan Nikah',
                    style: darkTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: medium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                const AlertCard(),
                SizedBox(
                  height: defaultmargin,
                ),
                Text(
                  'Data Calon Mempelai Pria',
                  style: darkTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Nomor Induk Kependudukan',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'nama mempelai pria tidak boleh kosong' : null,
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Nama Lengkap',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Tempat Lahir',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Tanggal Lahir',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Pekerjaan',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Agama',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Kampung',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Rukun Warga',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Rukun Tetangga',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  'Data Calon Mempelai Wanita',
                  style: darkTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Nomor Induk Kependudukan',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Nama Lengkap',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Tempat Lahir',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Tanggal Lahir',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Pekerjaan',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Agama',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Kampung',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Rukun Warga',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Rukun Tetangga',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  'Data Orang Tua - Ayah',
                  style: darkTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Nomor Induk Kependudukan',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Nama Lengkap',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Tempat Lahir',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Tanggal Lahir',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Pekerjaan',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Agama',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Kampung',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Rukun Warga',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Rukun Tetangga',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  'Data Orang Tua - Ibu',
                  style: darkTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Nomor Induk Kependudukan',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Nama Lengkap',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Tempat Lahir',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Tanggal Lahir',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Pekerjaan',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Agama',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Kampung',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Rukun Warga',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Rukun Tetangga',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  'Data Dokumen Lainnya',
                  style: darkTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Scan Fotocopy PBB',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Scan Fotocopy Kartu Keluarga',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: darkTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  showCursor: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    label: Text(
                      'Tanggal dan Waktu Acara',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      // setState(() {});
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Submit Pengajuan Surat ?',
                            style: darkTextStyle,
                          ),
                          content: Text(
                            'Pastikan semua data telah dipastikan dengan benar dan sesuai dengan KTP',
                            style: darkTextStyle,
                          ),
                          actions: [
                            TextButton(
                              onPressed: (() => Navigator.pop(context)),
                              child: Text('Batal', style: darkTextStyle),
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      'Pengajuan Surat Berhasil',
                                      style: darkTextStyle,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: (() => context.goNamed('home')),
                                        child: Text('Ok', style: darkTextStyle),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'Ajukan',
                                style: darkTextStyle.copyWith(
                                  color: const Color.fromARGB(255, 201, 100, 93),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffD3DEDC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Ajukan Surat',
                        style: darkTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
