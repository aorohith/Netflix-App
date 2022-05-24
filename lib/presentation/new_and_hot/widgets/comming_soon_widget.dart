import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_icon_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 425,
          child: Column(
            children: const [
              Text(
                "FEB",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 425,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SPIDERMAN",
                    style: TextStyle(
                      letterSpacing: -2,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const Spacer(),
                  Wrap(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: "Remind Me",
                        iconSize: 20,
                        fontSize: 12,
                      ),
                      kWidth20,
                      kWidth20,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: "Info",
                        iconSize: 20,
                        fontSize: 12,
                      ),
                      kWidth20,
                      kWidth20,
                    ],
                  )
                ],
              ),
              kHeight,
              const Text("Comming on Friday"),
              kHeight,
              Text(
                "Spiderman 3",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                '''Landing the lead in the school musical is a dream come true for Jodl,until the pressure sends her confidence--- and her relationship--- into a tallspin''',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              kHeight50,
              Row(
                children: [],
              )
            ],
          ),
        ),
      ],
    );
  }
}
