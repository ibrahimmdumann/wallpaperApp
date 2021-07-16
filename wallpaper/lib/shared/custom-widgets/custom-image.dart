import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  String? url;
  CustomImage({this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FadeInImage(
          image: NetworkImage("$url"),
          placeholder: AssetImage("assets/images/loading.gif"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}