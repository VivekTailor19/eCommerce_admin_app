import 'package:ecommerce_app/screens/04%20first/addProduct/addImageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  TextEditingController tname = TextEditingController();
  TextEditingController tdesc = TextEditingController();
  TextEditingController timgLink = TextEditingController();
  TextEditingController tprice = TextEditingController();

  AddImageController i_control = Get.put(AddImageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Add Product"),centerTitle: true,elevation: 0,),

        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
          child: Column(
            children: [
              InkWell(onTap: () {
                Get.defaultDialog(
                  title: "Add Image",
                  content: Column(
                    children: [
                      TextField(
                        style: TextStyle(color: Color(0xff0A1172),fontSize: 16),
                        keyboardType: TextInputType.url,
                        controller: timgLink,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            label: Text("Image Url",style: TextStyle(color: Color(0xff0A1172)),),
                            hintText: "Enter Image Url here...",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff0A1172),width: 1.3),borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0x550A1172),width: 1.3),borderRadius: BorderRadius.circular(10)),
                            enabled: true

                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                          TextButton(onPressed: () {

                            Get.back();
                          }, child: Text("Done",style: TextStyle(color: Colors.blue),))
                        ],),
                      )
                    ],
                  )
                );
              },
                child: i_control.isAdded.value ? Image.network("${timgLink.text}",height: 10.h,width: 10.h) : Image.asset("assets/images/add/add.png",height: 10.h,width: 10.h,)),
              SizedBox(height: 2.h,),
              CustomTextField(controller: tname,hint: "Name",kboard:TextInputType.text),
              Padding(
                padding:  EdgeInsets.only(bottom:2.h),
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  style: TextStyle(color: Color(0xff0A1172),fontSize: 16),
                  keyboardType: TextInputType.streetAddress,
                  controller: tdesc,
                  maxLines: 3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      label: Text("Description",style: TextStyle(color: Color(0xff0A1172)),),
                      hintText: "Enter Description here...",
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff0A1172),width: 1.3),borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0x550A1172),width: 1.3),borderRadius: BorderRadius.circular(10)),
                      enabled: true

                  ),
                ),
              ),
              CustomTextField(controller: tprice,hint: "Price",kboard:TextInputType.number ),



            ],
          ),
        ),

      ),
    );
  }

  Widget CustomTextField({controller,hint,kboard}) {
    return Padding(
      padding:  EdgeInsets.only(bottom:2.h),
      child: TextField(
        style: TextStyle(color: Color(0xff0A1172),fontSize: 16),
        keyboardType: kboard,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text("$hint",style: TextStyle(color: Color(0xff0A1172)),),
            hintText: "Enter $hint here...",
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff0A1172),width: 1.3),borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0x550A1172),width: 1.3),borderRadius: BorderRadius.circular(10)),
            enabled: true

        ),
      ),
    );
  }

}


//    https://cdn-icons-png.flaticon.com/512/5511/5511396.png