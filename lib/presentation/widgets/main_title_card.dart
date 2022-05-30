import 'package:flutter/material.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final mainTitle;
  final callFrom;
  const MainTitleCard({
    Key? key,
    this.callFrom,
    required this.mainTitle,
  }) : super(key: key);

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
              future: getData(mainTitle),
              builder: (BuildContext context,
                  AsyncSnapshot<List<DataModel>> snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator()),
                  );
                }
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      snapshot.data!.length,
                      (index) => MainCardWidget(
                          url: snapshot.data![index].posterPath)),
                );
              }),
        ),
      ],
    );
  }

  Future<List<DataModel>> getData(String callFrom) async {
    switch (callFrom) {
      case 'Popular on Netflix':
        return await MovieDB().getAllMovies();

      case 'Trending Now':
        return await MovieDB().getPopular();

      case 'New Releases':
        return await MovieDB().getTrending();

      case 'TV Show Based on Books':
        return await MovieDB().getTVShow();

      case 'US Mivies':
        return await MovieDB().getAllMovies();

      case 'US Mivies':
        return await MovieDB().getTrending();

      case 'Hindi Movies and TV':
        return await MovieDB().getPopular();
      default:
        return [];
    }
  }
}
