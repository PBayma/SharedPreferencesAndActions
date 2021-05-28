import 'package:flutter/material.dart';

@immutable
abstract class EntrarPageEvent {
  const EntrarPageEvent();
}

@immutable
class HomePageStart extends EntrarPageEvent {
  const HomePageStart();
}

@immutable
class SalvarDados extends EntrarPageEvent {
  final String email;
  final String password;
  const SalvarDados(this.email, this.password);
}

class LembrarDados extends EntrarPageEvent {
  final bool lembrarDados;
  const LembrarDados(this.lembrarDados);
}

@immutable
class QuestionaryPageError extends EntrarPageEvent {
  final String message;
  const QuestionaryPageError(this.message);
}
