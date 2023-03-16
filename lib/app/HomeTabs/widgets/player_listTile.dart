import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoulingo/app/HomeTabs/widgets/sub_widgets.dart';

import '../../../core/config/utils/colors.dart';

SizedBox lsitPlayerItem() {
  return SizedBox(
    width: double.infinity,
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Text(
                "1200 EXP",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.amber[700],
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Spacer(),
            Text(
              "خالد سعد",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 10.w,
            ),
            Avatar(
              width: 50.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "2",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
        const MyDivider(),
      ],
    ),
  );
}
