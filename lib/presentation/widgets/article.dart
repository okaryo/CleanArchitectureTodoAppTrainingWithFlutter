// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
    required this.child,
    this.maxWidth = 800,
  }) : super(key: key);

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
