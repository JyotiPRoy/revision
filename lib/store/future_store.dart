import 'package:mobx/mobx.dart';
import 'package:revision/core/model/enums/future_state_enum.dart';
import 'package:revision/utils/future_store_utils.dart';

part 'future_store.g.dart';

class FutureStore<T> = _FutureStore<T> with _$FutureStore;

abstract class _FutureStore<T> with Store {
  @observable
  T? data;

  @observable
  ObservableFuture<T>? future;

  @observable
  String? errorMessage;

  @computed
  FutureState get state => computeFutureState(future);
}