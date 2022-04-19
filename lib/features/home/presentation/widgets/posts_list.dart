import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/features/content/application/post.provider.dart';
import 'package:thesis_cancer/features/content/application/post.state.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/content/presentation/widgets/post_widget.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

///
class PostsList extends HookConsumerWidget {
  ///
  PostsList({required this.type});

  ///
  final PostType type;

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PostsState screenNotifier = ref.watch(postsNotifierProvider(type));
    final List<Post> postList = ref.watch(postListProvider(type));
    final FirebaseAnalytics _analytics = ref.watch(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Post List ${type.toString()}",
      );
      await _analytics.logViewItem(
        items: <AnalyticsEventItem>[
          AnalyticsEventItem(itemCategory: type.toString())
        ],
      );
    }

    Future<void> _refreshProvider() async {
      try {
        context.refresh(postsNotifierProvider(type).notifier);
        _refreshController.refreshCompleted();
      } on Exception {
        _refreshController.refreshFailed();
      }
    }

    useEffect(
      () {
        _setScreenAnalytics();

        return null;
      },
      const <Object>[],
    );

    return screenNotifier.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (Failure? error) => ErrorScreen(
        onPressed: _refreshProvider,
        reason: error?.reason,
        actionLabel: context.l10n!.tryAgain,
      ),
      data: () => SmartRefresher(
        /*
        enablePullUp: true,
        TODO:
         1. It is not working well right now with Flutter >= 2.5.0.
         2. It is useful when using pagination, what we don't have now.
        */
        header: const WaterDropMaterialHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text(context.l10n!.pullUpLoad);
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text(context.l10n!.loadFile);
            } else if (mode == LoadStatus.canLoading) {
              body = Text(context.l10n!.releaseToLoadMore);
            } else {
              body = Text(context.l10n!.noMoreData);
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _refreshProvider,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: postList.length,
          itemBuilder: (_, int index) => PostWidget(post: postList[index]),
        ),
      ),
    );
  }
}
