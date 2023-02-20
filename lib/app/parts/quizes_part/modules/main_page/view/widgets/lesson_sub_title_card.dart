import 'package:flutter/material.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

class LessonSubTitle extends StatelessWidget {
  final bool done;
  final Color checkColor;
  const LessonSubTitle(
      {Key? key,
      required this.w,
      required this.h,
      this.done = true,
      required this.checkColor})
      : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: done
                ? Icon(
                    Icons.check_circle,
                    color: checkColor,
                    size: 27,
                  )
                : const Icon(
                    Icons.circle,
                    color: AppColors.myGrey,
                    size: 27,
                  ),
          ),
          Container(
            height: h * 0.07,
            width: w * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  "https://img.freepik.com/free-vector/people-walking-sitting-hospital-building-city-clinic-glass-exterior-flat-vector-illustration-medical-help-emergency-architecture-healthcare-concept_74855-10130.jpg",
                ),
              ),
            ),
          ),
          SizedBox(
            width: w * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lektion 1",
                style: TextStyle(
                    color: done ? Colors.black : Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                "Hospital and kranrkheit",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
