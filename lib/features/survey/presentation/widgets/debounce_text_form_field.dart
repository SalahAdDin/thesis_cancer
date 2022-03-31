import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

///
typedef SingleStringCallback = Function(String);

/// [TextFormField] which return a [String] value to a [OnAnswer]
/// callback function when the user stops to write (for [int] debounce milliseconds.
class DebounceTextFormField extends HookWidget {
  ///
  const DebounceTextFormField({
    Key? key,
    required this.padding,
    required this.onAnswer,
    this.initialText,
    this.debounceTime,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.hintText,
  }) : super(key: key);

  ///
  final EdgeInsets padding;

  ///
  final String? initialText;

  ///
  final SingleStringCallback onAnswer;

  ///
  final int? debounceTime;

  ///
  final String? Function(String?)? validator;

  ///
  final TextInputType? keyboardType;

  ///
  final int? maxLines;

  ///
  final int? maxLength;

  ///
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey =
        useMemoized(() => GlobalKey<FormState>());
    final TextEditingController textController =
        useTextEditingController(text: initialText);

    useEffect(
      () {
        Timer? timer;
        void listener() {
          timer?.cancel();
          timer = Timer(Duration(milliseconds: debounceTime ?? 1000), () {
            _formKey.currentState?.save();
            final bool? isValid = _formKey.currentState?.validate();
            if (textController.text != "" && isValid == true) {
              onAnswer(textController.text);
            }
          });
        }

        textController.addListener(listener);

        return () {
          timer?.cancel();
          textController.removeListener(listener);
        };
      },
      <TextEditingController>[textController],
    );

    // child.controller = textController;

    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText ?? context.l10n!.defaultTextFieldHintText,
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
