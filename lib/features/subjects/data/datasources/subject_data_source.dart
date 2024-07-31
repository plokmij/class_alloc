import 'package:injectable/injectable.dart';

import '../../../../core/network/api_client.dart';
import '../models/subject_model.dart';

abstract class SubjectDataSource {
  Future<List<SubjectModel>> getAllSubjects();
  Future<SubjectModel> getSubjectById(int id);
}

@Singleton(as: SubjectDataSource)
class SubjectDataSourceImpl implements SubjectDataSource {
  final ApiClient apiClient;

  SubjectDataSourceImpl({required this.apiClient});

  @override
  Future<List<SubjectModel>> getAllSubjects() async {
    final response = await apiClient.get('/subjects');

    if (response.statusCode == 200) {
      final subjects = (response.data as Map)['subjects'] as List;
      return subjects
          .map((subject) => SubjectModel.fromParsedJson(subject))
          .toList();
    } else {
      throw Exception('Failed to load subjects');
    }
  }

  @override
  Future<SubjectModel> getSubjectById(int id) async {
    final response = await apiClient.get('/subjects/$id');

    if (response.statusCode == 200) {
      return SubjectModel.fromParsedJson(response.data);
    } else {
      throw Exception('Failed to load subject');
    }
  }
}
