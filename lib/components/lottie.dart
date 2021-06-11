import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LottieComponent extends StatelessWidget {
  final String path;

  LottieComponent({required this.path});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          path,
          repeat: true,
          reverse: false,
          animate: true,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
