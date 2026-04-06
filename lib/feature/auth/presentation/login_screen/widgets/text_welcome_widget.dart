import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWelcomeWidget extends StatelessWidget {
  const TextWelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 150,
      top: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    )),
                Text('Back!',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                            fontSize: 20)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
