import 'package:flutter/material.dart';
import 'package:latihan_ukk/Admin/Admin.dart';
import 'package:latihan_ukk/Admin/EditProduk.dart';
import 'package:latihan_ukk/Loginpage.dart';
import 'package:latihan_ukk/Admin/Signup.dart';
import 'package:latihan_ukk/Admin/TambahProduk.dart';
import 'package:latihan_ukk/welcomePages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://lktpvykdfvclisufdcvy.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxrdHB2eWtkZnZjbGlzdWZkY3Z5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1NTMwNjgsImV4cCI6MjA0NzEyOTA2OH0.Pe9z2ZCJaM3serVWNZ7qD4zMqwwja1IOflILFZGYdOI'
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Admin(),
    );
  }
}