import 'package:flutter/material.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/main_page/view/widgets/lesson_sub_title_card.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/quiz/views/pages/quiz.view.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.22,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.08,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: w * 0.08,
                        height: h * 0.04,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://www.shutterstock.com/image-vector/young-man-avatar-character-260nw-661669825.jpg',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: w * 0.1,
                        height: h * 0.05,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://png.pngtree.com/png-clipart/20220705/ourmid/pngtree-germany-flag-png-image_5684206.png',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  " 👊💪  ... وحش يالا في إييي",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Text(
                  "كدا يبرنس خلصت ربع المنهج",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
          Container(
            width: w,
            color: AppColors.primary,
            child: Container(
              width: w,
              height: h * 0.06,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    40,
                  ),
                ),
              ),
            ),
          ),
          LessonSubTitle(
            w: w,
            checkColor: AppColors.secondPrimary,
            h: h,
          ),
          LessonSubTitle(
            w: w,
            checkColor: AppColors.secondPrimary,
            h: h,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => QuizView()),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                color: AppColors.myGrey,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: LessonSubTitle(
                  h: h,
                  w: w,
                  checkColor: AppColors.secondPrimary,
                ),
              ),
            ),
          ),
          LessonSubTitle(
            w: w,
            checkColor: AppColors.secondPrimary,
            h: h,
            done: false,
          ),
          LessonSubTitle(
            w: w,
            checkColor: AppColors.secondPrimary,
            h: h,
            done: false,
          ),
        ],
      ),
    );
  }
}
