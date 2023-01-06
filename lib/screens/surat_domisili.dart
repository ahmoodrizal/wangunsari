import 'package:flutter/material.dart';
import 'package:wangunsari/components/alert_card.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/components/form_field.dart';
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
                      const AlertCard(),
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
                      MailFormField(title: 'Nomor Induk Kependudukan', type: TextInputType.number, controller: nikField),
                      MailFormField(title: 'Nama Lengkap', type: TextInputType.text, controller: nameField),
                      MailFormField(title: 'Tempat Lahir', type: TextInputType.text, controller: tempatLahirField),
                      MailFormField(title: 'Tanggal Lahir', type: TextInputType.text, controller: tanggalLahirField),
                      MailFormField(title: 'Jenis Kelamin', type: TextInputType.text, controller: jenisKelaminField),
                      MailFormField(title: 'Kewarganegaraan', type: TextInputType.text, controller: kewarganegaraanField),
                      MailFormField(title: 'Negara', type: TextInputType.text, controller: negaraField),
                      MailFormField(title: 'Agama', type: TextInputType.text, controller: agamaField),
                      MailFormField(title: 'Status Perkawinan', type: TextInputType.text, controller: statusKawinField),
                      MailFormField(title: 'Pendidikan', type: TextInputType.text, controller: pendidikanField),
                      MailFormField(title: 'Pekerjaan', type: TextInputType.text, controller: pekerjaanField),
                      MailFormField(title: 'Alamat', type: TextInputType.text, controller: alamatField),
                      ClearMailField(title: 'Alamat Asal', type: TextInputType.text, controller: alamatAsalField),
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
                      MailFormField(title: 'RT', type: TextInputType.text, controller: rtField),
                      MailFormField(title: 'RW', type: TextInputType.text, controller: rwField),
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
