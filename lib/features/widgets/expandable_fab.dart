import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:todo_list/features/common/theme/colors.dart';

class FabController extends ValueNotifier<bool> {
  FabController() : super(false);
  void toggle() {
    value = !value;
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    required this.distance,
    required this.children,
    required this.fabController,
  });

  final double distance;
  final List<Widget> children;
  final FabController fabController;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: widget.fabController.value ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
    widget.fabController.addListener(() {
      if (widget.fabController.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: widget.fabController.toggle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 60.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return ValueListenableBuilder(
        valueListenable: widget.fabController,
        builder: (context, isExpanded, _) {
          return IgnorePointer(
            ignoring: isExpanded,
            child: AnimatedContainer(
              transformAlignment: Alignment.center,
              transform: Matrix4.diagonal3Values(
                isExpanded ? 0.7 : 1.0,
                isExpanded ? 0.7 : 1.0,
                1.0,
              ),
              duration: const Duration(milliseconds: 250),
              curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
              child: AnimatedOpacity(
                opacity: isExpanded ? 0.0 : 1.0,
                curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
                duration: const Duration(milliseconds: 250),
                child: FloatingActionButton(
                  onPressed: widget.fabController.toggle,
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          );
        });
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: ColorPalettes.pink[200],
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: ColorPalettes.neutral[900],
      ),
    );
  }
}
