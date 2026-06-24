import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_tao/main_screen.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'TIC TAC TOE',
                style: GoogleFonts.pressStart2p(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: AvatarGlow(
                  child: ClipOval(
                    child: Image.asset(
                      'lib/images/image3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                '@CreatedByJasper',
                style: GoogleFonts.pressStart2p(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 70,
                width: 290,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainScreen();
                        },
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: Text(
                    'Play',
                    style: GoogleFonts.pressStart2p(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
