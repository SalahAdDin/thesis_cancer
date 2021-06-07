import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:readmore/readmore.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final double swiperWidth = MediaQuery.of(context).size.width - 60;
    final double swiperHeight = swiperWidth * 3 / 4;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // PostHeader(),
          GestureDetector(
              // TODO: do like on post
              onDoubleTap: () => null,
              child: SizedBox(
                  height: swiperHeight,
                  child: Swiper(
                    itemCount: post.gallery.length,
                    itemHeight: swiperHeight,
                    itemWidth: swiperWidth,
                    pagination: const SwiperPagination(),
                    indicatorLayout: PageIndicatorLayout.SCALE,
                    /*pagination: SwiperPagination(
                    builder: SwiperCustomPagination(
                      builder:
                          (BuildContext context, SwiperPluginConfig? config) =>
                              const DotSwiperPaginationBuilder(
                        color: Colors.black12,
                        activeColor: Colors.black,
                      ).build(context, config),
                    ),
                  ),*/
                    itemBuilder: (_, int index) => CachedNetworkImage(
                      imageUrl: post.gallery[index].url,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => SizedBox(
                        height: 400.0,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ))
              /*CarouselSlider(
            items: post.gallery
                .map(
                  (element) => CachedNetworkImage(
                    imageUrl: element.url,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => SizedBox(
                      height: 400.0,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )
                .toList(),
            options: CarouselOptions(height: swiperHeight, aspectRatio: 4 / 3),
          ),*/
              ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const LikeButton(),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.maps_ugc_rounded,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Transform.rotate(
                      angle: -45 * pi / 180,
                      child: const Icon(
                        Icons.send_rounded,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.bookmark_border_rounded,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ReadMoreText(
              post.description,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...more',
              trimExpandedText: '...less',
              moreStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
