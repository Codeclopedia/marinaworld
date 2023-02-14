import 'package:cached_network_image/cached_network_image.dart';
import '/core/ui_core.dart';
import 'loading_indicator_widget.dart';

const String imageBaseUrl = 'https://www.marinaworld.com.kw/';

Widget get buildLoading => const Center(
      child: LoadingIndicatorWidget(),
    );

Widget buildEmptyLoading(String message) => Center(
      child: Text(message),
    );

ImageProvider getImageProvider(String url) {
  if (url.startsWith('http')) {
    return CachedNetworkImageProvider(url);
  } else if (url.startsWith('assets')) {
    return AssetImage(url);
  } else {
    // print('$url');
    return CachedNetworkImageProvider('$imageBaseUrl$url');
    // return FileImage(
    //   File(url),
    // );
  }
}


ImageProvider getFallbackImageProvider(String url) {
  if (url.startsWith('http')) {
    return CachedNetworkImageProvider(url);
  } else if (url.startsWith('assets')) {
    return AssetImage(url);
  } else {
    // print('$url');
    return CachedNetworkImageProvider('$imageBaseUrl$url');
    // return FileImage(
    //   File(url),
    // );
  }
}
