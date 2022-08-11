import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/view/find/controller/find_zodiac_controller.dart';
import 'package:fortune_telling/view/login/controller/zodiac_controller.dart';
import 'package:get/get.dart';

class FindZodiacView extends StatelessWidget {
  const FindZodiacView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FindZodiacController findZodiacController =
        Get.put(FindZodiacController.instance);

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DateTimePicker(
                initialValue: '',
                firstDate: DateTime(1960),
                lastDate: DateTime(2023),
                dateLabelText: 'Date',
                onChanged: (val) {
                  findZodiacController.setBirthdayValue = val;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    findZodiacController.val.value = ZodiacController.instance
                        .getZodicaSign(
                            DateTime.parse(findZodiacController.getBirthday));
                    findZodiacController.val1.value = ZodiacController.instance
                        .getZodiacSignImagePath(findZodiacController.val.value);
                  },
                  child: const Text("Burcumu Bul")),
              const SizedBox(height: 10),
              Obx(() => Text(findZodiacController.val.value)),
              Obx(() => findZodiacController.val1.value != ""
                  ? Image.asset(findZodiacController.val1.value)
                  : const Center())
            ]),
      ),
    );
  }
}
