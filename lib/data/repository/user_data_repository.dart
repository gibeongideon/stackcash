

import 'package:stackcash/data/data_provider/create_user_api.dart';
import 'package:stackcash/data/models/api_user_models.dart';

class UserDataRepository{

  final UserDataProvider _userDataProvider = UserDataProvider();

  Future<Account> getAcountBalance(userId)=> _userDataProvider.getAcountBalance(userId);
  
}