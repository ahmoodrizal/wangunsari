import 'package:flutter/material.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/mail_kelahiran_detail.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class EditSuratKelahiran extends StatefulWidget {
  final String suratId;
  const EditSuratKelahiran({super.key, required this.suratId});

  @override
  State<EditSuratKelahiran> createState() => _EditSuratKelahiranState();
}

class _EditSuratKelahiranState extends State<EditSuratKelahiran> {
  MailKelahiranDetailService? kelahiranDetail;
  bool _loading = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController suratIdField = TextEditingController();
  TextEditingController suratDetailField = TextEditingController();
  TextEditingController rtField = TextEditingController();
  TextEditingController rwField = TextEditingController();
  TextEditingController nameField = TextEditingController();
  TextEditingController tempatLahirField = TextEditingController();
  TextEditingController tanggalLahirField = TextEditingController();
  TextEditingController waktuField = TextEditingController();
  TextEditingController jenisKelaminField = TextEditingController();
  TextEditingController kidsField = TextEditingController();
  TextEditingController weightField = TextEditingController();
  TextEditingController longField = TextEditingController();
  TextEditingController ayahNikField = TextEditingController();
  TextEditingController ayahNameField = TextEditingController();
  TextEditingController ayahTempatLahirField = TextEditingController();
  TextEditingController ayahTanggalLahirField = TextEditingController();
  TextEditingController ayahAgamaField = TextEditingController();
  TextEditingController ayahWorkField = TextEditingController();
  TextEditingController ayahAddressField = TextEditingController();
  TextEditingController ibuNikField = TextEditingController();
  TextEditingController ibuNameField = TextEditingController();
  TextEditingController ibuTempatLahirField = TextEditingController();
  TextEditingController ibuTanggalLahirField = TextEditingController();
  TextEditingController ibuAgamaField = TextEditingController();
  TextEditingController ibuWorkField = TextEditingController();
  TextEditingController ibuAddressField = TextEditingController();

