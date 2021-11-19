import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

class PostsList extends HookWidget {
  PostsList({required this.type});

  ///
  final PostType type;

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    final PostsState screenNotifier = useProvider(postsNotifierProvider(type));
    final List<Post> postList = useProvider(postListProvider(type)).state;
    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Post List ${type.toString()}",
      );
      await _analytics.logViewItemList(itemCategory: type.toString());
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
        actionLabel: AppLocalizations.of(context)!.tryAgain,
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
              body = Text(AppLocalizations.of(context)!.pullUpLoad);
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text(AppLocalizations.of(context)!.loadFile);
            } else if (mode == LoadStatus.canLoading) {
              body = Text(AppLocalizations.of(context)!.releaseToLoadMore);
            } else {
              body = Text(AppLocalizations.of(context)!.noMoreData);
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
