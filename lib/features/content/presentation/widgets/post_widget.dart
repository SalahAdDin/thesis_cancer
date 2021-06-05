import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Column(
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
        // LikeButton(),
      ],
    );
  }
}
