import 'package:assessment/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  var baseUrl = 'http://www.example.com';
  group('ClientTest', () {
    late MockClient mockClient;
    late ApiService apiService;

    setUp(() {
      mockClient = MockClient();
      apiService = ApiService(baseUrl: baseUrl, client: mockClient);
    });

    test(
      'returnDataSuccessfully',
      () async {
        // Arrange
        when(() => mockClient.get(Uri.parse('$baseUrl/user/123'))).thenAnswer(
          (_) async => http.Response(
            '{"id": "123", "userName": "Farouk"}',
            200,
          ),
        );

        // Act
        final apiData = await apiService.getUserData('123');

        // Assert
        expect(apiData, {'id': '123', 'userName': 'Farouk'});
      },
    );
    test('getUserData throws an exception on error', () async {
      // Arrange
      when(() => mockClient.get(Uri.parse('$baseUrl/user/123'))).thenAnswer(
        (_) async => http.Response(
          'Not Found',
          404,
        ),
      );

      // Act & Assert
      expect(
        () async => await apiService.getUserData('123'),
        throwsA(isA<Exception>().having((e) => e.toString(), 'description',
            contains('Failed to load user data'))),
      );
    });
  });
}
