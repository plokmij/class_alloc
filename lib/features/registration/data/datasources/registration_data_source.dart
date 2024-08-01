import 'package:class_alloc/core/network/api_client.dart';
import 'package:injectable/injectable.dart';

import '../models/registration_model.dart';

abstract class RegistrationDataSource {
  Future<List<RegistrationModel>> getRegistrations();
  Future<RegistrationModel> getRegistrationById(int id);
  Future<RegistrationModel> registerStudent(int studentId, int subjectId);
  Future<bool> removeRegistration(int registrationId);
}

@Singleton(as: RegistrationDataSource)
class RegistrationDataSourceImpl implements RegistrationDataSource {
  final ApiClient apiClient;

  const RegistrationDataSourceImpl({required this.apiClient});

  @override
  Future<RegistrationModel> getRegistrationById(int id) async {
    final response = await apiClient.get('/registration/$id');
    if (response.statusCode == 200) {
      return RegistrationModel.fromParsedJson(response.data);
    } else {
      throw Exception('Failed to load registration');
    }
  }

  @override
  Future<List<RegistrationModel>> getRegistrations() async {
    final response = await apiClient.get('/registration');
    if (response.statusCode == 200) {
      final registrations = (response.data as Map)['registrations'] as List;
      return registrations
          .map((registration) => RegistrationModel.fromParsedJson(registration))
          .toList();
    } else {
      throw Exception('Failed to load registrations');
    }
  }

  @override
  Future<RegistrationModel> registerStudent(
      int studentId, int subjectId) async {
    final response = await apiClient.post(
      '/registration/',
      {'student': studentId, 'subject': subjectId},
    );

    if (response.statusCode == 200) {
      return RegistrationModel.fromParsedJson(response.data['registration']);
    } else {
      throw Exception('Failed to register student');
    }
  }

  @override
  Future<bool> removeRegistration(int registrationId) async {
    final response = await apiClient.delete('/registrations/$registrationId');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to remove registration');
    }
  }
}
