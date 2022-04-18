import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:group_button/group_button.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/themes.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/presentation/widgets/debounce_text_form_field.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

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
    GroupButtonController? controller,
    bool isRadio = true,
    double? buttonWidth,
  }) =>
      GroupButton(
        buttons: buttons,
        onSelected: onSelected,
        controller: controller,
        options: GroupButtonOptions(
          direction: Axis.vertical,
          selectedColor: primary,
          borderRadius: BorderRadius.circular(30.0),
          unselectedBorderColor: primary,
          unselectedTextStyle: const TextStyle(color: primary, fontSize: 16),
          unselectedShadow: const <BoxShadow>[],
          selectedTextStyle: const TextStyle(fontSize: 16),
          buttonWidth: buttonWidth,
          textPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
        ),
        isRadio: isRadio,
      );

  Widget _renderOpenQuestion({
    required BuildContext context,
    bool long = false,
  }) {
    final FormFieldValidator<String> shortAnswerValidator =
        FormBuilderValidators.compose(<String? Function(String?)>[
      FormBuilderValidators.required(
        errorText: context.l10n!.validationAnswerRequired,
      ),
      FormBuilderValidators.minLength(
        15,
        errorText: context.l10n!.validationAnswerMinLength,
      ),
      FormBuilderValidators.maxLength(
        50,
        errorText: context.l10n!.validationAnswerMaxLength,
      ),
    ]);

    final FormFieldValidator<String> longAnswerValidator =
        FormBuilderValidators.compose(<String? Function(String?)>[
      FormBuilderValidators.required(
        errorText: context.l10n!.validationAnswerRequired,
      ),
      FormBuilderValidators.minLength(
        50,
        errorText: context.l10n!.validationAnswerMinLength,
      ),
      FormBuilderValidators.maxLength(
        500,
        errorText: context.l10n!.validationAnswerMaxLength,
      ),
    ]);

    return DebounceTextFormField(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      onAnswer: (String answer) => onSelected!(answer),
      validator: long ? longAnswerValidator : shortAnswerValidator,
      keyboardType: long ? TextInputType.multiline : null,
      maxLines: long ? 8 : null,
      maxLength: long ? 500 : 50,
      initialText: userAnswer?.answer,
    );
  }

  Widget _renderInput({
    required Question question,
    required BuildContext context,
  }) {
    final double buttonWidth = MediaQuery.of(context).size.width - 120;

    Widget answerWidget;

    switch (question.type) {
      case QuestionType.OPEN_SHORT:
        answerWidget = _renderOpenQuestion(context: context);
        break;
      case QuestionType.OPEN_LONG:
        answerWidget = _renderOpenQuestion(context: context, long: true);
        break;
      case QuestionType.BOOL:
        final List<String> buttons = <String>[
          context.l10n!.incorrect,
          context.l10n!.correct
        ];
        final String rawAnswer = userAnswer?.answer ?? '';
        final int? selectedButton =
            rawAnswer != '' ? buttons.indexOf(rawAnswer) : null;

        answerWidget = _themedGroupButton(
          buttons: buttons,
          controller: GroupButtonController(
            selectedIndex: selectedButton,
          ),
          onSelected: (int index, bool isSelected) =>
              onSelected!(buttons[index]),
          buttonWidth: buttonWidth,
        );
        break;
      case QuestionType.SINGLE:
        final List<String> buttons = question.answer!.split(",");
        final String rawAnswer = userAnswer?.answer ?? '';
        final int? selectedButton =
            rawAnswer != '' ? buttons.indexOf(rawAnswer) : null;

        answerWidget = _themedGroupButton(
          buttons: buttons.map((String label) => label.trim()).toList(),
          onSelected: (int index, bool isSelected) =>
              onSelected!(buttons[index]),
          controller: GroupButtonController(
            selectedIndex: selectedButton,
          ),
          buttonWidth: buttonWidth,
        );
        break;
      case QuestionType.MULTIPLE:
        final List<String> buttons = question.answer!.split(",");
        final String rawAnswer = userAnswer?.answer ?? '';
        final List<int> selectedButtons = rawAnswer
            .split(",")
            .map((String value) => buttons.indexOf(value))
            .toList();

        answerWidget = _themedGroupButton(
          isRadio: false,
          buttons: buttons.map((String label) => label.trim()).toList(),
          onSelected: (int index, bool isSelected) {
            final String rawAnswer = userAnswer?.answer ?? '';
            final List<String> currentAnswer = rawAnswer.split(",");

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
          controller: GroupButtonController(
            selectedIndexes: selectedButtons,
          ),
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