  void _getKelahiranDetail() async {
    ApiResponse response = await kelahiranMailDetail(widget.suratId);
    if (response.error == null) {
      setState(() {
        kelahiranDetail = response.data as MailKelahiranDetailService;
        suratIdField.text = widget.suratId;
        suratDetailField.text = kelahiranDetail!.suratBody!.id.toString();
        rtField.text = kelahiranDetail!.rt!.nomor ?? '';
        rwField.text = kelahiranDetail!.rw!.nomor ?? '';
        nameField.text = kelahiranDetail!.suratBody!.namaAnak ?? '';
        tempatLahirField.text = kelahiranDetail!.suratBody!.tempatLahir ?? '';
        tanggalLahirField.text = kelahiranDetail!.suratBody!.tanggalLahir ?? '';
        waktuField.text = kelahiranDetail!.suratBody!.waktuLahir ?? '';
        jenisKelaminField.text = kelahiranDetail!.suratBody!.jenisKelamin ?? '';
        kidsField.text = kelahiranDetail!.suratBody!.anakKe ?? '';
        weightField.text = kelahiranDetail!.suratBody!.berat ?? '';
        longField.text = kelahiranDetail!.suratBody!.panjang ?? '';
        ayahNikField.text = kelahiranDetail!.suratBody!.ayahNik ?? '';
        ayahNameField.text = kelahiranDetail!.suratBody!.ayahNama ?? '';
        ayahTempatLahirField.text = kelahiranDetail!.suratBody!.ayahTempatLahir ?? '';
        ayahTanggalLahirField.text = kelahiranDetail!.suratBody!.ayahTanggalLahir ?? '';
        ayahAgamaField.text = kelahiranDetail!.suratBody!.ayahAgama ?? '';
        ayahWorkField.text = kelahiranDetail!.suratBody!.ayahPekerjaan ?? '';
        ayahAddressField.text = kelahiranDetail!.suratBody!.ayahAlamat ?? '';
        ibuNikField.text = kelahiranDetail!.suratBody!.ibuNik ?? '';
        ibuNameField.text = kelahiranDetail!.suratBody!.ibuNama ?? '';
        ibuTempatLahirField.text = kelahiranDetail!.suratBody!.ibuTempatLahir ?? '';
        ibuTanggalLahirField.text = kelahiranDetail!.suratBody!.ibuTanggalLahir ?? '';
        ibuAgamaField.text = kelahiranDetail!.suratBody!.ibuAgama ?? '';
        ibuWorkField.text = kelahiranDetail!.suratBody!.ibuPekerjaan ?? '';
        ibuAddressField.text = kelahiranDetail!.suratBody!.ibuAlamat ?? '';
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

  void _editMailKelahiran() async {
    ApiResponse response = await editKelahiranMail(
      suratIdField.text,
      suratDetailField.text,
      rtField.text,
      rwField.text,
      nameField.text,
      tempatLahirField.text,
      tanggalLahirField.text,
      waktuField.text,
      jenisKelaminField.text,
      kidsField.text,
      weightField.text,
      longField.text,
      ayahNikField.text,
      ayahNameField.text,
      ayahTempatLahirField.text,
      ayahTanggalLahirField.text,
      ayahAgamaField.text,
      ayahWorkField.text,
      ayahAddressField.text,
      ibuNikField.text,
      ibuNameField.text,
      ibuTempatLahirField.text,
      ibuTanggalLahirField.text,
      ibuAgamaField.text,
      ibuWorkField.text,
      ibuAddressField.text,
    );
    if (response.error == null) {
      // Navigator.of(context).pop();
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Perbaiki Pengajuan Surat Berhasil',
            style: darkTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: (() => context.goNamed('status')),
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
    }
  }

  @override
  void initState() {
    // print(widget.suratId);
    _getKelahiranDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Surat Kelahiran',
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
                    Text(
                      'Data Diri Anak',
                      style: darkTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ClearMailField(title: 'Nama Anak', type: TextInputType.text, controller: nameField),
                    ClearMailField(title: 'Tempat Lahir', type: TextInputType.text, controller: tempatLahirField),
                    TextFormField(
                      readOnly: true,
                      controller: tanggalLahirField,
                      validator: (value) => value!.isEmpty ? 'tanggal lahir tidak boleh kosong' : null,
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
                                  tanggalLahirField.text = value.toString().substring(0, 10);
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
                          'Tanggal Lahir',
                          style: darkTextStyle.copyWith(
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                    ClearMailField(title: 'Waktu Lahir', type: TextInputType.text, controller: waktuField),
                    ClearMailField(title: 'Jenis Kelamin', type: TextInputType.text, controller: jenisKelaminField),
                    ClearMailField(title: 'Berat Anak - gram', type: TextInputType.text, controller: weightField),
                    ClearMailField(title: 'Tinggi Anak - cm', type: TextInputType.text, controller: longField),
                    ClearMailField(title: 'Anak ke - ', type: TextInputType.text, controller: kidsField),
                    ClearMailField(title: 'RW', type: TextInputType.text, controller: rwField),
                    ClearMailField(title: 'RT', type: TextInputType.text, controller: rtField),
                    const SizedBox(
                      height: 30,
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
                    ClearMailField(title: 'NIK Ayah', type: TextInputType.number, controller: ayahNikField),
                    ClearMailField(title: 'Nama Ayah', type: TextInputType.number, controller: ayahNameField),
                    ClearMailField(title: 'Tempat Lahir Ayah', type: TextInputType.text, controller: ayahTempatLahirField),
                    TextFormField(
                      readOnly: true,
                      controller: ayahTanggalLahirField,
                      validator: (value) => value!.isEmpty ? 'tanggal lahir tidak boleh kosong' : null,
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
                                  ayahTanggalLahirField.text = value.toString().substring(0, 10);
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
                          'Tanggal Lahir Ayah',
                          style: darkTextStyle.copyWith(
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                    ClearMailField(title: 'Pekerjaan Ayah', type: TextInputType.text, controller: ayahWorkField),
                    ClearMailField(title: 'Agama Ayah', type: TextInputType.text, controller: ayahAgamaField),
                    ClearMailField(title: 'Alamat Ayah', type: TextInputType.text, controller: ayahAddressField),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Data Orang Tua - Ibu',
                      style: darkTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: medium,
                      ),
                    ),
                    ClearMailField(title: 'NIK Ibu', type: TextInputType.number, controller: ibuNikField),
                    ClearMailField(title: 'Nama Ibu', type: TextInputType.number, controller: ibuNameField),
                    ClearMailField(title: 'Tempat Lahir Ibu', type: TextInputType.text, controller: ibuTempatLahirField),
                    TextFormField(
                      readOnly: true,
                      controller: ibuTanggalLahirField,
                      validator: (value) => value!.isEmpty ? 'tanggal lahir ibu tidak boleh kosong' : null,
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
                                  ibuTanggalLahirField.text = value.toString().substring(0, 10);
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
                          'Tanggal Lahir Ibu',
                          style: darkTextStyle.copyWith(
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                    ClearMailField(title: 'Pekerjaan Ibu', type: TextInputType.text, controller: ibuWorkField),
                    ClearMailField(title: 'Agama Ibu', type: TextInputType.text, controller: ibuAgamaField),
                    ClearMailField(title: 'Alamat Ibu', type: TextInputType.text, controller: ibuAddressField),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(double.infinity, 0),
                        padding: const EdgeInsets.all(16),
                        backgroundColor: const Color(0xffD3DEDC),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          _editMailKelahiran();
                          // print('Edit surat kelahiran');
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
