import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/data/models/user/user.dart';

part 'users_state.freezed.dart';

extension UsersGetters on UsersState {
  bool get isLoading => this is _UsersStateLoading;
}

@freezed
abstract class UsersState with _$UsersState {
  const factory UsersState.initial() = _UsersStateInitial;

  const factory UsersState.loading() = _UsersStateLoading;

  const factory UsersState.data({required List<User> users}) = _UsersStateData;

  const factory UsersState.error([String? error]) = _UsersStateError;
}
