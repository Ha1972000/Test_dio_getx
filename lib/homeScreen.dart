import 'package:dio_getx/GetDataController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  final getDataController = Get.put(GetDataController());

  @override
  void initState() {
    getDataController.getDataFromApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Getx_dio'),
        ),
        body: !getDataController.isLoading.value
            ? ListView.builder(
                itemCount: getDataController.abc.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.pinkAccent),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(getDataController.abc[index].title),
                                Text(getDataController.abc[index].body),
                                // Text(getDataController.abc[index].toString().id),

                              ],
                            ),
                          ),
                        ),
                      ));
                })
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
