import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:colorize/colorize.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/audio_player.dart';
import 'package:thesis_cancer/core/presentation/widgets/cached_network_video.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/content/presentation/widgets/post_header.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:url_launcher/url_launcher.dart';

/// Post Widget
class PostWidget extends HookWidget {
  ///
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  ///
  final Post post;

  Future<void> _launchURL(String url) async =>
      await canLaunch(url) ? launch(url) : throw 'Could not launch $url';

  Widget _deliverContent(UploadFile content) {
    final String contentType = content.mime.split("/")[0];
    final FileType? fileType =
        EnumToString.fromString(FileType.values, contentType);

    print(Colorize(content.url).red());

    switch (fileType) {
      case FileType.image:
        return CachedNetworkImage(
          imageUrl: content.url,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (
            BuildContext context,
            String url,
            DownloadProgress downloadProgress,
          ) =>
              Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          ),
          errorWidget: (BuildContext context, String url, _) =>
              const Icon(Icons.error_outline),
        );
      case FileType.video:
        return CachedNetworkVideo(
          dataSource: content.url,
          enableControls: true,
        );
      case FileType.audio:
        return AudioPlayer(
          dataSource: content.url,
        );
      case FileType.file:
        return const Center(
          child: Icon(
            Icons.description_outlined,
          ),
        );
      case null:
        return const Center(
          child: Icon(Icons.error_outline),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double swiperWidth = MediaQuery.of(context).size.width - 60;
    final double swiperHeight = swiperWidth * 3 / 4;

    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setItemAnalytics() async {
      await _analytics.logViewItem(
        itemId: post.id ?? '',
        itemName: post.title ?? "${post.author!.username} - ${post.id}",
        itemCategory: post.type.toString(),
      );
    }

    useEffect(
      () {
        _setItemAnalytics();
      },
      const <Object>[],
    );

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
                pagination:
                    post.gallery.length > 1 ? const SwiperPagination() : null,
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
            child: MarkdownBody(
              data: post.description,
              selectable: true,
              onTapLink: (String text, String? href, String title) async {
                if (href != null) await _launchURL(href);
              },
            ),
          ),
        ],
      ),
    );
  }
}
