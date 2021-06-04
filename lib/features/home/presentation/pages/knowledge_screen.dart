import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/features/content/application/post.provider.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';

class KnowledgeScreen extends HookWidget {
  KnowledgeScreen({Key? key}) : super(key: key);

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    final screenNotifier =
        useProvider(postsNotifierProvider(ContentType.INFORMATION));
    final List<Post> postList =
        useProvider(postListProvider(ContentType.INFORMATION)).state;
    return screenNotifier.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error) => ErrorScreen(
        // TODO: Refresh
        onPressed: () => null,
        message: error.toString(),
        title: 'Postları Hata',
        actionLabel: 'Try again!',
      ),
      data: () => SmartRefresher(
        enablePullUp: true,
        header: const WaterDropMaterialHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("release to load more");
            } else {
              body = const Text("No more Data");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: postList.length,
          itemBuilder: (_, int index) => SizedBox(
            height: 50,
            child: Center(child: Text('Entry ${postList[index]}')),
          ),
        ),
      ),
    );
  }
}
