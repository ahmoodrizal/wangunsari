import 'package:flutter/material.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/user.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class SuratDomisili extends StatefulWidget {
  const SuratDomisili({super.key});

  @override
  State<SuratDomisili> createState() => _SuratDomisiliState();
}

class _SuratDomisiliState extends State<SuratDomisili> {
  UserService? user;
  bool loading = true;
  bool _submitLoading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nikField = TextEditingController();
  TextEditingController nameField = TextEditingController();
  TextEditingController tempatLahirField = TextEditingController();
  TextEditingController tanggalLahirField = TextEditingController();
  TextEditingController tanggalLahirTextField = TextEditingController();
  TextEditingController jenisKelaminField = TextEditingController();
  TextEditingController kewarganegaraanField = TextEditingController();
  TextEditingController negaraField = TextEditingController();
  TextEditingController agamaField = TextEditingController();
  TextEditingController statusKawinField = TextEditingController();
  TextEditingController pendidikanField = TextEditingController();
  TextEditingController jenisKtpField = TextEditingController();
  TextEditingController pekerjaanField = TextEditingController();
  TextEditingController alamatField = TextEditingController();
  TextEditingController alamatAsalField = TextEditingController();
  TextEditingController tinggalSejakField = TextEditingController();
  TextEditingController rwField = TextEditingController();
  TextEditingController rtField = TextEditingController();

  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as UserService;
        loading = false;
        // print(user);
        nikField.text = user!.data!.user!.penduduk!.nik ?? '';
        nameField.text = user!.data!.user!.penduduk!.nama ?? '';
        tempatLahirField.text = user!.data!.user!.penduduk!.tempatLahir ?? '';
        tanggalLahirField.text = user!.data!.user!.penduduk!.tanggalLahir ?? '';
        tanggalLahirTextField.text = user!.data!.user!.penduduk!.tanggalLahirText ?? '';
        jenisKelaminField.text = user!.data!.user!.penduduk!.jenisKelamin ?? '';
        kewarganegaraanField.text = user!.data!.user!.penduduk!.wargaNegara ?? '';
        negaraField.text = user!.data!.user!.penduduk!.negaraNama ?? '';
        agamaField.text = user!.data!.user!.penduduk!.agama ?? '';
        statusKawinField.text = user!.data!.user!.penduduk!.statusKawin ?? '';
        pendidikanField.text = user!.data!.user!.penduduk!.pendidikan ?? '';
        jenisKtpField.text = user!.data!.user!.penduduk!.kitasKitap ?? '';
        pekerjaanField.text = user!.data!.user!.penduduk!.pekerjaan ?? '';
        alamatField.text = user!.data!.user!.penduduk!.alamat!.replaceAll("\n", " ");
        rwField.text = user!.data!.user!.penduduk!.rw!.nomor ?? '';
        rtField.text = user!.data!.user!.penduduk!.rt!.nomor ?? '';
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

  void _submitMails() async {
    ApiResponse response = await submitDomisiliMail(
      rtField.text,
      rwField.text,
      nikField.text,
      nameField.text,
      tempatLahirField.text,
      tanggalLahirField.text,
      jenisKelaminField.text,
      kewarganegaraanField.text,
      negaraField.text,
      agamaField.text,
      statusKawinField.text,
      pendidikanField.text,
      pekerjaanField.text,
      alamatField.text,
      alamatAsalField.text,
      tinggalSejakField.text,
    );
    if (response.error == null) {
      // Navigator.of(context).pop();
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
      setState(() {
        _submitLoading = !_submitLoading;
      });
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
        elevation: 0,
        centerTitle: true,
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
                          'Form Pengajuan\nSurat Keterangan Domisili',
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
                        readOnly: nikField.value == '' ? false : true,
                        controller: nikField,
                        validator: (value) => value!.isEmpty ? 'nik tidak boleh kosong' : null,
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
                        readOnly: nameField.value == '' ? false : true,
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
                        readOnly: tempatLahirField.value == '' ? false : true,
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
                        readOnly: tanggalLahirField.value == '' ? false : true,
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
                        readOnly: jenisKelaminField.value == '' ? false : true,
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
                        readOnly: kewarganegaraanField.value == '' ? false : true,
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
                        validator: (value) => value!.isEmpty ? 'negara tidak boleh kosong' : null,
                        readOnly: negaraField.value == '' ? false : true,
                        controller: negaraField,
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
                            'Negara',
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
                        readOnly: agamaField.value == '' ? false : true,
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
                        readOnly: statusKawinField.value == '' ? false : true,
                        controller: statusKawinField,
                        validator: (value) => value!.isEmpty ? 'status kawin tidak boleh kosong' : null,
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
                        readOnly: pendidikanField.value == '' ? false : true,
                        controller: pendidikanField,
                        validator: (value) => value!.isEmpty ? 'pendidikan tidak boleh kosong' : null,
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
                        readOnly: pekerjaanField.value == '' ? false : true,
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
                        readOnly: alamatField.value == '' ? false : true,
                        controller: alamatField,
                        validator: (value) => value!.isEmpty ? 'alamat tidak boleh kosong' : null,
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
                            'Alamat',
                            style: darkTextStyle.copyWith(
                              color: greyColor,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: alamatAsalField,
                        validator: (value) => value!.isEmpty ? 'alamat asal tidak boleh kosong' : null,
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
                            'Alamat Asal',
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
                        readOnly: true,
                        controller: tinggalSejakField,
                        validator: (value) => value!.isEmpty ? 'tanggal tinggal sejak tidak boleh kosong' : null,
                        style: darkTextStyle.copyWith(
                          fontSize: 16,
                        ),
                        showCursor: false,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                              color: primaryColor,
                              size: 16,
                            ),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime.now(),
                                initialDatePickerMode: DatePickerMode.year,
                              ).then((value) {
                                if (value != null) {
                                  setState(() {
                                    tinggalSejakField.text = value.toString().substring(0, 10);
                                  });
                                }
                              });
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          label: Text(
                            'Tinggal Sejak',
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
                        readOnly: rtField.value == '' ? false : true,
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
                            'RT',
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
                        readOnly: rwField.value == '' ? false : true,
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
                            'RW',
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
                                      setState(() {
                                        _submitLoading = true;
                                      });
                                      _submitMails();
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
