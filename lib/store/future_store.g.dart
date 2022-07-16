// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FutureStore<T> on _FutureStore<T>, Store {
  Computed<FutureState>? _$stateComputed;

  @override
  FutureState get state => (_$stateComputed ??=
          Computed<FutureState>(() => super.state, name: '_FutureStore.state'))
      .value;

  late final _$dataAtom = Atom(name: '_FutureStore.data', context: context);

  @override
  T? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(T? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$futureAtom = Atom(name: '_FutureStore.future', context: context);

  @override
  ObservableFuture<T>? get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(ObservableFuture<T>? value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_FutureStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  @override
  String toString() {
    return '''
data: ${data},
future: ${future},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
