import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://lktpvykdfvclisufdcvy.supabase.co';
  static const String supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxrdHB2eWtkZnZjbGlzdWZkY3Z5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1NTMwNjgsImV4cCI6MjA0NzEyOTA2OH0.Pe9z2ZCJaM3serVWNZ7qD4zMqwwja1IOflILFZGYdOI';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl, 
      anonKey: supabaseKey
    );
  }
}