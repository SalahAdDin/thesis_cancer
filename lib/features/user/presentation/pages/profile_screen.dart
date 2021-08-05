import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as fc_types;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/features/chat/presentation/pages/chat_page.dart';
import 'package:thesis_cancer/features/user/application/profile.notifier.dart';
import 'package:thesis_cancer/features/user/application/profile.state.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/presentation/widgets/edit_profile_widget.dart';
import 'package:thesis_cancer/features/user/presentation/widgets/profile_widget.dart';

///
class ProfileScreen extends HookWidget {
  ///
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  ///
  final User user;

  Future<void> _onSubmit({
    required GlobalKey<FormBuilderState> formKey,
    required Future<dynamic> Function(Map<String, dynamic>) onSubmitCallback,
  }) async {
    formKey.currentState!.save();
    final bool isValid = formKey.currentState!.validate();
    if (isValid) {
      final Map<String, dynamic> updatedFields = formKey.currentState!.value;
      onSubmitCallback(updatedFields);
    } else {
      // raise and error (snack bar way)
      // return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> _formKey =
        useMemoized(() => GlobalKey<FormBuilderState>());
    final AutoDisposeStateNotifierProvider<ProfileNotifier, ProfileState>
        profileProvider = profileNotifierProvider(user);
    final ProfileState profileState = useProvider(profileProvider);
    final ProfileNotifier profileNotifier =
        useProvider(profileProvider.notifier);
    final String sessionUserFullName =
        useProvider(userEntityProvider).state.profile?.fullName ?? '';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Header(
        pageTitle: user.username,
        additionalActions: <Widget>[
          Visibility(
            visible: user.profile!.fullName != '' &&
                sessionUserFullName != '' &&
                !profileNotifier.isOwnProfile &&
                user.profile!.role == UserRole.ADMIN,
            child: IconButton(
              onPressed: () async {
                final fc_types.Room room = await profileNotifier.createRoom();
                pushToPage(
                  context,
                  ChatPage(room: room),
                );
              },
              icon: const Icon(
                Icons.email_outlined,
              ),
            ),
          ),
          Visibility(
            visible: profileNotifier.isOwnProfile,
            child: profileState.when(
              loading: () => Container(),
              error: (String? error) => Container(),
              editing: () => IconButton(
                onPressed: () => _onSubmit(
                  formKey: _formKey,
                  onSubmitCallback: profileNotifier.updateProfile,
                ),
                icon: const Icon(
                  Icons.done_outlined,
                ),
              ),
              data: () => IconButton(
                onPressed: profileNotifier.toEditMode,
                icon: const Icon(
                  Icons.edit_outlined,
                ),
              ),
            ),
          ),
        ],
      ),
      body: profileState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (String? error) => ErrorScreen(
          onPressed: () => Navigator.of(context).maybePop(),
          message: error.toString(),
          title: 'Profili Hata',
          actionLabel: 'Try again!',
        ),
        editing: () => EditProfileWidget(
          formKey: _formKey,
          onEditPhoto: profileNotifier.updateProfilePhoto,
        ),
        data: () => ProfileWidget(
          userProfile: user.profile!,
          postsCount: profileNotifier.postsCount,
        ),
      ),
    );
  }
}