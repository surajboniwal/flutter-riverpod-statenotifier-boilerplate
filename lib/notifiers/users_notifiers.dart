import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/core/response.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/data/models/user/user.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/data/repositories/user_repository.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/states/users/users_state.dart';

class UsersNotifier extends StateNotifier<UsersState> {
  UsersNotifier(this.userRepository) : super(UsersState.initial()) {
    getUsers();
  }

  UserRepository userRepository;

  static final provider =
      StateNotifierProvider<UsersNotifier, UsersState>((ref) => UsersNotifier(ref.read(UserRepository.provider)));

  Future<void> getUsers() async {
    ApiResponse<List<User>> response = await userRepository.fetchUsers();

    if (response.status == Status.ERROR) {
      state = UsersState.error(response.message);
      return;
    }

    state = UsersState.data(users: response.data);
  }
}
