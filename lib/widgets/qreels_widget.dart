import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget footerTag() {
  return Container(
    width: 300.w,
    margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.w),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
        crossAxisSpacing: 0,mainAxisSpacing: 0,childAspectRatio: 4.0,),
      itemBuilder: (context, index) {
        return Text("#Descriptive${index+1}",style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.bold),);
      },
    ),
  );
}

Widget interactionWithUser({required IconData icons,String count="",required void Function()? function}){
  return GestureDetector(
    onTap: () => function!(),
    child: Container(
      margin: EdgeInsets.only(right: 10.w,top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons,color: Colors.white,size: 30.w,),
          Text(count,style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold),)
        ],
      ),
    ),
  );
}