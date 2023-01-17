// import 'package:flutter/material.dart';

// import 'lesson_sub_title_card.dart';

// class LessonCard extends StatelessWidget {
//   final Color cardBackgroungColor;
//   final Color cardColor;

//   const LessonCard(
//       {Key? key,
//       required this.h,
//       required this.w,
//       required this.cardColor,
//       required this.cardBackgroungColor})
//       : super(key: key);

//   final double h;
//   final double w;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: h * 0.4,
//       width: w * 0.97,
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         color: cardBackgroungColor,
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 5,
//             ),
//             Container(
//               height: h * 0.12,
//               width: w * 0.9,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10), color: cardColor),
//               child: const Center(
//                 child: Text(
//                   "Lektion 1",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             LessonSubTitle(
//               w: w,
//               checkColor: cardColor,
//             ),
//             LessonSubTitle(w: w, checkColor: cardColor),
//             LessonSubTitle(w: w, checkColor: cardColor),
//             LessonSubTitle(w: w, done: false, checkColor: cardColor),
//             LessonSubTitle(w: w, done: false, checkColor: cardColor)
//           ],
//         ),
//       ),
//     );
//   }
// }
