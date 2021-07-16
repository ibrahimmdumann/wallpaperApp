import 'package:flutter/material.dart';
import 'package:wallpaper/pages/home/widgets/animation-fab/expanding-action-button.dart';
import 'package:wallpaper/pages/home/widgets/animation-fab/options.dart';

@immutable
class FabWidget extends StatefulWidget {
  const FabWidget({
    Key? key,
    this.initialOpen,
    this.distance,
    this.children,
  }) : super(key: key);

  final bool? initialOpen;
  final double? distance;
  final List<Widget>? children;

  @override
  _FabWidgetState createState() => _FabWidgetState();
}

class _FabWidgetState extends State<FabWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _open ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent.withOpacity(0.6),
          ) : Container(),
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 10),
      child: SizedBox(
        width: FabOptions().closeFabSize,
        height: FabOptions().closeFabSize,
        child: Center(
          child: Material(
            color: FabOptions().closeFabColor,
            shape: CircleBorder(),
            clipBehavior: Clip.antiAlias,
            elevation: FabOptions().closeFabElevation,
            child: InkWell(
              onTap: toggle,
              child: Icon(
                Icons.close,
                size: FabOptions().closeFabIconSize,
                color: FabOptions().closeFabIconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children!.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance!,
          progress: _expandAnimation,
          child: widget.children![i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 10),
      child: IgnorePointer(
        ignoring: _open,
        child: AnimatedContainer(
          transformAlignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            _open ? 0.7 : 1.0,
            _open ? 0.7 : 1.0,
            1.0,
          ),
          duration: const Duration(milliseconds: 250),
          curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
          child: AnimatedOpacity(
            opacity: _open ? 0.0 : 1.0,
            curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
            duration: const Duration(milliseconds: 250),
            child: SizedBox(
              height: FabOptions().openFabSize,
              width: FabOptions().openFabSize,
              child: FloatingActionButton(
                backgroundColor: FabOptions().openFabColor,
                onPressed: toggle,
                child: Icon(Icons.menu, size: FabOptions().openFabIconSize, color: FabOptions().openFabIconColor,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}