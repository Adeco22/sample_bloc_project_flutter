import 'package:mocktail/mocktail.dart';

// Includes
//
// Author - anthonydeco
//
// Created at - 9/13/21 11:58 AM

///
abstract class SampleAppRepository {
  Future<bool> login(String username, String password);
}

class MockSampleAppRepository extends Mock implements SampleAppRepository {}
