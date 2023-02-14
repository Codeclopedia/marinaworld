import '/core/ui_core.dart';

class TopImageScreen extends StatelessWidget {
  final String imageName;
  final Widget body;
  final Widget? headerBody;
  final double? paddingTop;
  final Function? onBack;

  const TopImageScreen({
    Key? key,
    required this.imageName,
    required this.body,
    this.onBack,
    this.headerBody,
    this.paddingTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: paddingTop ?? 33.86.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$imageName'),
                fit: BoxFit.cover),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: (paddingTop ?? 33.86.h) * 0.9,
              child: headerBody ?? const SizedBox.shrink(),
            ),
            Expanded(
              child: Container(
                width: 100.w,
                padding: EdgeInsets.only(top: 2.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(-5, 5),
                        color: Colors.black.withAlpha(0x0D)),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.w),
                    topRight: Radius.circular(5.w),
                  ),
                ),
                child: body,
              ),
            ),
          ],
        ),
        Positioned(
            top: 1.w,
            left: 1.w,
            child: onBack != null
                ? SafeArea(
                    bottom: false,
                    child: IconButton(
                      onPressed: () => onBack!(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox.shrink()),
      ],
    );
  }
}
