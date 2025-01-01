import 'dart:ui';

import 'package:awesome_push/imports.dart';

class BlurryEffect extends StatelessWidget {
  const BlurryEffect({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: child,
      ),
    );
  }
}
