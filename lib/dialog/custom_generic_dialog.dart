import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> customGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder dialogOptions,
}) =>
    showDialog<T?>(
      context: context,
      builder: (context) {
        final options = dialogOptions();
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: options.keys
              .map(
                (optionTitle) => TextButton(
                  onPressed: () {
                    final value = options[optionTitle];
                    if (value != null) {
                      Navigator.of(context).pop(value);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    optionTitle,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
