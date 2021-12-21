import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../ui/widgets/loading_widget.dart';
import '../../ui/widgets/space_logo.dart';

class LaunchImage extends StatelessWidget {
  final String id;
  final String imageUrl;
  final double size;
  const LaunchImage({Key key, this.imageUrl, this.id, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: imageUrl == null
          ? SpaceLogo()
          : CachedNetworkImage(
              imageUrl: imageUrl,
              width: size,
              height: size,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => LoadingIndicator(),
              errorWidget: (context, url, error) => SpaceLogo(size: size),
            ),
    );
  }
}
