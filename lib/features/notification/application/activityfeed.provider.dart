import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiCategoryProvider = Provider<APICategory>((ref) => Amplify.API);
