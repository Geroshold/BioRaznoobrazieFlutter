import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this._supported, {required Locale system})
      : super(
          _supported.firstWhere(
            (locale) => locale.languageCode == system.languageCode,
            orElse: () => _supported.first,
          ),
        );

  final List<Locale> _supported;

  void toggle() {
    final index = _supported.indexWhere(
      (locale) => locale.languageCode == state.languageCode,
    );
    emit(_supported[(index + 1) % _supported.length]);
  }
}