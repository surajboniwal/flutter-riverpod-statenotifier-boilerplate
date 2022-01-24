import 'package:flutter_riverpod_statenotifier_boilerplate/core/logger.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/core/network_client.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/core/response.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/data/models/user/user.dart';

abstract class BaseUserRepository {
  Future<ApiResponse<List<User>>> fetchUsers();
}

class UserRepository with BaseRepository implements BaseUserRepository {
  @override
  Future<ApiResponse<List<User>>> fetchUsers() async {
    try {
      Response response = await client.get('/users');
      return ApiResponse.completed((response.data as List).map((e) => User.fromJson(e)).toList());
    } on DioError catch (err) {
      Logger.error(err.toString());
      return ApiResponse.error(err.toString());
    } catch (err) {
      Logger.error(err.toString());
      return ApiResponse.error(err.toString());
    }
  }
}
