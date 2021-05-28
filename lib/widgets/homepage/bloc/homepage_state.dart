import 'package:flutter/material.dart';

@immutable
abstract class HomePageState {
  const HomePageState();
}

class EmptyState extends HomePageState {}

class LoadingState extends HomePageState {
  const LoadingState();
}

class LoadedSucessState extends HomePageState {
  final String email;
  final String password;
  final bool rememberData;
  const LoadedSucessState(this.email, this.password, this.rememberData);
}

class ErrorState extends HomePageState {
  final String message;
  ErrorState(this.message);
}
