import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  var image;

  VideoWidget({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 22,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.volume_off,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
