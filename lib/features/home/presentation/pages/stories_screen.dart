import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/home/presentation/widgets/posts_list.dart';

///
class StoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostsList(type: PostType.SUCCESS_STORIES);
  }
}
