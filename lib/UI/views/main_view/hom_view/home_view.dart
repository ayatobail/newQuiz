import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_textField.dart';
import 'package:new_quiz/UI/views/college%20details/college_details.dart';
import 'package:new_quiz/UI/views/login_view/login_view.dart';
import 'package:new_quiz/UI/views/main_view/main_view_widget/botton_navigation_widget.dart';
import 'package:new_quiz/core/enums/colleges.dart';


import '../../../../core/utilies/general_utilies.dart';
import '../../../shared/utilis.dart';
import '../main_view_widget/custom_appBar.dart';
class homView extends StatefulWidget {
  const homView({Key? key}) : super(key: key);

  @override
  _homViewState createState() => _homViewState();
}
TextEditingController controller=TextEditingController();
COLLEGES colleges=COLLEGES.ALL;
bool isVisible=false;
List<coll> col=[];
class _homViewState extends State<homView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar( text: 'الرئيسية',icon:SvgPicture.asset('images/ic_home.svg'), height: screenWidth(3.2) ,),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth(17)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              customTextField(hintTExt: "بحث", controller: controller,prefixIcon: Icons.search,colorText: AppColors.TextFielColor,colorfield: AppColors.fieldColor,),
              SvgPicture.asset('images/ad-section.svg'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(35)),
                child: Text("التصنيفات",style: TextStyle(fontSize: screenWidth(20)),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navItems(isslected: colleges==COLLEGES.ALL, ontap: (){setState(() {
                    setState(() {
                      colleges=COLLEGES.ALL;
                      col.clear();
                      col=[
                      coll(name: "الطب البشري", loc: "1"),
                      coll(name: "الصيدلة", loc: "1"),
                      coll(name: "اتمريض", loc: "1"),
                      coll(name: "الهندسة المعلوماتية", loc: "1"),
                      coll(name: "الهندسة المعلوماتية", loc: "1"),
                      ];
                    });
                  });},text: "الكل",),
                  navItems(isslected: colleges==COLLEGES.ENGINEERING, ontap: (){
                    setState(() {
                      colleges=COLLEGES.ENGINEERING;
                      col.clear();
             col=[  coll(name: "الهندسة المعلوماتية", loc: "1"),
                      coll(name: "الهندسة المعلوماتية", loc: "1"),
                      ]       ;

                    });
                  },text: "الكليات الهندسية"),
                  navItems(isslected: colleges==COLLEGES.MEDICINE, ontap: (){setState(() {
                    colleges=COLLEGES.MEDICINE;
                    col.clear();
                    col=[
                    coll(name: "الطب البشري", loc: "1"),
                    coll(name: "الصيدلة", loc: "1"),
                    coll(name: "اتمريض", loc: "1"),
                    ];

                    //isVisible=true;
                  });},text: "الكليات الطبية"),
                ],
              ),
     
     SizedBox(height: screenWidth(40),),

     Expanded(
           child: GridView.builder(itemCount: col.length,
               //scrollDirection: Axis.horizontal,
               shrinkWrap: true,
               itemBuilder: (BuildContext context, int index){
             return InkWell(
               onTap:(){
                 storage.getUser()==""?showDialog(builder: (BuildContext context) {
                   return Dialog(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                       child:Container(
                         height: screenWidth(1),
                         child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                       SvgPicture.asset("images/key.svg"),
                         Text("يرجى الإشتراك لإتمام عملية التصفح"),
                           customButton(text: "تسجيل الدخول",onPressed:(){Get.to(loginView(name: ""));} ),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text("ليس لديك حساب ؟"),
                             Text("أنشأ حسابك الان",style: TextStyle(color: AppColors.darkPurbleColor),),
                           ],
                         )


                         ],
                       ),)

                   );
                 }, context: context

                 ):
                     Get.to(collegeDetails(collegeName: col[index].name));
               },
               child: Column(
                 children: [
                   Text(col[index].name),
                   Text(col[index].loc),

                 ],
               ),
             );
               }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
           ),
         )

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
         Text(text,style: TextStyle(color:isslected? AppColors.blueColor:Colors.black),),
          SizedBox(
            height: screenWidth(50),
          ),
          isslected
              ?
          Container(
              height: screenWidth(200),
              width: screenWidth(6), // تعديل ارتفاع الخط حسب الحاجة
              color:AppColors.blueColor// تحديد لون الخط بناءً على isSelected
          ):
          Container()
        ],
      ),
    );
  }
}

class coll{
  String name;
  String loc;

  coll({required this.name,required this.loc});
}