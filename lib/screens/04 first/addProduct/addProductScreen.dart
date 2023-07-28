import 'package:ecommerce_app/model/productModel.dart';
import 'package:ecommerce_app/screens/04%20first/productController.dart';
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

  String id = "" ;

  ProductController p_control = Get.put(ProductController());

  Map mapData = {};
  ProductModel productModel = ProductModel();
  @override
  void initState() {
    super.initState();

    mapData = Get.arguments;

    if(mapData['status'] == 'update')
    {
      productModel = mapData['model'];
      tname = TextEditingController(text: productModel.name);
      tprice = TextEditingController(text: "${productModel.price}");
      tdesc = TextEditingController(text: productModel.desc);
      timgLink = TextEditingController(text: productModel.img);
      p_control.selCategory.value = productModel.category!;
      p_control.isAdded.value = true;
      id = productModel.uId!;
    }
    else
      {
        p_control.isAdded.value = false;
        p_control.selCategory.value = "";
      }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.arrow_back_rounded,size: 25.sp,),
            onPressed: () {
              p_control.isAdded.value = false;
              Get.back();
              },

          ),
          title: Text(mapData['status'] == 'update' ? "Update Product" : "Add Product"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,

          actions: [
            Visibility(
              visible: mapData['status'] == 'update' ? true : false,
              child: IconButton(onPressed: () {
                FirebaseHelper.firebaseHelper.deleteProductItem(productModel);
                p_control.selCategory.value = "";
                Get.back();
              }, icon: Icon(Icons.delete_rounded,size: 20.sp,color: Colors.white,)),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Obx(
                            () =>
                            Container(
                              height: 15.h,
                              width: 15.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.w),
                                image: p_control.isAdded.value
                                    ? DecorationImage(
                                    image: NetworkImage("${timgLink.text}"),
                                    fit: BoxFit.fill)
                                    : DecorationImage(image: AssetImage(
                                    "assets/images/add/picture.png"),
                                    fit: BoxFit.fill),
                              ),
                            )
                    ),
                    SizedBox(width: 10.w),

                    TextButton(child: Text("Add Image",style: TextStyle(color:Colors.blueAccent),), onPressed: () {
                      Get.defaultDialog(
                          title: "Add Image",
                          content: Column(
                            children: [
                              TextField(
                                style: TextStyle(
                                    color: Color(0xff1B1212), fontSize: 16),
                                keyboardType: TextInputType.url,
                                controller: timgLink,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    label: Text(
                                      "Image Url",
                                      style: TextStyle(
                                          color: Color(0xff1B1212)),
                                    ),
                                    hintText: "Enter Image Url here...",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1B1212),
                                            width: 1.3),
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0x331B1212),
                                            width: 1.3),
                                        borderRadius: BorderRadius.circular(
                                            10)),
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
                                          if(timgLink.text.isEmpty == false)
                                            {
                                              p_control.isAdded.value = true;
                                            }
                                          print(
                                              "img url link add is ==>>   ${timgLink
                                                  .text}");

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
                mapData['status'] == 'update'
                    ? Container()
                    :  Obx(
                      () =>
                      Container(
                        height: 8.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w),
                            border: Border.all(color: Color(0x331B1212))),
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(5.w),
                          hint: Text("Select Category",style: TextStyle(color: Color(0xff1B1212))),
                          isExpanded: true,
                          icon: Icon(Icons.expand_more_rounded),
                          underline: Container(),
                          value: p_control.selCategory.value.isEmpty
                              ? null
                              : p_control.selCategory.value,
                          items: p_control.categoryList
                              .map((e) =>
                              DropdownMenuItem(
                                  value: e,
                                  child: Text("$e",style: TextStyle(color: Color(0xff1B1212)),),
                                  alignment: Alignment.centerLeft))
                              .toList(),
                          onChanged: (value) {
                            p_control.selCategory.value = value as String;
                          },
                        ),
                      ),
                ),
                SizedBox(height: 2.h,),

                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    style: TextStyle(color: Color(0xff1B1212), fontSize: 16),
                    keyboardType: TextInputType.streetAddress,
                    controller: tdesc,
                    maxLines: 3,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),

                        alignLabelWithHint: true,
                        labelText: "Description",
                        labelStyle: TextStyle(color: Color(0xff1B1212),),

                        hintText: "Enter Description here...",

                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xff1B1212), width: 1.3),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0x331B1212), width: 1.3),
                            borderRadius: BorderRadius.circular(10)),
                        enabled: true),
                  ),
                ),
                CustomTextField(controller: tprice,
                    hint: "Price",
                    kboard: TextInputType.number),
                SizedBox(height: 10.h),

                GestureDetector(
                  onTap: () {

                    ProductModel model = ProductModel(
                      name: tname.text,
                      category: p_control.selCategory.value,
                      fav: false,
                      img: timgLink.text,
                      desc: tdesc.text,
                      price: int.parse(tprice.text),
                      uId: id,
                    );

                    mapData['status'] == 'update'
                        ? FirebaseHelper.firebaseHelper.updateProductInFireStore(model)
                        : FirebaseHelper.firebaseHelper.addProductInFireStore(model);


                    tname.clear();
                    tdesc.clear();
                    timgLink.clear();
                    tprice.clear();
                    p_control.isAdded.value = false;
                    p_control.selCategory.value = "";

                    Get.back();

                    print("product is add in fire cloud store");

                    Get.snackbar(
                        mapData['status'] == 'update'? 'Update' :'Product Added',

                        mapData['status'] == 'update'
                            ? "Your Product is updated in The Firebase CloudStore"
                            : "Your Product is added in The Firebase CloudStore",
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 2));
                  },
                  child: Container(
                    height: 7.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.5.h),
                        color: Colors.black),
                    alignment: Alignment.center,

                    child: Text(mapData['status'] == 'update' ? "Update" : "Add", style: TextStyle(color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),),
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
        style: TextStyle(color: Color(0xff1B1212), fontSize: 16),
        keyboardType: kboard,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text(
              "$hint",
              style: TextStyle(color: Color(0xff1B1212)),
            ),
            hintText: "Enter $hint here...",
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff1B1212), width: 1.3),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x331B1212), width: 1.3),
                borderRadius: BorderRadius.circular(10)),
            enabled: true),
      ),
    );
  }
}

//    https://cdn-icons-png.flaticon.com/512/5511/5511396.png
