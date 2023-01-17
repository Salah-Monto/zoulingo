// import 'package:flutter/material.dart';

// class SmilertiesCard extends StatelessWidget {
//   const SmilertiesCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Container(
//       height: h * 0.7,
//       width: w * 0.9,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: h * 0.07,
//                   width: w * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     image: const DecorationImage(
//                       image: AssetImage("assets/images/logo.jpg"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: context.height * 0.07,
//                   width: context.width * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage(Asset.images.logo),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       " والد",
//                       style: context.bodyText1!.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
