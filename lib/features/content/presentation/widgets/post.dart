import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // PostHeader(),
        GestureDetector(
          // TODO: do like on post
          onDoubleTap: () => null,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: post.gallery[0].url,
                fit: BoxFit.fitWidth,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  height: 400.0,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              LikeButton(),
            ],
          ),
        )
      ],
    );
  }
}
