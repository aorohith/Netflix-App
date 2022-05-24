import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/home/widgets/custom_icon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            title: Text(
              "New & Hot",
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
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
            bottom: TabBar(
                labelColor: kBlackColor,
                unselectedLabelColor: kWhiteColor,
                isScrollable: true,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                indicator: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: "🍿️ Comming Soon",
                  ),
                  Tab(
                    text: "👀️ Everyone's Watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildCommingSoon(context),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget _buildTabBarView(String name) {
    return Text(name);
  }

  Widget _buildCommingSoon(BuildContext context) {
    return FutureBuilder(
        future: MovieDB().getPopular(),
        builder:
            (BuildContext context, AsyncSnapshot<List<DataModel>> commingSoon) {
          if (commingSoon.data == null) {
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: commingSoon.data!.length,
              itemBuilder: (context, index) =>
                  CommingSoonWidget(commingSoon: commingSoon.data![index]),
              shrinkWrap: true,
            );
          }
        });
  }

  Widget _buildEveryonesWatching() {
    return FutureBuilder(
        future: MovieDB().getTVShow(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DataModel>> everyonesData) {
          if (everyonesData.data == null) {
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: everyonesData.data!.length,
              itemBuilder: (context, index) => EveryonesWatchingWidget(
                  everyData: everyonesData.data![index]),
            );
          }
        });
  }
}
