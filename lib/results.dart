import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final String fight;
  final String percentageOfFight;
  final double processingTime;

  const ResultScreen(
      {super.key,
      required this.fight,
      required this.percentageOfFight,
      required this.processingTime});

  @override
  Widget build(BuildContext context) {
    Widget fightResult() {
      String realPercentage =
          ((double.parse(percentageOfFight)) * 100).toStringAsFixed(2);

      String processingTimeString = processingTime.toString();
      if (fight == 'false') {
        return Text(
          'We are $realPercentage % sure that there is no violence in this video. Processing Time: $processingTimeString seconds',
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Color.fromARGB(255, 0, 0, 40),
            fontSize: 16,
          ),
        );
      }
      return Text(
        'We are $realPercentage % sure that there is violence in this video. Processing Time: $processingTimeString seconds',
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 40),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        )),
      );
    }

    Widget uploadButton() {
      return SizedBox(
        height: 100,
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              backgroundColor: const MaterialStatePropertyAll(
                  Color.fromARGB(255, 255, 166, 0)),
              enableFeedback: true,
              elevation: const MaterialStatePropertyAll(15.0),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    size: 20,
                    Icons.done_rounded,
                    color: Color.fromARGB(255, 0, 0, 40),
                  ),
                  Expanded(
                    child: fightResult(),
                  ),
                ],
              ),
            )),
      );
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 0, 0, 40),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Results',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'are in!',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
            ),
            const SizedBox(
              height: 100,
            ),
            uploadButton(),
          ],
        ),
      ),
    );
  }
}
