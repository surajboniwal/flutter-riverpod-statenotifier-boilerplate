import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/core/response.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/data/models/user/user.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/data/repositories/user_repository.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/states/users/users_state.dart';

class UsersNotifier extends StateNotifier<UsersState> {
  UsersNotifier() : super(UsersState.initial()) {
    getUsers();
  }

  static final provider = StateNotifierProvider<UsersNotifier, UsersState>((ref) => UsersNotifier());

  Future<void> getUsers() async {
    ApiResponse<List<User>> response = await UserRepository().fetchUsers();

    if (response.status == Status.ERROR) {
      state = UsersState.error();
      return;
    }

    state = UsersState.data(users: response.data);
  }
}
