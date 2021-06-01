import 'package:colorize/colorize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:group_button/group_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/survey/application/survey.notifier.dart';
import 'package:thesis_cancer/features/survey/application/survey.provider.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';

/*
* TODO: Make this more generic.
*  - Receive a question object(or not).
*  - Receive an answer object.
*  - Receive an onSelected(onAnswer) function.
* */
class QuestionWidget extends HookWidget {
  QuestionWidget({required this.surveyID});

  final String surveyID;

  final _shortAnswerValidator = MultiValidator([
    RequiredValidator(errorText: 'Bu soruya cevap vermelisiniz.'),
    MinLengthValidator(15, errorText: 'Bu cevap çok kısa'),
    MaxLengthValidator(50, errorText: 'Bu cevap çok uzun.')
  ]);

  final _longAnswerValidator = MultiValidator([
    RequiredValidator(errorText: 'Bu soruya cevap vermelisiniz.'),
    MinLengthValidator(50, errorText: 'Bu cevap çok kısa'),
    MaxLengthValidator(150, errorText: 'Bu cevap çok uzun.')
  ]);

  // QuestionWidget({Key? key, required this.question}) : super(key: key);

  Widget _renderInput(
      {required Question question, required SurveyNotifier surveyNotifier}) {
    Widget answerWidget;
    switch (question.type) {
      case QuestionType.OPEN_SHORT:
        answerWidget = TextFormField(
          // controller: _,
          validator: _shortAnswerValidator,
          decoration: const InputDecoration(
            hintText: "Cevabı buraya yazınız...",
          ),
        );
        break;
      case QuestionType.OPEN_LONG:
        answerWidget = TextFormField(
          // controller: _,
          validator: _longAnswerValidator,
          decoration: const InputDecoration(
            hintText: "Cevabı buraya yazınız...",
          ),
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          maxLength: 1000,
        );
        break;
      case QuestionType.SINGLE:
        final List<String> buttons = question.answer!.split(",");
        final String selectedButton =
            surveyNotifier.answers[question.id]?.answer ?? '';
        answerWidget = GroupButton(
          spacing: 10,
          buttons: buttons,
          onSelected: (index, isSelected) => surveyNotifier.answerQuestion(
              questionId: question.id,
              answer: buttons[index],
              statement: question.statement),
          direction: Axis.vertical,
          selectedButton: selectedButton != ''
              ? buttons.indexOf(selectedButton).toInt()
              : null,
        );
        break;
      case QuestionType.MULTIPLE:
        final List<String> buttons = question.answer!.split(",");
        final String selectedButtons =
            surveyNotifier.answers[question.id]?.answer ?? '';
        answerWidget = GroupButton(
          spacing: 10,
          buttons: buttons,
          onSelected: (index, isSelected) {
            final String rawCurrentAnswer =
                surveyNotifier.answers[question.id]?.answer ?? '';
            final List<String> currentAnswer =
                rawCurrentAnswer != '' ? rawCurrentAnswer.split(",") : [];
            print(Colorize(isSelected.toString()).blue());
            // TODO: if currentAnswer left empty, remove the answer
            if (isSelected) {
              currentAnswer.add(buttons[index]);
            } else {
              currentAnswer.remove(buttons[index]);
            }
            surveyNotifier.answerQuestion(
                questionId: question.id,
                answer: currentAnswer.join(","),
                statement: question.statement);
          },
          direction: Axis.vertical,
          isRadio: false,
          selectedButtons: selectedButtons != ''
              ? buttons.map((value) => buttons.indexOf(value).toInt()).toList()
              : null,
        );
        break;
      case QuestionType.BOOL:
        final List<String> buttons = ['Yanlış', 'Doğru'];
        // TODO: Keep it as a question state(question answer), at least for local
        // TODO: This keeps always the same selected option in radio buttons, but not in checkbox
        final String selectedButton =
            surveyNotifier.answers[question.id]?.answer ?? '';
        print("Answers: ${surveyNotifier.answers}, $selectedButton");
        answerWidget = GroupButton(
          spacing: 10,
          buttons: buttons,
          selectedButton: selectedButton != ''
              ? buttons.indexOf(selectedButton).toInt()
              : null,
          onSelected: (index, isSelected) => surveyNotifier.answerQuestion(
              questionId: question.id,
              answer: buttons[index],
              statement: question.statement),
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
    final surveyNotifier =
        useProvider(surveyNotifierProvider(surveyID).notifier);
    final questionEntity = useProvider(questionEntityProvider);
    final _question = questionEntity.state;
    if (_question == null) {
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
            _question.statement,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 24),
        _renderInput(
          question: _question,
          surveyNotifier: surveyNotifier,
        ),
      ],
    );
  }
}
