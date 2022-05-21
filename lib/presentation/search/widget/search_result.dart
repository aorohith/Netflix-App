import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const _imageUrl = 'assets/images/img1.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            childAspectRatio: 1.2/1.7,
            children: List.generate(20, (index) {
              return const MainCard();
            }),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(_imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
