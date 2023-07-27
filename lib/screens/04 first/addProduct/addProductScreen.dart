import 'package:ecommerce_app/model/productModel.dart';
import 'package:ecommerce_app/screens/04%20first/addProduct/addImageController.dart';
import 'package:ecommerce_app/utils/firebase_helper.dart';
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
        appBar: AppBar(
          title: Text("Add Product"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Obx(
                      () => Container(
                        height: 15.h,
                        width: 15.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),
                        image: i_control.isAdded.value
                            ?  DecorationImage(image: NetworkImage("${timgLink.text}"),fit: BoxFit.fill)
                            :  DecorationImage(image: AssetImage("assets/images/add/picture.png"),fit: BoxFit.fill),
                        ),
                      )
                    ),
                    SizedBox(width:10.w),

                    TextButton(child:Text("Add Image"),onPressed: () {
                      Get.defaultDialog(
                          title: "Add Image",
                          content: Column(
                            children: [
                              TextField(
                                style: TextStyle(
                                    color: Color(0xff0A1172), fontSize: 16),
                                keyboardType: TextInputType.url,
                                controller: timgLink,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    label: Text(
                                      "Image Url",
                                      style: TextStyle(color: Color(0xff0A1172)),
                                    ),
                                    hintText: "Enter Image Url here...",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff0A1172), width: 1.3),
                                        borderRadius: BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0x550A1172), width: 1.3),
                                        borderRadius: BorderRadius.circular(10)),
                                    enabled: true),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          i_control.isAdded.value = true;

                                          print("img url link add is ==>>   ${timgLink.text}");

                                          Get.back();
                                        },
                                        child: Text(
                                          "Done",
                                          style: TextStyle(color: Colors.blue),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ));
                    },),
                  ],
                ),
                SizedBox(height: 2.h),
                CustomTextField(controller: tname, hint: "Name", kboard: TextInputType.text),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    style: TextStyle(color: Color(0xff0A1172), fontSize: 16),
                    keyboardType: TextInputType.streetAddress,
                    controller: tdesc,
                    maxLines: 3,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: Text(
                          "Description",
                          style: TextStyle(color: Color(0xff0A1172)),
                        ),
                        hintText: "Enter Description here...",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff0A1172), width: 1.3),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0x550A1172), width: 1.3),
                            borderRadius: BorderRadius.circular(10)),
                        enabled: true),
                  ),
                ),
                CustomTextField(controller: tprice, hint: "Price", kboard: TextInputType.number),
                SizedBox(height: 10.h),

                GestureDetector(
                  onTap: () {
                    ProductModel model = ProductModel(
                      name: tname.text,
                      category: "Clothes",
                      fav: false,
                      img: timgLink.text,
                      desc: tdesc.text,
                      price: int.parse(tprice.text),
                    );

                    FirebaseHelper.firebaseHelper.addProductInFireStore(model);

                    tname.clear();
                    tdesc.clear();
                    timgLink.clear();
                    tprice.clear();

                    Get.back();

                    print("product is add in fire cloud store");

                    Get.snackbar('Product Added', "Your Product is added in The Firebase CloudStore",
                        snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 2));

                  },
                  child: Container(height: 7.h,width: 70.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.5.h),
                    color: Colors.black),
                    alignment: Alignment.center,

                    child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w400),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CustomTextField({controller, hint, kboard}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: TextField(
        style: TextStyle(color: Color(0xff0A1172), fontSize: 16),
        keyboardType: kboard,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text(
              "$hint",
              style: TextStyle(color: Color(0xff0A1172)),
            ),
            hintText: "Enter $hint here...",
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0A1172), width: 1.3),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x550A1172), width: 1.3),
                borderRadius: BorderRadius.circular(10)),
            enabled: true),
      ),
    );
  }
}

//    https://cdn-icons-png.flaticon.com/512/5511/5511396.png
