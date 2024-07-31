import 'package:class_alloc/core/network/api_client.dart';
import 'package:injectable/injectable.dart';

import '../models/classroom_detail_model.dart';
import '../models/classroom_model.dart';

abstract class ClassroomDataSource {
  Future<List<ClassroomModel>> getClassrooms();
  Future<ClassroomDetailModel> getClassroom(int id);
  Future<bool> allocateSubject(int id, int subjectId);
}

@Injectable(as: ClassroomDataSource)
class ClassroomDataSourceImpl implements ClassroomDataSource {
  final ApiClient apiClient;

  const ClassroomDataSourceImpl({required this.apiClient});

  @override
  Future<bool> allocateSubject(int id, int subjectId) async {
    final response = await apiClient.patch(
      '/classrooms/$id',
      {'subject': subjectId},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to allocate subject');
    }
  }

  @override
  Future<ClassroomDetailModel> getClassroom(int id) async {
    final response = await apiClient.get('/classrooms/$id');
    if (response.statusCode == 200) {
      return ClassroomDetailModel.fromParsedJson(response.data);
    } else {
      throw Exception('Failed to load classroom');
    }
  }

  @override
  Future<List<ClassroomModel>> getClassrooms() async {
    final response = await apiClient.get('/classrooms');
    if (response.statusCode == 200) {
      final classrooms = (response.data as Map)['classrooms'] as List;
      return classrooms
          .map((classroom) => ClassroomModel.fromParsedJson(classroom))
          .toList();
    } else {
      throw Exception('Failed to load classrooms');
    }
  }
}
