import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullScreenFla extends StatefulWidget {
  bool isFavorite;
  FullScreenFla({required this.isFavorite});

  @override
  _FullScreenFlaState createState() => _FullScreenFlaState();
}

class _FullScreenFlaState extends State<FullScreenFla>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _animateColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animateColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget toggle() {
    return FloatingActionButton(
      backgroundColor: _animateColor.value,
      onPressed: animate,
      tooltip: 'Toggle',
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
    );
  }

  Widget more() {
    return new Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'More',
        child: Icon(Icons.more_horiz),
      ),
    );
  }

  Widget setMenu() {
    return new Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'SetMenu',
        child: Icon(Icons.add_to_home_screen),
      ),
    );
  }

  Widget favorite() {
    return new Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Favorite',
        child:
            Icon(widget.isFavorite ? Icons.favorite : Icons.favorite_outlined),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: more(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: setMenu(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: favorite(),
        ),
        toggle(),
      ],
    );
  }
}
