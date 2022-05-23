import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 225,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/img3.jpeg",
          ),
        ),
      ),
    );
  }
}
