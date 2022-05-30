import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/category_screen.dart';
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
                      const MainTitleCard(mainTitle: "Popular on Netflix"),
                      const MainTitleCard(mainTitle: "Trending Now"),
                      const MainTitleCard(mainTitle: "TV Show Based on Books"),
                      const NumberTitleCard(),
                      const MainTitleCard(mainTitle: "US Mivies"),
                      const MainTitleCard(mainTitle: "Hindi Movies and TV"),
                    ],
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 80,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const Spacer(),
                                const Icon(
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Categories()));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "TV Shows",
                                    style: kHomeTitleText,
                                  ),
                                  const Text(
                                    "Movies",
                                    style: kHomeTitleText,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        "Categories",
                                        style: kHomeTitleText,
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        });
  }
}
