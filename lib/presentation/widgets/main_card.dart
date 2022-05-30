import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';

class MainCardWidget extends StatelessWidget {
  final url;
  const MainCardWidget({
    Key? key,
    
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 225,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          image: NetworkImage(
            '$kBaseUrl$url',
          ),
        ),
      ),
    );
  }
}
