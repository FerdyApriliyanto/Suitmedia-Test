import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:suitmedia_test/models/contact_model.dart';

class ContactRepo {
  final dio = Dio();

  Future<List<ContactModel>> getContacts({required String page}) async {
    try {
      final response =
          await dio.get('https://reqres.in/api/users?page=$page&per_page=10');
      Logger().i(response);

      return List<ContactModel>.from((response.data['data'] as Iterable)
          .map((e) => ContactModel.fromJson(e)));
    } on DioException catch (e) {
      Logger().e(e.response);
      throw Exception(e);
    }
  }
}
