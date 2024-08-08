import 'package:assessment/models/beneficiary_model.dart';
import 'package:assessment/models/user.dart';
import 'package:get/get.dart';

class MockService extends GetxService {
  Future<Response> getUserData() async {
    User user = User(
        userName: 'Farouk Ragab',
        balance: null,
        phoneNumber: '+971502672133',
        isVerified: false,
        topUpAmount: 0.0,
        email: null);
    return Response(
      statusCode: 200,
      body: user.toJson(),
    );
  }

  Future<Response> getBeneficiaries() async {
    List<Beneficiary> beneficiaries = [];
    return Response(
      statusCode: 200,
      body: beneficiaries,
    );
  }

  Future<Response> addBeneficiary(String nickname, String phoneNumber) async {
    return const Response(
      statusCode: 200,
      body: {"success": true},
    );
  }

  Future<Response> topUp(String phoneNumber, int amount) async {
    return const Response(
      statusCode: 200,
      body: {"success": true},
    );
  }

  Future<Response> deleteBeneficiary(String phoneNumber) async {
    return const Response(
      statusCode: 200,
      body: {"success": true},
    );
  }

  Future<Response> verifyUserEmail(String email) async {
    return const Response(
      statusCode: 200,
      body: {'success': true},
    );
  }
}
