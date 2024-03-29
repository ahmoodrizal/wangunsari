import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';

class SuratNikah extends StatefulWidget {
  const SuratNikah({super.key});

  @override
  State<SuratNikah> createState() => _SuratNikahState();
}

class _SuratNikahState extends State<SuratNikah> {
  int currentStep = 0;
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  TextEditingController rtField = TextEditingController();
  TextEditingController rwField = TextEditingController();
  TextEditingController dateAcaraField = TextEditingController();
  TextEditingController waktuAcaraField = TextEditingController();
  TextEditingController calonAField = TextEditingController();
  TextEditingController calonBField = TextEditingController();
  TextEditingController withWhoField = TextEditingController();
  TextEditingController anakNikField = TextEditingController();
  TextEditingController anakNomorKKField = TextEditingController();
  TextEditingController anakNameField = TextEditingController();
  TextEditingController anakTempatLahirField = TextEditingController();
  TextEditingController anakTanggalLahirField = TextEditingController();
  TextEditingController anakWargaNegaraField = TextEditingController();
  TextEditingController anakNegaraNamaField = TextEditingController();
  TextEditingController anakAgamaField = TextEditingController();
  TextEditingController anakStatusKawinField = TextEditingController();
  TextEditingController anakPendidikanField = TextEditingController();
  TextEditingController anakPekerjaanField = TextEditingController();
  TextEditingController anakAlamatField = TextEditingController();
  TextEditingController calonNikField = TextEditingController();
  TextEditingController calonNomorKKField = TextEditingController();
  TextEditingController calonNameField = TextEditingController();
  TextEditingController calonTempatLahirField = TextEditingController();
  TextEditingController calonTanggalLahirField = TextEditingController();
  TextEditingController calonWargaNegaraField = TextEditingController();
  TextEditingController calonNegaraNamaField = TextEditingController();
  TextEditingController calonAgamaField = TextEditingController();
  TextEditingController calonStatusKawinField = TextEditingController();
  TextEditingController calonPendidikanField = TextEditingController();
  TextEditingController calonPekerjaanField = TextEditingController();
  TextEditingController calonAlamatField = TextEditingController();
  TextEditingController ayahNikField = TextEditingController();
  TextEditingController ayahNameield = TextEditingController();
  TextEditingController ayahTanggalLahirField = TextEditingController();
  TextEditingController ayahWargaNegaraField = TextEditingController();
  TextEditingController ayahNegaraNamaField = TextEditingController();
  TextEditingController ayahAgamaField = TextEditingController();
  TextEditingController ayahPekerjaanField = TextEditingController();
  TextEditingController ayahAlamatField = TextEditingController();
  TextEditingController ibuNikField = TextEditingController();
  TextEditingController ibuNameield = TextEditingController();
  TextEditingController ibuTanggalLahirField = TextEditingController();
  TextEditingController ibuWargaNegaraField = TextEditingController();
  TextEditingController ibuNegaraNamaField = TextEditingController();
  TextEditingController ibuAgamaField = TextEditingController();
  TextEditingController ibuPekerjaanField = TextEditingController();
  TextEditingController ibuAlamatField = TextEditingController();

