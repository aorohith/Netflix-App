import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final String? path;
  const NumberCard({
    Key? key,
    required this.path,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: [
          SizedBox(
            width: 30,
            height: 150,
          ),
          Container(
            width: 150,
            height: 225,
            decoration: BoxDecoration(
              borderRadius: kRadius10,
              image: DecorationImage(
                image: NetworkImage(
                  "$kBaseUrl$path",
                ),
              ),
            ),
          ),
        ],
      ),
      Positioned(
        top: 76,
        child: BorderedText(
          strokeColor: Color.fromARGB(255, 197, 197, 197),
          strokeWidth: 5.0,
          child: Text("${index + 1}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 150,
                decoration: TextDecoration.none,
              )),
        ),
      )
    ]);
  }
}
