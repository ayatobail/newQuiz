import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_textField.dart';
import 'package:new_quiz/UI/views/college%20details/college_details.dart';
import 'package:new_quiz/UI/views/login_view/login_view.dart';
import 'package:new_quiz/UI/views/main_view/hom_view/home_controller.dart';
import 'package:new_quiz/core/enums/colleges.dart';
import '../../../../core/utilies/general_utilies.dart';
import '../../../shared/utilis.dart';
import '../main_view_widget/custom_appBar.dart';

class homView extends StatefulWidget {
  const homView({Key? key}) : super(key: key);

  @override
  _homViewState createState() => _homViewState();
}

homeController controller = Get.put(homeController());
TextEditingController searchController = TextEditingController();
COLLEGES colleges = COLLEGES.ALL;
int _currentIndex = 0;




class _homViewState extends State<homView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar(
          text: 'الرئيسية',
          icon: SvgPicture.asset('images/ic_home.svg'),
          height: screenWidth(3.2),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(17)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(
                hintTExt: "بحث",
                controller: searchController,
                prefixIcon: Icons.search,
                colorText: AppColors.TextFielColor,
                colorfield: AppColors.fieldColor,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: screenWidth(20),
                ),
                child: Obx(() {
                  return CarouselSlider(
                    items: controller.imageList.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: screenWidth(2),
                            height:  screenWidth(10),
                            child: FancyShimmerImage(imageUrl: imageUrl,)
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      height: screenHeight(4.5),
                      initialPage: 0,
                      viewportFraction: 1.0,
                      enlargeCenterPage: true,
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  );
                }
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.imageList.map((imageUrl) {
                    int index = controller.imageList.indexOf(imageUrl);
                    return Container(
                      width: screenWidth(50),
                      height: screenHeight(100),
                      margin:
                          EdgeInsets.symmetric(horizontal: screenWidth(200)),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _currentIndex == index
                            ? AppColors.darkPurbleColor
                            : AppColors.whiteColor,
                        border: Border.all(
                          color: AppColors
                              .darkPurbleColor, // Set the border color here
                          width: screenWidth(400), // Set the border width here
                        ),
                        // borderRadius:
                        //     BorderRadius.circular(10), // Set the border radius here
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(35)),
                child: Text(
                  "التصنيفات",
                  style: TextStyle(fontSize: screenWidth(20)),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navItems(
                    isslected: colleges == COLLEGES.ALL,
                    ontap: () {
                      setState(() {
                        colleges = COLLEGES.ALL;
                      });
                      controller.collegesDisplay();
                    },
                    text: "الكل",
                  ),
                  navItems(
                      isslected: colleges == COLLEGES.ENGINEERING,
                      ontap: () {
                        controller.collegesDisplay(id: 1);
                        setState(() {
                          colleges = COLLEGES.ENGINEERING;
                        });
                      },
                      text: "الكليات الهندسية"),
                  navItems(
                      isslected: colleges == COLLEGES.MEDICINE,
                      ontap: () {
                        setState(() {
                          colleges = COLLEGES.MEDICINE;
                        });
                        controller.collegesDisplay(id: 2);
                      },
                      text: "الكليات الطبية"),
                ],
              ),

              SizedBox(
                height: screenWidth(40),
              ),

              Obx(() {
                return controller.col.isEmpty
                    ? SpinKitCircle(
                        color: AppColors.darkPurbleColor,
                      )
                    : Expanded(
                        child: GridView.builder(
                          itemCount: controller.col.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                           controller.index.value=index;
                            return InkWell(
                              onTap: () {
                                storage.getUser() == ""
                                    ? showDialog(
                                        builder: (BuildContext context) {
                                          return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero),
                                              child: Container(
                                                height: screenWidth(1),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                        "images/key.svg"),
                                                    Text(
                                                        "يرجى الإشتراك لإتمام عملية التصفح"),
                                                    customButton(
                                                        text: "تسجيل الدخول",
                                                        onPressed: () {
                                                          Get.to(loginView(
                                                              name: ""));
                                                        }),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text("ليس لديك حساب ؟"),
                                                        Text(
                                                          "أنشأ حسابك الان",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .darkPurbleColor),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ));
                                        },
                                        context: context)
                                    : Get.to(collegeDetails(
                                        collegeName: controller.col[index]
                                                .specializationName ??
                                            ""));
                              },
                              child: Column(
                                children: [
                                  FancyShimmerImage(
                                    imageUrl: controller.col[index].image ?? "",
                                    height: screenWidth(5),
                                    width: screenWidth(5),
                                  ),
                                  Text(controller
                                      .col[index].specializationName ??
                                      ""),
                                ],
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                        ),
                      );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chip(
                    label: Text("ماستر",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: screenWidth(20))),
                    backgroundColor: AppColors.darkPurbleColor,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth(50),
                  ),
                  InkWell(
                    onTap: (){Get.to(collegeDetails(
                        collegeName: controller.col[controller.index.value]
                            .specializationName ??
                            ""));},
                    child: Chip(
                      label: Text("تخرج",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: screenWidth(20))),
                      backgroundColor: AppColors.blueColor,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItems(
      {required String text,
      required bool isslected,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                color: isslected ? AppColors.blueColor : Colors.black),
          ),

          isslected
              ? Container(
                  height: screenWidth(200),
                  width: screenWidth(6),
                  color: AppColors.blueColor)
              : Container()
        ],
      ),
    );
  }
}