  void _submitMails() async {
    ApiResponse response = await submitNikahMail(
      rwField.text,
      rtField.text,
      calonAField.text,
      calonBField.text,
      dateAcaraField.text,
      waktuAcaraField.text,
      withWhoField.text,
      anakNikField.text,
      anakNomorKKField.text,
      anakNameField.text,
      anakTempatLahirField.text,
      anakTanggalLahirField.text,
      anakWargaNegaraField.text,
      anakNegaraNamaField.text,
      anakAgamaField.text,
      anakStatusKawinField.text,
      anakPendidikanField.text,
      anakPekerjaanField.text,
      anakAlamatField.text,
      ayahNikField.text,
      ayahNameield.text,
      ayahTanggalLahirField.text,
      ayahWargaNegaraField.text,
      ayahNegaraNamaField.text,
      ayahAgamaField.text,
      ayahPekerjaanField.text,
      ayahAlamatField.text,
      ibuNikField.text,
      ibuNameield.text,
      ibuTanggalLahirField.text,
      ibuWargaNegaraField.text,
      ibuNegaraNamaField.text,
      ibuAgamaField.text,
      ibuPekerjaanField.text,
      ibuAlamatField.text,
      calonNikField.text,
      calonNomorKKField.text,
      calonNameField.text,
      calonTempatLahirField.text,
      calonTanggalLahirField.text,
      calonWargaNegaraField.text,
      calonNegaraNamaField.text,
      calonAgamaField.text,
      calonStatusKawinField.text,
      calonPendidikanField.text,
      calonPekerjaanField.text,
      calonAlamatField.text,
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

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Data Anak', style: darkTextStyle),
          content: Form(
            key: formKeys[0],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClearMailField(title: 'RW', type: TextInputType.number, controller: rwField),
                ClearMailField(title: 'RT', type: TextInputType.number, controller: rtField),
                ClearMailField(title: 'NIK', type: TextInputType.number, controller: anakNikField),
                ClearMailField(title: 'Nomor KK', type: TextInputType.number, controller: anakNomorKKField),
                ClearMailField(title: 'Nama Lengkap', type: TextInputType.text, controller: anakNameField),
                ClearMailField(title: 'Tempat Lahir', type: TextInputType.text, controller: anakTempatLahirField),
                TextFormField(
                  readOnly: true,
                  controller: anakTanggalLahirField,
                  validator: (value) => value!.isEmpty ? 'tanggal lahir anak tidak boleh kosong' : null,
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
                              anakTanggalLahirField.text = value.toString().substring(0, 10);
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
                const SizedBox(
                  height: 15,
                ),
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
                        calonAField.text = 'Mempelai Pria';
                        break;
                      case 'PEREMPUAN':
                        calonAField.text = 'Mempelai Wanita';
                        break;
                      default:
                        print('default');
                        break;
                    }
                    // print(jenisSuratField.text);
                  },
                  selectedItem: "LAKI-LAKI",
                ),
                ClearMailField(title: 'Warga Negara', type: TextInputType.text, controller: anakWargaNegaraField),
                ClearMailField(title: 'Negara', type: TextInputType.text, controller: anakNegaraNamaField),
                ClearMailField(title: 'Agama', type: TextInputType.text, controller: anakAgamaField),
                ClearMailField(title: 'Status Perkawinan', type: TextInputType.text, controller: anakStatusKawinField),
                ClearMailField(title: 'Pendidikan', type: TextInputType.text, controller: anakPendidikanField),
                ClearMailField(title: 'Pekerjaan', type: TextInputType.text, controller: anakPekerjaanField),
                ClearMailField(title: 'Alamat', type: TextInputType.text, controller: anakAlamatField),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Data Ayah', style: darkTextStyle),
          content: Form(
            key: formKeys[1],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClearMailField(title: 'NIK', type: TextInputType.number, controller: ayahNikField),
                ClearMailField(title: 'Nama Lengkap', type: TextInputType.text, controller: ayahNameield),
                TextFormField(
                  readOnly: true,
                  controller: ayahTanggalLahirField,
                  validator: (value) => value!.isEmpty ? 'tanggal lahir ayah tidak boleh kosong' : null,
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
                ClearMailField(title: 'Warga Negara', type: TextInputType.text, controller: ayahWargaNegaraField),
                ClearMailField(title: 'Negara', type: TextInputType.text, controller: ayahNegaraNamaField),
                ClearMailField(title: 'Agama', type: TextInputType.text, controller: ayahAgamaField),
                ClearMailField(title: 'Pekerjaan', type: TextInputType.text, controller: ayahPekerjaanField),
                ClearMailField(title: 'Alamat', type: TextInputType.text, controller: ayahAlamatField),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Data Ibu', style: darkTextStyle),
          content: Form(
            key: formKeys[2],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClearMailField(title: 'NIK', type: TextInputType.number, controller: ibuNikField),
                ClearMailField(title: 'Nama Lengkap', type: TextInputType.text, controller: ibuNameield),
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
                ClearMailField(title: 'Warga Negara', type: TextInputType.text, controller: ibuWargaNegaraField),
                ClearMailField(title: 'Negara', type: TextInputType.text, controller: ibuNegaraNamaField),
                ClearMailField(title: 'Agama', type: TextInputType.text, controller: ibuAgamaField),
                ClearMailField(title: 'Pekerjaan', type: TextInputType.text, controller: ibuPekerjaanField),
                ClearMailField(title: 'Alamat', type: TextInputType.text, controller: ibuAlamatField),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: Text('Data Calon Mempelai', style: darkTextStyle),
          content: Form(
            key: formKeys[3],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClearMailField(title: 'NIK', type: TextInputType.number, controller: calonNikField),
                ClearMailField(title: 'Nomor KK', type: TextInputType.number, controller: calonNomorKKField),
                ClearMailField(title: 'Nama Lengkap', type: TextInputType.text, controller: calonNameField),
                ClearMailField(title: 'Tempat Lahir', type: TextInputType.text, controller: calonTempatLahirField),
                TextFormField(
                  readOnly: true,
                  controller: calonTanggalLahirField,
                  validator: (value) => value!.isEmpty ? 'tanggal lahir calon tidak boleh kosong' : null,
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
                              calonTanggalLahirField.text = value.toString().substring(0, 10);
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
                const SizedBox(
                  height: 15,
                ),
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
                        calonBField.text = 'Mempelai Pria';
                        withWhoField.text = 'LAKI-LAKI';
                        break;
                      case 'PEREMPUAN':
                        calonBField.text = 'Mempelai Wanita';
                        withWhoField.text = 'PEREMPUAN';
                        break;
                      default:
                        // print('default');
                        break;
                    }
                    // print(jenisSuratField.text);
                  },
                  selectedItem: "LAKI-LAKI",
                ),
                ClearMailField(title: 'Warga Negara', type: TextInputType.text, controller: calonWargaNegaraField),
                ClearMailField(title: 'Negara', type: TextInputType.text, controller: calonNegaraNamaField),
                ClearMailField(title: 'Agama', type: TextInputType.text, controller: calonAgamaField),
                ClearMailField(title: 'Status Perkawinan', type: TextInputType.text, controller: calonStatusKawinField),
                ClearMailField(title: 'Pendidikan', type: TextInputType.text, controller: calonPendidikanField),
                ClearMailField(title: 'Pekerjaan', type: TextInputType.text, controller: calonPekerjaanField),
                ClearMailField(title: 'Alamat', type: TextInputType.text, controller: calonAlamatField),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: Text('Data Acara Pernikahan', style: darkTextStyle),
          content: Form(
            key: formKeys[4],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  readOnly: true,
                  controller: dateAcaraField,
                  validator: (value) => value!.isEmpty ? 'tanggal acara tidak boleh kosong' : null,
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
                              dateAcaraField.text = value.toString().substring(0, 10);
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
                      'Tanggal Acara',
                      style: darkTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClearMailField(title: 'Waktu Acara', type: TextInputType.text, controller: waktuAcaraField)
              ],
            ),
          ),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(primary: primaryColor)),
        child: Stepper(
          physics: const ClampingScrollPhysics(),
          type: StepperType.vertical,
          steps: getSteps(),
          onStepTapped: (step) {
            if (!formKeys[currentStep].currentState!.validate()) {
              return;
            }
            setState(() {
              currentStep = step;
            });
          },
          currentStep: currentStep,
          controlsBuilder: (context, details) {
            final isLastStep = currentStep == getSteps().length - 1;
            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text(
                        isLastStep ? 'Submit Surat' : 'Next',
                        style: whiteTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  if (currentStep != 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        child: Text(
                          'Kembali',
                          style: whiteTextStyle,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (!formKeys[currentStep].currentState!.validate()) {
              return;
            }
            if (isLastStep) {
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
                        // print('pengajuan surat nikah');
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
            } else {
              setState(
                () {
                  currentStep += 1;
                },
              );
            }
          },
          onStepCancel: currentStep == 0
              ? null
              : () => setState(
                    () {
                      currentStep -= 1;
                    },
                  ),
        ),
      ),
    );
  }
}
