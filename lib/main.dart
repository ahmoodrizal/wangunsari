import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/screens/admin_rt_area.dart';
import 'package:wangunsari/screens/admin_rw_area.dart';
import 'package:wangunsari/screens/detail_surat.dart';
import 'package:wangunsari/screens/edit_surat_domisili.dart';
import 'package:wangunsari/screens/edit_surat_kelahiran.dart';
import 'package:wangunsari/screens/edit_surat_keterangan.dart';
import 'package:wangunsari/screens/edit_surat_nikah.dart';
import 'package:wangunsari/screens/home_screen.dart';
import 'package:wangunsari/screens/login_screen.dart';
import 'package:wangunsari/screens/profile_screen.dart';
import 'package:wangunsari/screens/review_surat_kelahiran.dart';
import 'package:wangunsari/screens/review_surat_keterangan.dart';
import 'package:wangunsari/screens/review_surat_keterangan_domisili.dart';
import 'package:wangunsari/screens/review_surat_nikah.dart';
import 'package:wangunsari/screens/splash_screen.dart';
import 'package:wangunsari/screens/status_surat.dart';
import 'package:wangunsari/screens/surat_domisili.dart';
import 'package:wangunsari/screens/surat_kelahiran.dart';
import 'package:wangunsari/screens/surat_keluarga.dart';
import 'package:wangunsari/screens/surat_keterangan.dart';
import 'package:wangunsari/screens/surat_nikah.dart';
import 'package:wangunsari/screens/surat_pindah.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'surat-keterangan',
            name: 'surat-keterangan',
            builder: (context, state) => const SuratKeterangan(),
          ),
          GoRoute(
            path: 'surat-domisili',
            name: 'surat-domisili',
            builder: (context, state) => const SuratDomisili(),
          ),
          GoRoute(
            path: 'surat-kelahiran',
            name: 'surat-kelahiran',
            builder: (context, state) => const SuratKelahiran(),
          ),
          GoRoute(
            path: 'surat-keluarga',
            name: 'surat-keluarga',
            builder: (context, state) => const SuratKeluarga(),
          ),
          GoRoute(
            path: 'surat-pindah',
            name: 'surat-pindah',
            builder: (context, state) => const SuratPindah(),
          ),
          GoRoute(
            path: 'surat-nikah',
            name: 'surat-nikah',
            builder: (context, state) => const SuratNikah(),
          ),
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: 'admin-rt-area',
                name: 'admin-rt-area',
                builder: (context, state) => const AdminRTArea(),
                routes: [
                  GoRoute(
                    path: 'review-rt-surat-keterangan/:id',
                    name: 'review-rt-surat-keterangan',
                    builder: (context, state) => ReviewSuratKeterangan(id: state.params["id"]!),
                  ),
                  GoRoute(
                    path: 'review-rt-surat-domisili/:id',
                    name: 'review-rt-surat-domisili',
                    builder: (context, state) => ReviewSuratKeteranganDomisili(id: state.params["id"]!),
                  ),
                  GoRoute(
                    path: 'review-rt-surat-kelahiran/:id',
                    name: 'review-rt-surat-kelahiran',
                    builder: (context, state) => ReviewSuratKelahiran(id: state.params["id"]!),
                  ),
                  GoRoute(
                    path: 'review-rt-surat-nikah/:id',
                    name: 'review-rt-surat-nikah',
                    builder: (context, state) => ReviewSuratNikah(id: state.params["id"]!),
                  ),
                ],
              ),
              GoRoute(
                path: 'admin-rw-area',
                name: 'admin-rw-area',
                builder: (context, state) => const AdminRWArea(),
                routes: [
                  GoRoute(
                    path: 'review-rw-surat-keterangan/:id',
                    name: 'review-rw-surat-keterangan',
                    builder: (context, state) => ReviewSuratKeterangan(id: state.params["id"]!),
                  ),
                  GoRoute(
                    path: 'review-rw-surat-domisili/:id',
                    name: 'review-rw-surat-domisili',
                    builder: (context, state) => ReviewSuratKeteranganDomisili(id: state.params["id"]!),
                  ),
                  GoRoute(
                    path: 'review-rw-surat-kelahiran/:id',
                    name: 'review-rw-surat-kelahiran',
                    builder: (context, state) => ReviewSuratKelahiran(id: state.params["id"]!),
                  ),
                  GoRoute(
                    path: 'review-rw-surat-nikah/:id',
                    name: 'review-rw-surat-nikah',
                    builder: (context, state) => ReviewSuratNikah(id: state.params["id"]!),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'status',
            name: 'status',
            builder: (context, state) => const StatusSurat(),
            routes: [
              GoRoute(
                path: 'detail-surat/:id',
                name: 'detail-surat',
                builder: (context, state) => DetailSurat(id: state.params["id"]!),
                routes: [
                  GoRoute(
                    path: 'edit-surat-domisili/:suratId',
                    name: 'edit-surat-domisili',
                    builder: (context, state) => EditSuratDomisili(suratId: state.params["suratId"]!),
                  ),
                  GoRoute(
                    path: 'edit-surat-keterangan/:suratId',
                    name: 'edit-surat-keterangan',
                    builder: (context, state) => EditSuratKeterangan(suratId: state.params["suratId"]!),
                  ),
                  GoRoute(
                    path: 'edit-surat-nikah/:suratId',
                    name: 'edit-surat-nikah',
                    builder: (context, state) => EditSuratNikah(suratId: state.params["suratId"]!),
                  ),
                  GoRoute(
                    path: 'edit-surat-kelahiran/:suratId',
                    name: 'edit-surat-kelahiran',
                    builder: (context, state) => EditSuratKelahiran(suratId: state.params["suratId"]!),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    initialLocation: '/splash',
    routerNeglect: true,
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
