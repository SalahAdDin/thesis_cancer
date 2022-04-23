import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

///
class EditProfileWidget extends HookConsumerWidget {
  ///
  EditProfileWidget({
    Key? key,
    required this.formKey,
    required this.onEditPhoto,
  }) : super(key: key);

  ///
  final GlobalKey<FormBuilderState> formKey;

  ///
  final VoidCallback onEditPhoto;

  final MaskTextInputFormatter _phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+## (###) ### ## ##',
    filter: <String, RegExp>{"#": RegExp('[0-9]')},
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Profile userProfile =
        ref.watch(userEntityProvider).profile ?? Profile.empty;

    return SingleChildScrollView(
      child: Column(
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
            child: Text(
              context.l10n!.changePhotoLabel,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: context.l10n!.firstNameLabel,
                    ),
                    initialValue: userProfile.firstName,
                    validator: FormBuilderValidators
                        .compose(<String? Function(String?)>[
                      FormBuilderValidators.minLength(
                        3,
                        errorText: context.l10n!.validationNameMinLength,
                      ),
                      FormBuilderValidators.maxLength(
                        15,
                        errorText: context.l10n!.validationNameMaxLength,
                      )
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'lastName',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: userProfile.lastName,
                    decoration: InputDecoration(
                      labelText: context.l10n!.lastNameLabel,
                    ),
                    validator: FormBuilderValidators
                        .compose(<String? Function(String?)>[
                      FormBuilderValidators.minLength(
                        3,
                        errorText: context.l10n!.validationNameMinLength,
                      ),
                      FormBuilderValidators.maxLength(
                        15,
                        errorText: context.l10n!.validationNameMaxLength,
                      )
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'phoneNumber',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: <TextInputFormatter>[_phoneMaskFormatter],
                    initialValue: userProfile.phoneNumber,
                    decoration: InputDecoration(
                      labelText: context.l10n!.phoneNumberLabel,
                    ),
                    validator: FormBuilderValidators
                        .compose(<String? Function(String?)>[
                      FormBuilderValidators.minLength(
                        18,
                        allowEmpty: true,
                        errorText:
                            context.l10n!.validationPhoneNumberWrongFormat,
                      ),
                      FormBuilderValidators.maxLength(
                        22,
                        errorText:
                            context.l10n!.validationPhoneNumberWrongFormat,
                      ),
                      FormBuilderValidators.match(
                        r"^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$",
                        errorText:
                            context.l10n!.validationPhoneNumberWrongFormat,
                      ),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'bio',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: userProfile.bio,
                    maxLines: 5,
                    validator: FormBuilderValidators
                        .compose(<String? Function(String?)>[
                      FormBuilderValidators.minLength(
                        125,
                        allowEmpty: true,
                        errorText: context.l10n!.validationBioMinLength,
                      ),
                      FormBuilderValidators.maxLength(
                        350,
                        errorText: context.l10n!.validationBioMaxLength,
                      )
                    ]),
                    decoration: InputDecoration(
                      labelText: context.l10n!.bioLabel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
