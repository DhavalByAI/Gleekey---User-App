import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../utils/style/constants.dart';

CachedNetworkImage cNetworkImage(String? link,
    {double? height, double? width, BoxFit? fit, Alignment? alignment}) {
  return CachedNetworkImage(
    height: height,
    width: width,
    fit: fit,
    alignment: alignment ?? Alignment.center,
    imageUrl: link ?? "",
    placeholder: (context, url) => const CupertinoActivityIndicator(
      color: kOrange,
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
