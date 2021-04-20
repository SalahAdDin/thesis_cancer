import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:group_button/group_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/survey/application/survey.notifier.dart';
import 'package:thesis_cancer/features/survey/application/survey.provider.dart';
import 'package:thesis_cancer/features/survey/domain/question.entity.dart';

class QuestionWidget extends HookWidget {
  final _shortAnswerValidator = MultiValidator([
    RequiredValidator(errorText: 'You must answer this question.'),
    MinLengthValidator(15, errorText: 'Your answer is too short'),
    MaxLengthValidator(50, errorText: 'Your answer is too long.')
  ]);

  final _longAnswerValidator = MultiValidator([
    RequiredValidator(errorText: 'You must answer this question.'),
    MinLengthValidator(50, errorText: 'Your answer is too short'),
    MaxLengthValidator(150, errorText: 'Your answer is too long.')
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
          decoration: InputDecoration(
            hintText: "Cevabı buraya yazsınız...",
          ),
        );
        break;
      case QuestionType.OPEN_LONG:
        answerWidget = TextFormField(
          // controller: _,
          validator: _longAnswerValidator,
          decoration: InputDecoration(
            hintText: "Cevabı buraya yazsınız...",
          ),
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          maxLength: 1000,
        );
        break;
      case QuestionType.SINGLE:
        final List<String> buttons = question.answer!.split(",");
        final String selectedButton = surveyNotifier.answers[question.id] ?? '';
        answerWidget = GroupButton(
          spacing: 10,
          buttons: buttons,
          onSelected: (index, isSelected) => surveyNotifier.answerQuestion(
              questionId: question.id, answer: buttons[index]),
          direction: Axis.vertical,
          selectedButtons: [selectedButton],
        );
        break;
      case QuestionType.MULTIPLE:
        final List<String> buttons = question.answer!.split(",");
        answerWidget = GroupButton(
          spacing: 10,
          buttons: buttons,
          onSelected: (index, isSelected) => print('$index button is selected'),
          direction: Axis.vertical,
          isRadio: false,
        );
        break;
      case QuestionType.BOOL:
        final List<String> buttons = ['Yanlış', 'Doğru'];
        // TODO: Keep it as a question state(question answer), at least for local
        final String selectedButton = surveyNotifier.answers[question.id] ?? '';
        print("Answers ${surveyNotifier.answers}, $selectedButton");
        answerWidget = GroupButton(
          spacing: 10,
          buttons: buttons,
          selectedButtons: [selectedButton],
          onSelected: (index, isSelected) => surveyNotifier.answerQuestion(
              questionId: question.id, answer: buttons[index]),
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
    final surveyNotifier = useProvider(surveyNotifierProvider.notifier);
    final questionEntity = useProvider(questionEntityProvider);
    final _question = questionEntity.state;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 8.0),
            child: Text(
              _question.statement,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 24),
          _renderInput(
            question: _question,
            surveyNotifier: surveyNotifier,
          ),
        ],
      ),
    );
  }
}
