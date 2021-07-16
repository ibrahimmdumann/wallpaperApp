import 'package:flutter/material.dart';
import 'package:wallpaper/pages/home/widgets/animation-fab/options.dart';

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: FabOptions().actionColor,
      elevation: FabOptions().actionElevation,
      child: IconTheme.merge(
        data: theme.accentIconTheme,
        child: SizedBox(
          height: FabOptions().actionSize,
          width: FabOptions().actionSize,
          child: IconButton(
            onPressed: onPressed,
            icon: icon,
            color: FabOptions().actionIconColor,
          ),
        ),
      ),
    );
  }
}
