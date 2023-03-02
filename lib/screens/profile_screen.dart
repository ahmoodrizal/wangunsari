import 'package:flutter/material.dart';
import 'package:wangunsari/models/api_response.dart';
import 'package:wangunsari/services/config.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserService? user;
  bool loading = true;
  late List<Roles> roles = [];

  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as UserService;
        List userRoles = user!.data!.user!.roles!;
        for (var element in userRoles) {
          roles.add(element);
        }
        loading = false;
        // print(roles[1].name);
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
        title: Text(
          'Akun Saya',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : ListView(
              padding: EdgeInsets.only(
                left: defaultmargin,
                right: defaultmargin,
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      margin: const EdgeInsets.only(top: 50),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 205, 211, 228),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 85,
                                height: 85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage('${user!.data!.user!.profilePhotoUrl}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${user!.data!.user!.name}',
                                      style: darkTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Menu',
                  style: darkTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                roles.length > 1
                    ? GestureDetector(
                        onTap: () {
                          switch (roles[1].name) {
                            case 'Rukun Tetangga':
                              context.goNamed('admin-rt-area');
                              break;
                            case 'Rukun Warga':
                              context.goNamed('admin-rw-area');
                              break;
                            default:
                          }
                          // print('ke menu admin area');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cek daftar pengajuan surat',
                              style: darkTextStyle.copyWith(fontSize: 16),
                            ),
                            Icon(
                              Icons.mail_outline_rounded,
                              size: 26,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: defaultmargin,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Yakin Keluar ?',
                          style: darkTextStyle,
                        ),
                        actions: [
                          TextButton(
                            onPressed: (() => Navigator.pop(context)),
                            child: Text('Batal', style: darkTextStyle),
                          ),
                          TextButton(
                            onPressed: () {
                              logout().then((value) => context.goNamed('login'));
                            },
                            child: Text(
                              'Keluar',
                              style: darkTextStyle.copyWith(
                                color: const Color.fromARGB(255, 201, 100, 93),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Logout',
                        style: darkTextStyle.copyWith(fontSize: 16, color: const Color.fromARGB(255, 201, 100, 93)),
                      ),
                      const Icon(Icons.exit_to_app_rounded, size: 26, color: Color.fromARGB(255, 201, 100, 93)),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
