import 'package:skeleton_text/skeleton_text.dart';

import '../../core/ui_core.dart';

class LoadingCard extends StatelessWidget {
  final double? height;
  final Color? color;
  const LoadingCard({Key? key, required this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SkeletonAnimation(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(5)),
          height: height,
          width: double.infinity,
        ),
      ),
    );
  }
}
