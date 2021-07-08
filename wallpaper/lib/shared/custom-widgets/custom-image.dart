import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  String? url;
  String? tag;
  CustomImage({this.url, this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network("$url", fit: BoxFit.cover),
      ),
    );
  }
}