import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';

///
class EditProfileWidget extends HookWidget {
  ///
  const EditProfileWidget({
    Key? key,
    required this.formKey,
    required this.onEditPhoto,
  }) : super(key: key);

  ///
  final GlobalKey<FormBuilderState> formKey;

  ///
  final VoidCallback onEditPhoto;

  @override
  Widget build(BuildContext context) {
    final Profile userProfile =
        useProvider(userEntityProvider).state.profile ?? Profile.empty;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: UserAvatar(
            userAvatarUrl: userProfile.profilePhoto?.url,
            radius: 50.0,
          ),
        ),
        TextButton(
          onPressed: onEditPhoto,
          child: const Text(
            "Change Photo",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  name: 'firstName',
                  decoration: const InputDecoration(labelText: 'First Name'),
                  initialValue: userProfile.firstName,
                  validator:
                      FormBuilderValidators.compose(<String? Function(String?)>[
                    FormBuilderValidators.minLength(
                      context,
                      3,
                      errorText:
                          "First name must have at least three characters",
                    ),
                    FormBuilderValidators.maxLength(
                      context,
                      15,
                      errorText:
                          "First name must have at most fifteen characters",
                    )
                  ]),
                ),
                FormBuilderTextField(
                  name: 'lastName',
                  initialValue: userProfile.lastName,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator:
                      FormBuilderValidators.compose(<String? Function(String?)>[
                    FormBuilderValidators.minLength(
                      context,
                      3,
                      errorText:
                          "First name must have at least three characters",
                    ),
                    FormBuilderValidators.maxLength(
                      context,
                      15,
                      errorText:
                          "First name must have at most fifteen characters",
                    )
                  ]),
                ),
                FormBuilderTextField(
                  name: 'phoneNumber',
                  initialValue: userProfile.phoneNumber,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator:
                      FormBuilderValidators.compose(<String? Function(String?)>[
                    FormBuilderValidators.minLength(
                      context,
                      12,
                      errorText: "Phone number format invalid.",
                    ),
                    FormBuilderValidators.maxLength(
                      context,
                      16,
                      errorText: "Phone number format invalid.",
                    ),
                    FormBuilderValidators.match(context, r"\+\d{12}$"),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'bio',
                  initialValue: userProfile.bio,
                  maxLines: 5,
                  decoration: const InputDecoration(labelText: 'About me'),
                  validator:
                      FormBuilderValidators.compose(<String? Function(String?)>[
                    FormBuilderValidators.minLength(
                      context,
                      125,
                      errorText: "Your description is too short.",
                    ),
                    FormBuilderValidators.maxLength(
                      context,
                      350,
                      errorText: "Your description is too long.",
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
