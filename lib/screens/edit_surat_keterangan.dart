import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/models/mail_keterangan_detail.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/mail.dart';
import 'package:wangunsari/theme.dart';
import 'package:wangunsari/services/user.dart';
import 'package:go_router/go_router.dart';

class EditSuratKeterangan extends StatefulWidget {
  final String suratId;
  const EditSuratKeterangan({super.key, required this.suratId});

  @override
  State<EditSuratKeterangan> createState() => _EditSuratKeteranganState();
}

class _EditSuratKeteranganState extends State<EditSuratKeterangan> {
  MailKeteranganDetailService? keteranganDetail;
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
  TextEditingController jenisSuratField = TextEditingController();
  TextEditingController suratIdField = TextEditingController();
  TextEditingController suratDetailField = TextEditingController();

  void _getKeteranganDetail() async {
    ApiResponse response = await keteranganMailDetail(widget.suratId);
    if (response.error == null) {
      setState(() {
        keteranganDetail = response.data as MailKeteranganDetailService;
        loading = false;
        nikField.text = keteranganDetail!.suratBody!.nik ?? '';
        nameField.text = keteranganDetail!.suratBody!.nama ?? '';
        tempatLahirField.text = keteranganDetail!.suratBody!.tempatLahir ?? '';
        tanggalLahirField.text = keteranganDetail!.suratBody!.tanggalLahir ?? '';
        jenisKelaminField.text = keteranganDetail!.suratBody!.jenisKelamin ?? '';
        kewarganegaraanField.text = keteranganDetail!.suratBody!.wargaNegara ?? '';
        negaraField.text = keteranganDetail!.suratBody!.negaraNama ?? '';
        agamaField.text = keteranganDetail!.suratBody!.agama ?? '';
        statusKawinField.text = keteranganDetail!.suratBody!.statusKawin ?? '';
        pendidikanField.text = keteranganDetail!.suratBody!.pendidikan ?? '';
        jenisKtpField.text = keteranganDetail!.suratBody!.kitasKitap ?? '';
        pekerjaanField.text = keteranganDetail!.suratBody!.pekerjaan ?? '';
        jenisSuratField.text = keteranganDetail!.suratBody!.jenisSuratKeteranganId ?? '';
        alamatField.text = keteranganDetail!.suratBody!.alamat!.replaceAll("\n", " ");
        rwField.text = keteranganDetail!.rw!.nomor ?? '';
        rtField.text = keteranganDetail!.rt!.nomor ?? '';
        suratIdField.text = widget.suratId;
        suratDetailField.text = keteranganDetail!.suratBody!.id.toString();
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

  void _editKeteranganMails() async {
    ApiResponse response = await editKeteranganMail(
        suratIdField.text,
        suratDetailField.text,
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
        jenisSuratField.text);
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
    _getKeteranganDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Surat Keterangan',
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
                    DropdownSearch<String>(
                      popupProps: const PopupProps.menu(
                        showSelectedItems: true,
                      ),
                      items: const [
                        'Surat Keterangan Usaha',
                        'Surat Keterangan Belum Kawin',
                        'Surat Keterangan Janda/Duda',
                        'Surat Keterangan Tidak Mampu',
                      ],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Pilih Jenis Surat",
                          hintText: "pilih jenis surat",
                        ),
                      ),
                      onChanged: (value) {
                        switch (value) {
                          case 'Surat Keterangan Usaha':
                            jenisSuratField.text = '1';
                            break;
                          case 'Surat Keterangan Belum Kawin':
                            jenisSuratField.text = '2';
                            break;
                          case 'Surat Keterangan Janda/Duda':
                            jenisSuratField.text = '3';
                            break;
                          case 'Surat Keterangan Tidak Mampu':
                            jenisSuratField.text = '4';
                            break;
                          default:
                            jenisSuratField.text = '1';
                            break;
                        }
                        // print(jenisSuratField.text);
                      },
                      selectedItem: jenisSuratField.text == '1'
                          ? 'Surat Keterangan Usaha'
                          : jenisSuratField.text == '2'
                              ? 'Surat Keterangan Belum Kawin'
                              : jenisSuratField.text == '3'
                                  ? 'Surat Keterangan Janda/Duda'
                                  : 'Surat Keterangan Tidak Mampu',
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
                          _editKeteranganMails();
                          // print('Edit surat');
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
