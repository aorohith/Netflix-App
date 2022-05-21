import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const imageUrl = 'assets/images/img4.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(
          title: "Top Searches",
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchItemTile(),
            separatorBuilder: (ctx, index) => kHeight,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(children: [
      Container(
        width: screenWidth * 0.35,
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/img5.jpg"),
          ),
        ),
      ),
      const Expanded(
        child: Text(
          "Movie Name",
          style: TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      CircleAvatar(
        backgroundColor: kWhiteColor,
        radius: 23,
        child: CircleAvatar(
          backgroundColor: kBlackColor,
          radius: 21,
          child: Icon(
            CupertinoIcons.play_fill,
            color: kWhiteColor,
          ),
        ),
      ),
    ]);
  }
}
