import 'package:flutter/material.dart';

import '../orderScreen.dart';


Widget OngoingScreen()
{
  return Column(
    children: [
      OrderTile(totalBuy: 12,price: 9800,customerName: "No Bidklii",customerImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3vzbS3Zs5wKzFt_53XZRVOHaHDoNHj2H2kxUo-cf0BkenJK2WTkC4az8pbecMt7NBpwk&usqp=CAU"),
      OrderTile(totalBuy: 12,price: 9800,customerName: "Brod Menne",customerImg: "https://storage.googleapis.com/pai-images/d220f67d62ed4c258fd7dc02ee23bec9.jpeg"),
      OrderTile(totalBuy: 12,price: 9800,customerName: "Ki Workde",customerImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAZ914vyQnnQk4emGR20ngqmEB-Bu35dT70CeQfigUzvCzy0Tm70kzZ0dy2IR5IIB3t2g&usqp=CAU"),
      //OrderTile(totalBuy: 12,price: 9800,customerName: "Oody Quiii",customerImg: "https://cdn.shopify.com/s/files/1/0407/1984/3495/products/random-girl-2-ai-artwork-469_480x480.webp?v=1673939904"),
       OrderTile(totalBuy: 12,price: 9800,customerName: "Dwein Watche",customerImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmN91-wTfPxH3TNFMAjs23nH_wqi_FN48DUg&usqp=CAU"),

    ],
  );
}