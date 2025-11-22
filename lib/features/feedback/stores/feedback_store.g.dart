// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedbackStore on _FeedbackStore, Store {
  late final _$titleAtom = Atom(name: '_FeedbackStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$messageAtom = Atom(
    name: '_FeedbackStore.message',
    context: context,
  );

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$isSubmittingAtom = Atom(
    name: '_FeedbackStore.isSubmitting',
    context: context,
  );

  @override
  bool get isSubmitting {
    _$isSubmittingAtom.reportRead();
    return super.isSubmitting;
  }

  @override
  set isSubmitting(bool value) {
    _$isSubmittingAtom.reportWrite(value, super.isSubmitting, () {
      super.isSubmitting = value;
    });
  }

  late final _$_FeedbackStoreActionController = ActionController(
    name: '_FeedbackStore',
    context: context,
  );

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction(
      name: '_FeedbackStore.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction(
      name: '_FeedbackStore.setMessage',
    );
    try {
      return super.setMessage(value);
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool submitFeedback() {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction(
      name: '_FeedbackStore.submitFeedback',
    );
    try {
      return super.submitFeedback();
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
message: ${message},
isSubmitting: ${isSubmitting}
    ''';
  }
}
