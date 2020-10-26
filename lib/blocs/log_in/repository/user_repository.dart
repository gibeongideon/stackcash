import 'dart:async';
import 'package:meta/meta.dart';
import 'package:stackcash/blocs/log_in/model/user_model.dart';
import 'package:stackcash/blocs/log_in/model/api_model.dart';
import 'package:stackcash/blocs/log_in/api_connection/api_connection.dart';
import 'package:stackcash/blocs/log_in/dao/user_dao.dart';

class UserRepository {
  final userDao = UserDao();

  Future<User> authenticate ({
    @required String username,
    @required String password,
  }) async {
    UserLogin userLogin = UserLogin(
      username: username,
      password: password
    );
    Token token = await getToken(userLogin);
    User user = User(
      id: 0,
      username: username,
      token: token.token,
    );
    return user;
  }

  Future<void> persistToken ({
    @required User user
    }) async {
    // write token with the user to the database
      await userDao.createUser(user);
  }

  Future <void> delteToken({
    @required int id
  }) async {
    await userDao.deleteUser(id);
  }

  Future <bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
  }

//   Future getUser() async {
//   final result = await userDao.getUser(0);
//   print('USER_USER${result['username']}');
//   return result['username'];
// }
}