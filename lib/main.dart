import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrc/MVVM/View%20Model/universities_view_model.dart';
import 'package:mrc/MVVM/Views/Authentication/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UniversitiesViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'MRC',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ).copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
        home: const Login(),
      ),
    );
  }
}
