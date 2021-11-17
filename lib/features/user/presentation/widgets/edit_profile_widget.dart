import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';

///
class EditProfileWidget extends HookWidget {
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
          child: Text(
            AppLocalizations.of(context)!.changePhotoLabel,
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
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.firstNameLabel,
                  ),
                  initialValue: userProfile.firstName,
                  validator:
                      FormBuilderValidators.compose(<String? Function(String?)>[
                    FormBuilderValidators.minLength(
                      context,
                      3,
                      errorText:
                          AppLocalizations.of(context)!.validationNameMinLength,
                    ),
                    FormBuilderValidators.maxLength(
                      context,
                      15,
                      errorText:
                          AppLocalizations.of(context)!.validationNameMaxLength,
                    )
                  ]),
                ),
                FormBuilderTextField(
                  name: 'lastName',
                  initialValue: userProfile.lastName,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.lastNameLabel,
                  ),
                  validator:
                      FormBuilderValidators.compose(<String? Function(String?)>[
                    FormBuilderValidators.minLength(
                      context,
                      3,
                      errorText:
                          AppLocalizations.of(context)!.validationNameMinLength,
                    ),
                    FormBuilderValidators.maxLength(
                      context,
                      15,
                      errorText:
                          AppLocalizations.of(context)!.validationNameMaxLength,
                    )
                  ]),
                ),
                FormBuilderTextField(
                  name: 'phoneNumber',
                  inputFormatters: <TextInputFormatter>[_phoneMaskFormatter],
                  initialValue: userProfile.phoneNumber,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.phoneNumberLabel,
                  ),
                  validator:
                      FormBuilderValidators.compose(<String? Function(String?)>[
                    FormBuilderValidators.minLength(
                      context,
                      18,
                      errorText: AppLocalizations.of(context)!
                          .validationPhoneNumberWrongFormat,
                    ),
                    FormBuilderValidators.maxLength(
                      context,
                      22,
                      errorText: AppLocalizations.of(context)!
                          .validationPhoneNumberWrongFormat,
                    ),
                    FormBuilderValidators.match(
                      context,
                      r"^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$",
                      errorText: AppLocalizations.of(context)!
                          .validationPhoneNumberWrongFormat,
                    ),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'bio',
                  initialValue: userProfile.bio,
                  maxLines: 5,
                  validator:
                      FormBuilderValidators.compose(<String? Function(String?)>[
                    FormBuilderValidators.minLength(
                      context,
                      125,
                      errorText:
                          AppLocalizations.of(context)!.validationBioMinLength,
                    ),
                    FormBuilderValidators.maxLength(
                      context,
                      350,
                      errorText:
                          AppLocalizations.of(context)!.validationBioMaxLength,
                    )
                  ]),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.bioLabel,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
