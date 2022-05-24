import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/home/widgets/custom_icon_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class CommingSoonWidget extends StatelessWidget {
  DataModel commingSoon;
  CommingSoonWidget({
    Key? key,
    required this.commingSoon,
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
              VideoWidget(
                  image: '$kBaseUrl${commingSoon.posterPath}'), //for image
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
              Row(
                children: [
                  Text(
                    commingSoon.title!,
                    style: TextStyle(
                      letterSpacing: -2,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              kHeight,
              const Text("Comming on Friday"),
              kHeight,
              Text(
                commingSoon.originalTitle!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: commingSoon.overview!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  )),
              kHeight,
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
