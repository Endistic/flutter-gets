import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_state_management/controller/testView_page_controller.dart';
import 'package:getx_state_management/data/color_data.dart';

class TestPageView extends GetView<TestViewPageController> {
  TestPageView({Key? key}) : super(key: key);
  final testPageViewController = Get.put(TestViewPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hide/Show Widget'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Obx(
              () => Visibility(
        
                // set visible: visible: true/false,
                visible: testPageViewController.isVisible.value,
                child: Container(
                  height: 300.0,
                  // width could be queried from context view to avoid overflow
                  width: 300,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // call showContainer from Controlle Class
                    testPageViewController.showContainer();
                  },
                  child: const Text('Show Container')),
              const SizedBox(width: 35.0),
              ElevatedButton(
                  onPressed: () {
                    // call hideContainer from Controller Class
                    testPageViewController.hideContainer();
                  },
                  child: const Text('Hide Container'))
            ],
          ),
          const SizedBox(height: 20.0),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  // call showContainer from Controlle Class
                  Navigator.pushNamed(context, '/colors');
                },
                child: const Text('Next Details')),
          )
        ],
      ),
    );
  }
}
