import 'package:flutter/material.dart';
import 'package:shwelamin/pages/stockPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shwelamin/pages/login.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized;
  Supabase.initialize(

      url: 'https://plywwacsllfxcflqcdcs.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBseXd3YWNzbGxmeGNmbHFjZGNzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTE1NjY1NzQsImV4cCI6MjAwNzE0MjU3NH0.awtO05BDfB4agq2CnWanKn_TPgc7gGUdm4-uAwnUmSE');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.blueGrey),

      home: const Scaffold(body: StockPage()),
    );
  }
}
