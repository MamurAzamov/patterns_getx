import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var items = [].obs;

  void apiPostList() async {
    isLoading.value = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
    isLoading.value = false;
  }

  void apiPostDelete(Post post) async {
    isLoading.value = true;
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    } else {}
    isLoading.value = false;
  }

  Future<void> apiPostCreate() async {
    const url = 'http://jsonplaceholder.typicode.com/posts';

    final newData = {
      'title': 'Yangi sarlavha',
      'body': 'Yangi matn',
      'userId': 1,
    };
    isLoading.value = true;

    final response = await Dio().post(url, data: newData);
    if (response.statusCode == 201) {
      LogService.i('Malumot yaratildi');
    } else {
      LogService.e('Malumot yaratishda xatolik: ${response.statusCode}');
    }
    isLoading.value = false;
  }

  Future<bool> apiPostUpdate(Post post) async {
    isLoading.value = true;

    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    isLoading.value = false;
    LogService.i("Malumot yangilandi");
    return response != null;
  }
}
