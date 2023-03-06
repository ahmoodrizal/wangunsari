import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';

class GantiPassword extends StatefulWidget {
  const GantiPassword({super.key});

  @override
  State<GantiPassword> createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  var obsecureTextOldPass = true;
  var obsecureTextNewPass = true;
  var obsecureTextConfirmPass = true;
  bool _loading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController oldPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  Future<void> _ubahPassword() async {
    ApiResponse response = await changePassword(oldPass.text, newPass.text);
    if (response.error == null) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Berhasil Ubah Password',
            style: darkTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: (() => context.goNamed('login')),
              child: Text('Ok', style: darkTextStyle),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ubah Password',
          style: whiteTextStyle,
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsets.all(defaultmargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: (value) => value!.length < 6 ? 'Required min 6 character' : null,
                controller: oldPass,
                style: darkTextStyle.copyWith(
                  fontSize: 16,
                ),
                showCursor: false,
                obscureText: obsecureTextOldPass,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecureTextOldPass = !obsecureTextOldPass;
                      });
                    },
                    icon: obsecureTextOldPass
                        ? Icon(
                            Icons.remove_red_eye,
                            color: primaryColor,
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: greyColor,
                          ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  label: Text(
                    'Password',
                    style: darkTextStyle.copyWith(
                      color: greyColor,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) => value!.length < 6 ? 'Required min 6 character' : null,
                controller: newPass,
                style: darkTextStyle.copyWith(
                  fontSize: 16,
                ),
                showCursor: false,
                obscureText: obsecureTextNewPass,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecureTextNewPass = !obsecureTextNewPass;
                      });
                    },
                    icon: obsecureTextNewPass
                        ? Icon(
                            Icons.remove_red_eye,
                            color: primaryColor,
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: greyColor,
                          ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  label: Text(
                    'Password Baru',
                    style: darkTextStyle.copyWith(
                      color: greyColor,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) => value!.length < 6 ? 'Required min 6 character' : null,
                controller: confirmPass,
                style: darkTextStyle.copyWith(
                  fontSize: 16,
                ),
                showCursor: false,
                obscureText: obsecureTextConfirmPass,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecureTextConfirmPass = !obsecureTextConfirmPass;
                      });
                    },
                    icon: obsecureTextConfirmPass
                        ? Icon(
                            Icons.remove_red_eye,
                            color: primaryColor,
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: greyColor,
                          ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  label: Text(
                    'Konfirmasi Password Baru',
                    style: darkTextStyle.copyWith(
                      color: greyColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2 * defaultmargin,
              ),
              _loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          if (newPass.text != confirmPass.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'password baru tidak sama',
                                  style: whiteTextStyle,
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              _loading = !_loading;
                            });
                            _ubahPassword();
                            // print('lah kok ganti pwd');
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Ubah Password',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
