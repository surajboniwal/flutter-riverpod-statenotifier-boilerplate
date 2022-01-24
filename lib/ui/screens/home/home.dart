import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/notifiers/users_notifiers.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/states/users/users_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final UsersState state = ref.watch(UsersNotifier.provider);
            return state.when(
              initial: () => Center(child: CircularProgressIndicator()),
              loading: () => Center(child: CircularProgressIndicator()),
              data: (users) => ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                ),
              ),
              error: (error) => Center(child: Text('Unable to load users')),
            );
          },
        ),
      ),
    );
  }
}
