import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:wangunsari/components/clear_form_field.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var obsecureText = true;
  bool loading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nikField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  void _loginUser() async {
    ApiResponse response = await login(nikField.text.replaceAll('-', ''), passwordField.text);
    // success login and fetching API
    if (response.error == null) {
      _saveTokenAndRedirectToHome(response.data as UserService);
    } else {
      // error
      setState(() {
        loading = false;
      });
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

  void _saveTokenAndRedirectToHome(UserService user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.data!.accessToken ?? '');
    await pref.setInt('user_id', user.data!.user!.id ?? 0);
    context.goNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: ListView(
            padding: EdgeInsetsDirectional.all(defaultmargin),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Masuk',
                    style: darkTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: semibold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Silahkan masukan data diri anda dengan NIK dan password, hubungi admin apabila terdapat masalah.',
                    style: darkTextStyle,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [MaskedInputFormatter('0000-0000-0000-0000')],
                    controller: nikField,
                    validator: (value) => value!.isEmpty ? 'NIK tidak boleh kosong' : null,
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
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) => value!.length < 6 ? 'Required min 6 character' : null,
                    controller: passwordField,
                    style: darkTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    showCursor: false,
                    obscureText: obsecureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                        icon: obsecureText
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
                  const SizedBox(
                    height: 50,
                  ),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                                _loginUser();
                              });
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
                                'Masuk',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                          ),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
