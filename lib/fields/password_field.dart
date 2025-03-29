import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:ui_components/ui_components.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.controller,
    this.label,
    this.hintText,
    this.validator,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.hasPasswordStrengthChecker = false,
    super.key,
  });

  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final String? Function(String? value)? validator;
  final bool enabled;
  final TextInputAction? textInputAction;
  final ValueSetter<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final bool hasPasswordStrengthChecker;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _showPassword = false;
  int _passwordStrength = 0;

  Widget _passwordField() {
    return AppTextField(
      controller: widget.controller,
      label: widget.label ?? 'Password',
      hintText: widget.hintText ?? 'Enter your password',
      prefixIcon: const Icon(Ionicons.lock_closed_outline),
      enabled: widget.enabled,
      obscureText: !_showPassword,
      textInputAction: widget.textInputAction,
      maxLines: 1,
      isDense: true,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      suffixIcon: GestureDetector(
        child: Icon(_showPassword ? Ionicons.eye_outline : Ionicons.eye_off_outline),
        onTap: () => setState(() => _showPassword = !_showPassword),
      ),
      validator: (value) {
        if (_passwordStrength < 4 && widget.hasPasswordStrengthChecker) {
          return 'Password is not strong enough.';
        }

        return widget.validator?.call(value);
      },
    );
  }

  Widget _passwordStrengthMeter() {
    return PasswordStrengtMeter(
      passwordController: widget.controller,
      score: (score) => setState(() => _passwordStrength = score),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.hasPasswordStrengthChecker
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _passwordField(),
              _passwordStrengthMeter(),
            ],
          )
        : _passwordField();
  }
}

class PasswordStrengtMeter extends StatefulWidget {
  const PasswordStrengtMeter({
    required this.passwordController,
    required this.score,
    this.minPasswordLength = 6,
    this.shouldIncludeDigits = true,
    this.shouldIncludeSpecialCharacters = true,
    this.shouldIncludeUppercase = true,
    super.key,
  });

  final TextEditingController passwordController;
  final ValueChanged<int> score;
  final int minPasswordLength;
  final bool shouldIncludeUppercase;
  final bool shouldIncludeDigits;
  final bool shouldIncludeSpecialCharacters;

  @override
  State<PasswordStrengtMeter> createState() => _PasswordStrengtMeterState();
}

class _PasswordStrengtMeterState extends State<PasswordStrengtMeter> {
  String _resultText = '';
  List<int> _strengthMeter = List.filled(4, 0);

  TextEditingController get passwordController => widget.passwordController;
  int get minPasswordLength => widget.minPasswordLength;

  RegExp get _lowerCase => RegExp(
        '^(?=.*?[a-z]).{'
        '$minPasswordLength'
        r',}$',
      );

  RegExp get _upperCase => RegExp(
        '^(?=.*?[A-Z]).{'
        '$minPasswordLength'
        r',}$',
      );

  RegExp get _numberCase => RegExp(
        '^(?=.*?[0-9]).{'
        '$minPasswordLength'
        r',}$',
      );

  RegExp get _symbolsCase => RegExp(
        r'^(?=.*?[!@#\$&*~]).{'
        '$minPasswordLength'
        r',}$',
      );

  int _scorePassword(String password) {
    var score = 0;

    if (password.isNotEmpty || password.length >= minPasswordLength) {
      if (_lowerCase.hasMatch(password)) {
        score += 1;
      }

      if (widget.shouldIncludeUppercase && _upperCase.hasMatch(password)) {
        score += 1;
      }

      if (widget.shouldIncludeDigits && _numberCase.hasMatch(password)) {
        score += 1;
      }

      if (widget.shouldIncludeSpecialCharacters && _symbolsCase.hasMatch(password)) {
        score += 1;
      }
    } else {
      score = 0;
    }

    return score;
  }

  @override
  void initState() {
    super.initState();

    widget.passwordController.addListener(_checkPasswordStrength);
  }

  Future<void> _checkPasswordStrength() async {
    final text = passwordController.text.trimAll;
    final score = _scorePassword(text);

    setState(() {
      if (text.isEmpty) {
        _resultText = '';
      }

      switch (score) {
        case 0:
          _resultText = 'Weak password';
          _strengthMeter = [0, 0, 0, 0];
        case 1:
          _resultText = 'Nice password';
          _strengthMeter = [1, 0, 0, 0];
        case 2:
          _resultText = 'Good password';
          _strengthMeter = [1, 1, 0, 0];
        case 3:
          _resultText = 'Better password';
          _strengthMeter = [1, 1, 1, 0];
        default:
          _resultText = 'Strong password';
          _strengthMeter = [1, 1, 1, 1];
      }
    });

    widget.score(score);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.s4),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: Dimens.s4,
          children: [
            Row(
              spacing: Dimens.s2,
              children: _strengthMeter
                  .map(
                    (e) => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.fastOutSlowIn,
                      width: constraints.maxWidth / 4 - 2,
                      height: 6,
                      color: e == 1 ? Colors.lightGreen : Colors.black12,
                    ),
                  )
                  .toList(),
            ),
            if (_resultText.isNotEmpty) Text(_resultText, style: context.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
