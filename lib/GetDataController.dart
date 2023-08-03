import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_getx/getDatamodel.dart';
import 'package:get/get.dart';

class GetDataController extends GetxController {
  var isLoading = false.obs;
  var getDataModel =
      // GetDataModel(userId: 2, id: 2, name: 'hi', body: 'hi',mail :'hii').obs;
  GetDataModel(userId: 2, id: 2,title: 'hi', body: 'hi').obs;

  final _abc = <GetDataModel>[].obs;
  List<GetDataModel> get abc => _abc.value;


  getDataFromApi() async {
    // isLoading.value = true;

    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    log('data: $response');
    // abc = await response.data ;

    return response.data;
    print(response);
    isLoading.value = false;
  }

  getData() async {
    final res = await getDataFromApi();
    List<GetDataModel> data = [];
    (res as List).forEach((element) {
      data.add(GetDataModel.fromJson(element));
    });
    _abc.value = data;


    _abc.refresh();


  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
