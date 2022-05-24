import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const _imageUrl = 'assets/images/img1.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MovieDB().getTVShow(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DataModel>> searchResult) {
          if (searchResult.data == null) {
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextTitle(
                  title: 'Movies & TV',
                ),
                kHeight,
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1.2 / 1.7,
                    children: List.generate(20, (index) {
                      return MainCard(resultData: searchResult.data![index]);
                    }),
                  ),
                ),
              ],
            );
          }
        });
  }
}

class MainCard extends StatelessWidget {
  DataModel resultData;
  MainCard({Key? key, required this.resultData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('$kBaseUrl${resultData.posterPath}'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
