import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:group_button/group_button.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/presentation/widgets/debounce_text_form_field.dart';

///
typedef SingleStringCallback = Function(String);

///
class QuestionWidget extends StatelessWidget {
  ///
  QuestionWidget({
    required this.surveyID,
    this.question,
    this.onSelected,
    this.userAnswer,
  });

  ///
  final String surveyID;

  ///
  final Question? question;

  ///
  final UserSurveyAnswer? userAnswer;

  ///
  final SingleStringCallback? onSelected;

  final MultiValidator _shortAnswerValidator =
      MultiValidator(<FieldValidator<dynamic>>[
    RequiredValidator(errorText: 'Bu soruya cevap vermelisiniz.'),
    MinLengthValidator(15, errorText: 'Bu cevap çok kısa'),
    MaxLengthValidator(50, errorText: 'Bu cevap çok uzun.')
  ]);

  final MultiValidator _longAnswerValidator =
      MultiValidator(<FieldValidator<dynamic>>[
    RequiredValidator(errorText: 'Bu soruya cevap vermelisiniz.'),
    MinLengthValidator(50, errorText: 'Bu cevap çok kısa'),
    MaxLengthValidator(500, errorText: 'Bu cevap çok uzun.')
  ]);

  Widget _renderInput({required Question question}) {
    Widget answerWidget;
    switch (question.type) {
      case QuestionType.OPEN_SHORT:
        answerWidget = DebounceTextFormField(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          onAnswer: (String answer) => onSelected!(answer),
          validator: _shortAnswerValidator,
          initialText: userAnswer?.answer,
        );
        break;
      case QuestionType.OPEN_LONG:
        answerWidget = DebounceTextFormField(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            onAnswer: (String answer) => onSelected!(answer),
            validator: _longAnswerValidator,
            keyboardType: TextInputType.multiline,
            maxLines: 8,
            maxLength: 500,
            initialText: userAnswer?.answer);
        break;
      case QuestionType.SINGLE:
        final List<String> buttons = question.answer!.split(",");
        final String selectedButton = userAnswer?.answer ?? '';

        answerWidget = GroupButton(
          spacing: 10,
          buttons: buttons,
          onSelected: (int index, bool isSelected) =>
              onSelected!(buttons[index]),
          direction: Axis.vertical,
          selectedButton: selectedButton != ''
              ? buttons.indexOf(selectedButton).toInt()
              : null,
        );
        break;
      case QuestionType.MULTIPLE:
        final List<String> buttons = question.answer!.split(",");
        final String selectedButtons = userAnswer?.answer ?? '';

        answerWidget = GroupButton(
          spacing: 10,
          buttons: buttons,
          onSelected: (int index, bool isSelected) {
            final String rawCurrentAnswer = userAnswer?.answer ?? '';
            final List<String> currentAnswer = rawCurrentAnswer != ''
                ? rawCurrentAnswer.split(",")
                : <String>[];
            // TODO: if currentAnswer left empty, remove the answer
            if (isSelected) {
              currentAnswer.add(buttons[index]);
            } else {
              currentAnswer.remove(buttons[index]);
            }
            onSelected!(currentAnswer.join(","));
          },
          direction: Axis.vertical,
          isRadio: false,
          selectedButtons: selectedButtons != ''
              ? selectedButtons
                  .split(",")
                  .map((String value) => buttons.indexOf(value).toInt())
                  .toList()
              : null,
        );
        break;
      case QuestionType.BOOL:
        final List<String> buttons = <String>['Yanlış', 'Doğru'];
        final String selectedButton = userAnswer?.answer ?? '';

        answerWidget = GroupButton(
          spacing: 10,
          buttons: buttons,
          selectedButton: selectedButton != ''
              ? buttons.indexOf(selectedButton).toInt()
              : null,
          onSelected: (int index, bool isSelected) =>
              onSelected!(buttons[index]),
          direction: Axis.vertical,
        );
        break;
      default:
        // TODO: any better option?
        answerWidget = Container();
        break;
    }
    return answerWidget;
  }

  @override
  Widget build(BuildContext context) {
    if (question == null) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 8.0),
            child: Text(
              'Bu anketinin soruları hala yok!',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 25),
            ),
          ),
        ],
      );
    }
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 8.0),
          child: Text(
            question!.statement,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: _renderInput(question: question!),
        ),
      ],
    );
  }
}
