import 'package:flutter/material.dart';
import 'package:wallpaper/shared/custom-widgets/custom-text.dart';

class CustomSlideTransition extends StatefulWidget {
  String? text;
  int duration;
  CustomSlideTransition({ this.text, required this.duration });

  @override
  _CustomSlideTransitionState createState() => _CustomSlideTransitionState();
}

class _CustomSlideTransitionState extends State<CustomSlideTransition> with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    _offsetAnimation = Tween<Offset>(begin: Offset(-1.0,0.0), end: Offset(0.0, 0.0)).animate(
      CurvedAnimation(
        parent: _controller, curve: Curves.elasticInOut
      )
    );
    _controller.forward().orCancel;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          alignment: Alignment.center,
          child: CustomText(text: '${widget.text}', color: Colors.white, fontSize: 30,),
        ),
      ),
    );
  }
}