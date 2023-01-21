import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wangunsari/components/alert_card.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class SuratKelahiran extends StatefulWidget {
  const SuratKelahiran({super.key});

  @override
  State<SuratKelahiran> createState() => _SuratKelahiranState();
}

class _SuratKelahiranState extends State<SuratKelahiran> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
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

  void _submitMails() async {
    ApiResponse response = await submitKelahiranMail(
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
    }
  }

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
                    'Form Pengajuan\nSurat Keterangan Kelahiran',
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
                  'Data Anak',
                  style: darkTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClearMailField(title: 'Nama Anak', type: TextInputType.number, controller: nameField),
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
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                  ),
                  items: const [
                    'LAKI-LAKI',
                    'PEREMPUAN',
                  ],
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                      hintText: "jenis kelamin",
                    ),
                  ),
                  onChanged: (value) {
                    switch (value) {
                      case 'LAKI-LAKI':
                        jenisKelaminField.text = 'LAKI-LAKI';
                        break;
                      case 'PEREMPUAN':
                        jenisKelaminField.text = 'PEREMPUAN';
                        break;
                      default:
                        // print('default');
                        break;
                    }
                    // print(jenisSuratField.text);
                  },
                  selectedItem: "LAKI-LAKI",
                ),
                const SizedBox(
                  height: 15,
                ),
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
