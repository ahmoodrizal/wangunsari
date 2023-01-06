import 'package:flutter/material.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/mail_domisili_detail.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/theme.dart';
import 'package:wangunsari/services/user.dart';
import 'package:go_router/go_router.dart';

class EditSuratDomisili extends StatefulWidget {
  final String suratId;
  const EditSuratDomisili({super.key, required this.suratId});

  @override
  State<EditSuratDomisili> createState() => _EditSuratDomisiliState();
}

class _EditSuratDomisiliState extends State<EditSuratDomisili> {
  MailDomisiliDetailService? domisiliDetail;
  bool loading = true;
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

  void _getDomisiliDetail() async {
    ApiResponse response = await domisiliMailDetail(widget.suratId);
    if (response.error == null) {
      setState(() {
        domisiliDetail = response.data as MailDomisiliDetailService;
        loading = false;
        nikField.text = domisiliDetail!.suratBody!.nik ?? '';
        nameField.text = domisiliDetail!.suratBody!.nama ?? '';
        tempatLahirField.text = domisiliDetail!.suratBody!.tempatLahir ?? '';
        tanggalLahirField.text = domisiliDetail!.suratBody!.tanggalLahir ?? '';
        jenisKelaminField.text = domisiliDetail!.suratBody!.jenisKelamin ?? '';
        kewarganegaraanField.text = domisiliDetail!.suratBody!.wargaNegara ?? '';
        negaraField.text = domisiliDetail!.suratBody!.negaraNama ?? '';
        agamaField.text = domisiliDetail!.suratBody!.agama ?? '';
        statusKawinField.text = domisiliDetail!.suratBody!.statusKawin ?? '';
        pendidikanField.text = domisiliDetail!.suratBody!.pendidikan ?? '';
        jenisKtpField.text = domisiliDetail!.suratBody!.kitasKitap ?? '';
        pekerjaanField.text = domisiliDetail!.suratBody!.pekerjaan ?? '';
        tinggalSejakField.text = domisiliDetail!.suratBody!.tinggalSejak ?? '';
        alamatField.text = domisiliDetail!.suratBody!.alamat!.replaceAll("\n", " ");
        alamatAsalField.text = domisiliDetail!.suratBody!.alamatAsal!.replaceAll("\n", " ");
        rwField.text = domisiliDetail!.rw!.nomor ?? '';
        rtField.text = domisiliDetail!.rt!.nomor ?? '';
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
    _getDomisiliDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Surat Domisili',
          style: whiteTextStyle,
        ),
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
                padding: EdgeInsets.all(defaultmargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edit Data Pengajuan Surat',
                      style: darkTextStyle.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: defaultmargin,
                    ),
                    ClearMailField(title: 'Nomor Induk Kependudukan', type: TextInputType.number, controller: nikField),
                    ClearMailField(title: 'Nama Lengkap', type: TextInputType.text, controller: nameField),
                    ClearMailField(title: 'Tempat Lahir', type: TextInputType.text, controller: tempatLahirField),
                    ClearMailField(title: 'Tanggal Lahir', type: TextInputType.text, controller: tanggalLahirField),
                    ClearMailField(title: 'Jenis Kelamin', type: TextInputType.text, controller: jenisKelaminField),
                    ClearMailField(title: 'Kewarganegaraan', type: TextInputType.text, controller: kewarganegaraanField),
                    ClearMailField(title: 'Negara', type: TextInputType.text, controller: negaraField),
                    ClearMailField(title: 'Agama', type: TextInputType.text, controller: agamaField),
                    ClearMailField(title: 'Status Perkawinan', type: TextInputType.text, controller: statusKawinField),
                    ClearMailField(title: 'Pendidikan', type: TextInputType.text, controller: pendidikanField),
                    ClearMailField(title: 'Pekerjaan', type: TextInputType.text, controller: pekerjaanField),
                    ClearMailField(title: 'Alamat', type: TextInputType.text, controller: alamatField),
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
                    SizedBox(
                      height: defaultmargin,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(double.infinity, 0),
                        padding: const EdgeInsets.all(16),
                        backgroundColor: const Color(0xffD3DEDC),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          print('Edit surat');
                        }
                      },
                      child: Text(
                        'Edit Pengajuan Surat',
                        style: darkTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semibold,
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
