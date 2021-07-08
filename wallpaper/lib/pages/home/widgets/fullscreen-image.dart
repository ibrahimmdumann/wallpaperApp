import 'dart:ui';

import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  String? url;
  String? thumb;
  String? tag;
  FullScreenImage({this.url, this.thumb, this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('$thumb'),
          fit: BoxFit.fill
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('$thumb'),
              fit: BoxFit.contain
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Image.network(
              '$url',
              loadingBuilder: (context, child, event){
                if(event == null){
                  return child;
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}