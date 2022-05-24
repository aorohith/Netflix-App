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
              future: MovieDB().getPopular(),
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
}
