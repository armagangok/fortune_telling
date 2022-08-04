// import 'package:flutter/material.dart';
// import '../../feature/models/daily_fortune_model.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/instance_manager.dart';

// import '../../core/database/local/my_storage.dart';
// import '../../feature/controllers/fortune_controller.dart';

// class HomeView extends StatelessWidget {
//   HomeView({Key? key}) : super(key: key);

//   final FortuneController fortuneController = Get.put(
//     FortuneController.instance,
//   );
//   final MyStorage myStorage = MyStorage.instance;

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () async {
//               await fortuneController.getFortune(
//                 sign: "aslan",
//                 time: "",
//                 responseType: DailyFortuneModel(),
//               );
//             },
//             icon: const Text("press"),
//           ),
//         ),
//         body: Obx(() => fortuneController.dailyFortune.value != null
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("NAME : ${myStorage.getStorage.read('isim')}"),
//                   const Spacer(flex: 1),
//                   Text(fortuneController.dailyFortune.value!.burc!),
//                   Text(fortuneController.dailyFortune.value!.fortune!),
//                   Text(fortuneController.dailyFortune.value!.mottosu!),
//                   const Spacer(flex: 50)
//                 ],
//               )
//             : const Text("Waiting for data...")),
//       ),
//     );
//   }
// }
