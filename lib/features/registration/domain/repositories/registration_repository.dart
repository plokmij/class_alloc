import '../entities/registration.dart';

abstract class RegistrationRepository {
  Future<Registration> getRegistrations();
  Future<Registration> getRegistrationById(int id);
  Future<Registration> registerStudent(int studentId, int subjectId);
  Future<Registration> removeRegistration(int registrationId);
}
