import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWidget(appBarTitle: "New & Hot"),
      ),
      body: SafeArea(
        child: Center(
          child: Text("Screen New And Hot"),
        ),
      ),
    );
  }
}
