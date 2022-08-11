import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fortune_telling/core/database/local/my_storage.dart';
import 'package:fortune_telling/view/find/controller/find_zodiac_controller.dart';
import 'package:fortune_telling/view/login/controller/zodiac_controller.dart';
import 'package:get/get.dart';

class FindZodiacView extends StatelessWidget {
  const FindZodiacView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ZodiacController zodiacController =
        Get.put(ZodiacController.instance);
    final FindZodiacController findZodiacController =
        Get.put(FindZodiacController.instance);
    RxString _val = "".obs;
    RxString _val1 = "".obs;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
                    _val.value = ZodiacController.instance.getZodicaSign(
                        DateTime.parse(findZodiacController.getBirthday));
                    _val1.value = ZodiacController.instance
                        .getZodiacSignImagePath(_val.value);
                  },
                  child: Text("Burcumu Bul")),
              SizedBox(height: 10),
              Obx(() => Text(_val.value)),
              Obx(() => _val1.value != "" ? Image.asset(_val1.value) : Center())
            ]),
      ),
    );
  }
}
