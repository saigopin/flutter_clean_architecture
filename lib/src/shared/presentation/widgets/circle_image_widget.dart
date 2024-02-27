import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImageWidget extends StatefulWidget {
  final bool isLocal;
  final String leadingImage;
  final IconData? icon;
  final double radius;

  const CircleImageWidget({
    super.key,
    required this.leadingImage,
    this.icon,
    this.isLocal = false,
    this.radius = 0.07,
  });

  @override
  State<CircleImageWidget> createState() => _CircleImageWidgetState();
}

class _CircleImageWidgetState extends State<CircleImageWidget> {
  ImageProvider? image;

  @override
  void initState() {
    super.initState();
    if (widget.isLocal) {
      image = AssetImage(widget.leadingImage);
    } else {
      image = CachedNetworkImageProvider(widget.leadingImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width * widget.radius,
      backgroundImage: image,
      child: widget.icon != null
          ? Icon(
              widget.icon,
              size: MediaQuery.of(context).size.width * 0.06,
            )
          : null,
    );
  }
}
