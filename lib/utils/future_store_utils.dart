import 'package:mobx/mobx.dart';
import 'package:revision/core/model/enums/future_state_enum.dart';

FutureState computeFutureState(ObservableFuture? future) {
  if (future == null || future.status == FutureStatus.rejected) {
    return FutureState.initial;
  }

  return future.status == FutureStatus.pending
      ? FutureState.loading
      : FutureState.loaded;
}