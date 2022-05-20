import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final imageList = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpeg',
    'assets/images/img3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWidget(appBarTitle: "Downloads"),
      ),
      body: ListView(
        children: [
          const _SmartDownloads(),
          const Text(
            "Introdusing Downloads for you",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            textAlign: TextAlign.center,
            "We'll doawnload a personalized selection of\nmovies and shows for you, so there's always\nsomething to watch on your device.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          kHeight,
          SizedBox(
            height: size.width,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.37,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                ),
                DownloadsImgaeWidget(
                  imagePath: imageList[0],
                  height: 0.5,
                  margin: EdgeInsets.only(
                    left: 150,
                    bottom: 40,
                  ),
                  angle: 20,
                ),
                DownloadsImgaeWidget(
                  imagePath: imageList[1],
                  height: 0.5,
                  margin: EdgeInsets.only(
                    right: 150,
                    bottom: 40,
                  ),
                  angle: -20,
                ),
                DownloadsImgaeWidget(
                  height: 0.58,
                  imagePath: imageList[2],
                  margin: EdgeInsets.only(left: 0),
                )
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: kBtnColorBlue,
            child: Text(
              "Set Up",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kBtnColorWhite,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: kBtnColorWhite,
            child: Text(
              "See What You Can Download",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImgaeWidget extends StatelessWidget {
  DownloadsImgaeWidget({
    Key? key,
    required this.imagePath,
    this.angle = 0,
    required this.margin,
    required this.height,
  }) : super(key: key);

  final String imagePath;
  final double angle;
  final EdgeInsets margin;
  final double height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.387,
        height: size.width * height,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imagePath,
              ),
            ),
            color: kBlackColor,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
