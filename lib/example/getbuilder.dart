import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  GetXBuilder o = Get.put(GetXBuilder());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: GetBuilder<GetXBuilder>(
            init: GetXBuilder(),
            initState: (state) {
              o.i = 5;
            },
            builder: (GetXBuilder controller) {
              return Text(controller.i.toString());
            },
          ),
        ),
        floatingActionButton: IconButton(
            onPressed: () {
              var obj = Get.find<GetXBuilder>();
              obj.increement();
            },
            isSelected: true,
            icon: const Icon(Icons.add)),
      ),
    );
  }
}

class GetXBuilder extends GetxController {
  var i = 0;
  increement() {
    i++;
    update();
  }
}
