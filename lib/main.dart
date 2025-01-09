import 'package:flutter/material.dart';
import 'package:latihan_ukk/Admin.dart';
import 'package:latihan_ukk/Loginpage.dart';
import 'package:latihan_ukk/Signup.dart';
import 'package:latihan_ukk/welcomePages.dart';
import 'supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.initialize();
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
      home: const Loginpage(),
    );
  }
}