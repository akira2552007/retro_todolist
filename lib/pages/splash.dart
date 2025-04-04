import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_to_do_app/pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '8-BIT\nLIST',
              style: GoogleFonts.pressStart2p(
                fontSize: 30,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          SpinKitCircle(
            color: Colors.green,
            size: 30,
          ),
        ],
      ),
    );
  }
}
