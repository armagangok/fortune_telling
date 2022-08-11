import 'package:flutter/material.dart';

import '../../core/constants/asset_constant.dart';
import '../../core/extension/context_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(KAsset.backgroundImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Image.asset(KAsset.planet),
              Card(
                color: Colors.grey.withOpacity(0.2),
                shape: shape(),
                child: SizedBox(
                  height: context.height(0.4),
                  child: Padding(
                    padding: padding(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: text("Bana Özel"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: text("Burcumu Bul"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: text("Tüm Burçlar"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 3)
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets padding(BuildContext context) {
    return EdgeInsets.all(context.width(0.05));
  }

  RoundedRectangleBorder shape() =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));

  Widget text(String text) {
    return Builder(
      builder: (context) {
        return Text(
          text,
          style: context.textTheme.headline4!.copyWith(
            color: Colors.white,
          ),
        );
      },
    );
  }
}