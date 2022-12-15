import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';

class SuratKeterangan extends StatefulWidget {
  const SuratKeterangan({super.key});

  @override
  State<SuratKeterangan> createState() => _SuratKeteranganState();
}

class _SuratKeteranganState extends State<SuratKeterangan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultmargin),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Form Pengajuan\nSurat Keterangan',
                  style: darkTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xffFFF3CD),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xffFFEEBA),
                  ),
                ),
                child: Text(
                  'Perhatian!\nPengajuan surat membutuhkan persetujuan RT, RW dan Pihak Kelurahan setempat, silahkan hubungi admin apabila 5x24 belum mendaptkan persetujuan.',
                  style: yellowTextStyle.copyWith(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: defaultmargin,
              ),
              Text(
                'Data Diri',
                style: darkTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                style: darkTextStyle.copyWith(
                  fontSize: 16,
                ),
                showCursor: false,
                keyboardType: TextInputType.number,
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
                    'Jenis Kelamin',
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
                    'Kewarganegaraan',
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
                    'Status Perkawinan',
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
                    'Pendidikan Terakhir',
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
                    'Jenis KTP',
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
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffD3DEDC),
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
    );
  }
}
