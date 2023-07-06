import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class StarterController extends GetxController {
  var isLoading = false;
  var items = [];

  void apiPostList() async {
    isLoading = true;
    update();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    update();
  }

  void apiPostDelete(Post post) async {
    isLoading = true;
    update();

    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    } else {}
    isLoading = false;
    update();
  }

  Future<void> apiPostCreate() async {
    const url = 'http://jsonplaceholder.typicode.com/posts';

    final newData = {
      'title': 'New title',
      'body': 'New text',
      'userId': 1,
    };
    isLoading = true;
    update();

    final response = await Dio().post(url, data: newData);
    if (response.statusCode == 201) {
      LogService.i('Malumot yaratildi');
    } else {
      LogService.e('Malumot yaratishda xatolik: ${response.statusCode}');
    }
    isLoading = false;
    update();
  }

  Future<bool> apiPostUpdate(Post post) async {
    isLoading = true;
    update();

    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    LogService.i("data updated");
    isLoading = false;
    update();
    return response != null;
  }
}
