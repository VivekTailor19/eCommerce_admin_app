import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  int notificationCount = 5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding:  EdgeInsets.symmetric(vertical: 2.h),
            child: Text("Notification",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
          ),

          Expanded(
              child: ListView.builder(
              itemCount: notificationCount,
              itemBuilder: (context, index) {
                return Container(
                  height: 11.h,

                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: Colors.amberAccent,radius: 3.h,),
                          SizedBox(width: 3.w,),
                          SizedBox(width: 70.w,
                            child: Text.rich(maxLines: 3,
                              TextSpan(
                                style: TextStyle(fontSize: 18), // default text style
                                children: <TextSpan>[
                                  TextSpan(text: 'First Second ', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13.sp)),
                                  TextSpan(text: 'Third Fourth FifthThird Fourth FifthThird Fourth FifthThird Fourth FifthThird Fourth FifthThird Fourth Fifth',
                                      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11.sp)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w),
                        child: Text("2 hours ago",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 9.sp),textAlign: TextAlign.left,),
                      ),
                      index == (notificationCount-1) ? Text(""):Divider(color: Colors.black12,thickness: 0.5,)
                    ],
                  ),
                );

              },
              ),
          ),
        ],
      ),
    );
  }
}
