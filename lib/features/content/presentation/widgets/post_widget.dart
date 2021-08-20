import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/cached_network_video.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/content/presentation/widgets/post_header.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';

/// Post Widget
class PostWidget extends StatelessWidget {
  ///
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  ///
  final Post post;

  Widget _deliverContent(UploadFile content) {
    final String contentType = content.mime.split("/")[0];
    final FileType? fileType =
        EnumToString.fromString(FileType.values, contentType);

    switch (fileType) {
      case FileType.image:
        return CachedNetworkImage(
          imageUrl: content.url,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (BuildContext context, String url,
                  DownloadProgress downloadProgress) =>
              Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          ),
          errorWidget: (BuildContext context, String url, _) =>
              const Icon(Icons.error),
        );
      case FileType.video:
        return CachedNetworkVideo(
          dataSource: content.url,
          enableControls: true,
        );
      case FileType.file:
        return const Center(
          child: Icon(
            Icons.description_outlined,
          ),
        );
      case null:
        return const Center(
          child: Icon(Icons.error),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double swiperWidth = MediaQuery.of(context).size.width - 60;
    final double swiperHeight = swiperWidth * 3 / 4;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PostHeader(
            author: post.author!,
          ),
          GestureDetector(
            // TODO: do like on post
            // onDoubleTap: () => null,
            child: SizedBox(
              height: swiperHeight,
              child: Swiper(
                itemCount: post.gallery.length,
                itemHeight: swiperHeight,
                itemWidth: swiperWidth,
                pagination: const SwiperPagination(),
                indicatorLayout: PageIndicatorLayout.SCALE,
                itemBuilder: (_, int index) =>
                    _deliverContent(post.gallery[index]),
              ),
            ),
          ),
          /*
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
          */
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: ReadMoreText(
              post.description,
              trimMode: TrimMode.Line,
              delimiter: ' ',
              trimCollapsedText: '...more',
              trimExpandedText: 'less',
              moreStyle: const TextStyle(
                fontWeight: FontWeight.w900,
              ),
              lessStyle: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.pink,
              ),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
