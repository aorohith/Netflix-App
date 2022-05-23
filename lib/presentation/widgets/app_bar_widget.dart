import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class AppbarWidget extends StatelessWidget {
  String appBarTitle;
  AppbarWidget({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            appBarTitle,
            style: GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(
            Icons.cast,
            color: kWhiteColor,
          ),
          kWidth10,
          Container(
            height: 25,
            width: 25,
            color: Colors.blue,
          ),
          kWidth10,
        ],
      ),
    );
  }
}
