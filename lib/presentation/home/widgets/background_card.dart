import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/home/widgets/custom_icon_widget.dart';

class BackgroundCard extends StatelessWidget {
  BackgroundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
            future: MovieDB().getTrending(),
            builder: (BuildContext context,
                AsyncSnapshot<List<DataModel>> dataList) {
              if (dataList.data == null) {
                return const SizedBox(
                    width: double.infinity,
                    height: 565,
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ));
              } else {
                return Container(
                  width: double.infinity,
                  height: 565,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/iwnQ1JH1wdWrGYkgWySptJ5284A.jpg'),
                    ),
                  ),
                );
              }
            }),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                  icon: Icons.add,
                  title: "My List",
                ),
                _playButton(),
                CustomButtonWidget(
                  icon: Icons.info,
                  title: "Info",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kWhiteColor),
    ),
    onPressed: () {},
    icon: const Icon(
      Icons.play_arrow,
      size: 30,
      color: kBlackColor,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Play",
        style: TextStyle(
          fontSize: 25,
          color: kBlackColor,
        ),
      ),
    ),
  );
}
