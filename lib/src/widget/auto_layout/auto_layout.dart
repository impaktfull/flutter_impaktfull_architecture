import 'package:flutter/material.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

enum AutoLayoutOrientation {
  horizontal,
  vertical,
}

class AutoLayout extends StatelessWidget {
  final AutoLayoutOrientation orientation;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;
  final EdgeInsets padding;
  final int spacing;
  final Color backgroundColor;

  const AutoLayout({
    required this.children,
    required this.orientation,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  const AutoLayout.horizontal({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.backgroundColor = Colors.transparent,
    super.key,
  }) : orientation = AutoLayoutOrientation.horizontal;

  const AutoLayout.vertical({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.backgroundColor = Colors.transparent,
    super.key,
  }) : orientation = AutoLayoutOrientation.vertical;

  @override
  Widget build(BuildContext context) {
    final childerenWithSpacing = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      childerenWithSpacing.add(children[i]);
      if (i < children.length - 1) {
        childerenWithSpacing.add(Gap(spacing.toDouble()));
      }
    }

    final Widget child;
    if (orientation == AutoLayoutOrientation.horizontal) {
      child = Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: childerenWithSpacing,
      );
    } else {
      child = Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: childerenWithSpacing,
      );
    }
    return Container(
      padding: padding,
      color: backgroundColor,
      child: child,
    );
  }
}
