import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import '../../core/strings.dart';
import '../downloads/models/data_model/data_model.dart';
import 'main_card.dart';

class ContinueWatchingScreen extends StatelessWidget {
  String mainTitle;
  ContinueWatchingScreen({Key? key, required this.mainTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: mainTitle,
        ),
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
              future: MovieDB().getAllMovies(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<DataModel>> snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Container(
                        width: 50,
                        height: 50,
                        child: const CircularProgressIndicator()),
                  );
                }
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(snapshot.data!.length, (index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 225,
                          decoration: BoxDecoration(
                            borderRadius: kRadius10,
                            image: DecorationImage(
                              image: NetworkImage(
                                '$kBaseUrl${snapshot.data![index].posterPath}',
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.play_circle,
                          color: Colors.white.withOpacity(0.8),
                          size: 60,
                        ),
                        Positioned(
                          top: 150,
                          child: Container(
                            width: 134,
                            height: 50,
                            color: Color.fromARGB(255, 58, 57, 57),
                            child: Column(
                              children: [
                                const LinearProgressIndicator(
                                  value: 0.5,
                                  color: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all( 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                );
              }),
        ),
      ],
    );
  }
}
