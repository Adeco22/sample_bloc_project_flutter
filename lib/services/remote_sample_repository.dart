// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 11:59 AM

import 'package:sample_bloc/services/sample_app_repository.dart';

///
class RemoteSampleRepository extends SampleAppRepository {
  @override
  Future<bool> login(String username, String password) async {
    //  Get from API
    return true;
  }
}
