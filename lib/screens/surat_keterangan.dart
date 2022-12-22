import 'package:flutter/material.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/user.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class SuratKeterangan extends StatefulWidget {
  const SuratKeterangan({super.key});

  @override
  State<SuratKeterangan> createState() => _SuratKeteranganState();
}

class _SuratKeteranganState extends State<SuratKeterangan> {
  UserData? user;
  bool loading = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nikField = TextEditingController();
  TextEditingController nameField = TextEditingController();
  TextEditingController tempatLahirField = TextEditingController();
  TextEditingController tanggalLahirField = TextEditingController();
  TextEditingController jenisKelaminField = TextEditingController();
  TextEditingController kewarganegaraanField = TextEditingController();
  TextEditingController agamaField = TextEditingController();
  TextEditingController statusKawinField = TextEditingController();
  TextEditingController pendidikanField = TextEditingController();
  TextEditingController jenisKtpField = TextEditingController();
  TextEditingController pekerjaanField = TextEditingController();
  TextEditingController kampungField = TextEditingController();
  TextEditingController rwField = TextEditingController();
  TextEditingController rtField = TextEditingController();

  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as UserData;
        loading = false;
        // print(user);
        nikField.text = user!.data!.user!.penduduk!.nik ?? '';
        nameField.text = user!.data!.user!.penduduk!.nama ?? '';
        tempatLahirField.text = user!.data!.user!.penduduk!.tempatLahir ?? '';
        tanggalLahirField.text = user!.data!.user!.penduduk!.tanggalLahirText ?? '';
        jenisKelaminField.text = user!.data!.user!.penduduk!.jenisKelamin ?? '';
        kewarganegaraanField.text = user!.data!.user!.penduduk!.wargaNegara ?? '';
        agamaField.text = user!.data!.user!.penduduk!.agama ?? '';
        statusKawinField.text = user!.data!.user!.penduduk!.statusKawin ?? '';
        pendidikanField.text = user!.data!.user!.penduduk!.pendidikan ?? '';
        jenisKtpField.text = user!.data!.user!.penduduk!.kitasKitap ?? '';
        pekerjaanField.text = user!.data!.user!.penduduk!.pekerjaan ?? '';
        kampungField.text = user!.data!.user!.penduduk!.alamat ?? '';
        // rwField.text = user!.data!.user!.penduduk!.nik ?? '';
        rtField.text = user!.data!.user!.penduduk!.rtId ?? '';
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
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Form(
              key: formkey,
              child: SingleChildScrollView(
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
                        controller: nikField,
                        validator: (value) => value!.isEmpty ? 'nik tidak boleh kosong' : null,
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
                        controller: nameField,
                        validator: (value) => value!.isEmpty ? 'nama tidak boleh kosong' : null,
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
                        controller: tempatLahirField,
                        validator: (value) => value!.isEmpty ? 'tempat lahir tidak boleh kosong' : null,
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
                        controller: tanggalLahirField,
                        validator: (value) => value!.isEmpty ? 'tanggal lahir tidak boleh kosong' : null,
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
                        controller: jenisKelaminField,
                        validator: (value) => value!.isEmpty ? 'jenis kelamin tidak boleh kosong' : null,
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
                        controller: kewarganegaraanField,
                        validator: (value) => value!.isEmpty ? 'kewarganegaraan tidak boleh kosong' : null,
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
                        controller: agamaField,
                        validator: (value) => value!.isEmpty ? 'agama tidak boleh kosong' : null,
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
                        controller: statusKawinField,
                        validator: (value) => value!.isEmpty ? 'status perkawinan tidak boleh kosong' : null,
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
                        controller: pendidikanField,
                        validator: (value) => value!.isEmpty ? 'pendidikan terakhir tidak boleh kosong' : null,
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
                        controller: jenisKtpField,
                        validator: (value) => value!.isEmpty ? 'jenis KTP tidak boleh kosong' : null,
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
                        controller: pekerjaanField,
                        validator: (value) => value!.isEmpty ? 'pekerjaan tidak boleh kosong' : null,
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
                        controller: kampungField,
                        validator: (value) => value!.isEmpty ? 'kampung tidak boleh kosong' : null,
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
                        controller: rwField,
                        validator: (value) => value!.isEmpty ? 'rw tidak boleh kosong' : null,
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
                        controller: rtField,
                        validator: (value) => value!.isEmpty ? 'rt tidak boleh kosong' : null,
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
