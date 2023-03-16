import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/utils/colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: AppColors.primary,
      endIndent: 30.w,
      indent: 30.w,
    );
  }
}

class Avatar extends StatelessWidget {
  final double? width;
  const Avatar({
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 70.h,
      decoration: BoxDecoration(
        border: Border.all(width: 3.sp, color: AppColors.white),
        image: const DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/564x/31/44/7e/31447e25b7bc3429f83520350ed13c15.jpg",
            ),
            fit: BoxFit.contain),
        shape: BoxShape.circle,
      ),
    );
  }
}

Container theFirstCard() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 100.w),
    decoration: BoxDecoration(boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        spreadRadius: 10,
        blurRadius: 25,
        offset: Offset(0, 3),
      ),
    ], color: AppColors.primary, borderRadius: BorderRadius.circular(9.sp)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Avatar(),
          Text(
            "أحمد مختار",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
          ),
          Text(
            "1400 EXP",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.amber[700],
                fontSize: 15.sp,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
  );
}
