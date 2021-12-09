import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:group_button/group_button.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/themes.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/presentation/widgets/debounce_text_form_field.dart';

///
typedef SingleStringCallback = Function(String);

///
class QuestionWidget extends StatelessWidget {
  ///

  const QuestionWidget({
    required this.surveyID,
    required this.question,
    this.onSelected,
    this.onRemove,
    this.userAnswer,
  });

  ///
  final String surveyID;

  ///
  final Question question;

  ///
  final UserSurveyAnswer? userAnswer;

  ///
  final SingleStringCallback? onSelected;

  ///
  final VoidCallback? onRemove;

  GroupButton _themedGroupButton({
    required List<String> buttons,
    required Function(int index, bool isSelected) onSelected,
    int? selectedButton,
    List<int>? selectedButtons,
    bool isRadio = true,
    double? buttonWidth,
  }) =>
      GroupButton(
        buttons: buttons,
        onSelected: onSelected,
        selectedButton: selectedButton,
        selectedButtons: selectedButtons,
        isRadio: isRadio,
        spacing: 10,
        direction: Axis.vertical,
        selectedColor: primary,
        borderRadius: BorderRadius.circular(30.0),
        unselectedBorderColor: primary,
        unselectedTextStyle: const TextStyle(color: primary, fontSize: 16),
        unselectedShadow: const <BoxShadow>[],
        selectedTextStyle: const TextStyle(fontSize: 16),
        buttonWidth: buttonWidth,
        textPadding: const EdgeInsets.only(
          left: 20.0,
          top: 5.0,
          right: 20.0,
          bottom: 20.0,
        ),
      );

  Widget _renderInput({
    required Question question,
    required BuildContext context,
  }) {
    final double buttonWidth = MediaQuery.of(context).size.width - 120;
    Widget answerWidget;
    switch (question.type) {
      case QuestionType.OPEN_SHORT:
        answerWidget = DebounceTextFormField(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          onAnswer: (String answer) {
            if (answer.isNotEmpty) {
              onSelected!(answer);
            }
          },
          validator: FormBuilderValidators.compose(<String? Function(String?)>[
            FormBuilderValidators.required(
              context,
              errorText: AppLocalizations.of(context)!.validationAnswerRequired,
            ),
            FormBuilderValidators.minLength(
              context,
              15,
              errorText:
                  AppLocalizations.of(context)!.validationAnswerMinLength,
            ),
            FormBuilderValidators.maxLength(
              context,
              50,
              errorText:
                  AppLocalizations.of(context)!.validationAnswerMaxLength,
            ),
          ]),
          initialText: userAnswer?.answer,
          hintText: "Cevabı buraya yazınız...",
        );
        break;
      case QuestionType.OPEN_LONG:
        answerWidget = DebounceTextFormField(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          onAnswer: (String answer) {
            if (answer.isNotEmpty) {
              onSelected!(answer);
            }
          },
          validator: FormBuilderValidators.compose(<String? Function(String?)>[
            FormBuilderValidators.required(
              context,
              errorText: AppLocalizations.of(context)!.validationAnswerRequired,
            ),
            FormBuilderValidators.minLength(
              context,
              50,
              errorText:
                  AppLocalizations.of(context)!.validationAnswerMinLength,
            ),
            FormBuilderValidators.maxLength(
              context,
              500,
              errorText:
                  AppLocalizations.of(context)!.validationAnswerMaxLength,
            ),
          ]),
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          maxLength: 500,
          initialText: userAnswer?.answer,
        );
        break;
      case QuestionType.SINGLE:
        final List<String> buttons = question.answer!.split(",");
        final String selectedButton = userAnswer?.answer ?? '';

        answerWidget = _themedGroupButton(
          buttons: buttons,
          onSelected: (int index, bool isSelected) =>
              onSelected!(buttons[index]),
          selectedButton:
              selectedButton != '' ? buttons.indexOf(selectedButton) : null,
          buttonWidth: buttonWidth,
        );
        break;
      case QuestionType.MULTIPLE:
        final List<String> buttons = question.answer!.split(",");
        final String selectedButtons = userAnswer?.answer ?? '';

        answerWidget = _themedGroupButton(
          isRadio: false,
          buttons: buttons,
          onSelected: (int index, bool isSelected) {
            final String rawCurrentAnswer = userAnswer?.answer ?? '';
            final List<String> currentAnswer = rawCurrentAnswer != ''
                ? rawCurrentAnswer.split(",")
                : <String>[];
            if (isSelected) {
              currentAnswer.add(buttons[index]);
            } else {
              currentAnswer.remove(buttons[index]);
            }
            if (currentAnswer.isNotEmpty) {
              onSelected!(currentAnswer.join(","));
            } else {
              if (onRemove != null) {
                onRemove?.call();
              }
            }
          },
          selectedButtons: selectedButtons != ''
              ? selectedButtons
                  .split(",")
                  .map((String value) => buttons.indexOf(value))
                  .toList()
              : null,
          buttonWidth: buttonWidth,
        );
        break;
      case QuestionType.BOOL:
        final List<String> buttons = <String>[
          AppLocalizations.of(context)!.incorrect,
          AppLocalizations.of(context)!.correct
        ];
        final String selectedButton = userAnswer?.answer ?? '';

        answerWidget = _themedGroupButton(
          buttons: buttons,
          selectedButton:
              selectedButton != '' ? buttons.indexOf(selectedButton) : null,
          onSelected: (int index, bool isSelected) =>
              onSelected!(buttons[index]),
          buttonWidth: buttonWidth,
        );
        break;
    }
    return answerWidget;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 8.0),
          child: Text(
            question.statement,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: _renderInput(question: question, context: context),
        ),
      ],
    );
  }
}
