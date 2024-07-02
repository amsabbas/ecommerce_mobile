import 'package:flutter/material.dart';

class EmptyAppBar extends AppBar implements PreferredSizeWidget {
  EmptyAppBar({super.key})
      : super(
          elevation: 0.0,
        );

  @override
  Size get preferredSize => const Size(0.0, 0.0);

  @override
  double? get scrolledUnderElevation => 0;
}
