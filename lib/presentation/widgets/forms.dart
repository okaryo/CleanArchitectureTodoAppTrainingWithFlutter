// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

typedef FormFieldValidator<T> = String? Function(T? value);

abstract class FormField<T> {
  String get label;

  T get value;
  set value(T value);

  Widget build(BuildContext context);

  String? validate(T value) => null;
}

class InlineFormField<T> extends FormField<T> {
  InlineFormField({
    required this.label,
    required this.builder,
    required T value,
    this.validator,
  }) : notifier = ValueNotifier<T>(value);

  final ValueNotifier<T> notifier;
  final validationMessage = ValueNotifier<String?>(null);

  @override
  final String label;

  @override
  T get value => notifier.value;

  @override
  set value(T value) {
    notifier.value = value;
  }

  final Widget Function<T>(BuildContext, T value, ValueChanged<T> onChanged)
      builder;

  final FormFieldValidator<T>? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ValueListenableBuilder<T>(
          valueListenable: notifier,
          builder: (context, value, child) {
            return builder(
              context,
              value,
              (value) {
                if (validator != null) {
                  validationMessage.value = validator!(value);
                  if (validationMessage.value != null) {
                    return;
                  }
                }
                notifier.value = value;
              },
            );
          },
        ),
        ValueListenableBuilder<String?>(
          valueListenable: validationMessage,
          builder: (context, value, child) {
            if (value == null) return const SizedBox.shrink();
            return Text(
              value,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.colorScheme.error),
            );
          },
        ),
      ],
    );
  }

  @override
  String? validate(T value) {
    if (validator != null) return validator!(value);
    return null;
  }
}

class StringFormField extends StatelessWidget {
  const StringFormField({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.validator,
    this.builder,
  }) : super(key: key);

  final String label;
  final String? value;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final TextFieldBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return _TextField(
      label: label,
      value: value,
      validator: validator,
      onChanged: onChanged,
      builder: (context, controller) {
        if (builder != null) {
          return builder!(context, controller);
        } else {
          return TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(labelText: label),
            onChanged: onChanged,
          );
        }
      },
    );
  }
}

typedef TextFieldBuilder = Widget Function(
    BuildContext context, TextEditingController controller);

class _TextField extends StatefulWidget {
  const _TextField({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.builder,
    this.validator,
  }) : super(key: key);

  final String label;
  final String? value;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final TextFieldBuilder? builder;

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  late final controller = TextEditingController(text: widget.value);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.addListener(() {
        widget.onChanged(controller.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.builder != null) {
      return widget.builder!(context, controller);
    } else {
      return TextFormField(
        controller: controller,
        validator: (value) {
          if (widget.validator != null) {
            return widget.validator!(value);
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: widget.label,
        ),
        onChanged: widget.onChanged,
      );
    }
  }
}
