import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, status, _) {
          return Scaffold(
            appBar: AppBar(actions: [
              IconButton(
                onPressed: () async {
                  
                },
                icon: const Icon(Icons.add),
              )
            ]),
            body: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      BackgroundCard(),
                      MainTitleCard(mainTitle: "Popular on Netflix"),
                      MainTitleCard(mainTitle: "Trending Now"),
                      MainTitleCard(mainTitle: "TV Show Based on Books"),
                      NumberTitleCard(),
                      MainTitleCard(mainTitle: "US Mivies"),
                      MainTitleCard(mainTitle: "Hindi Movies and TV"),
                    ],
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 70,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                  width: 50,
                                  height: 50,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  "Movies",
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  "Categories",
                                  style: kHomeTitleText,
                                ),
                              ],
                            )
                          ]),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          );
        });
  }
}
