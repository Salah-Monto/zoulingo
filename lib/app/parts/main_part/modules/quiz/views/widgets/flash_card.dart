import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

class FlashCards extends StatelessWidget {
  const FlashCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.03),
      child: FlashCard(
        height: h * 0.81,
        width: w * 0.9,
        frontWidget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Der",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 35,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                "Vater",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                " 'mein vater ist im werk' ",
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
        backWidget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/vater.png"),
              Text("الوالد", style: Theme.of(context).textTheme.headline5),
              Text(" 'والدي في العمل' ",
                  style: Theme.of(context).textTheme.headline5),
            ],
          ),
        ),
      ),
    );
  }
}
