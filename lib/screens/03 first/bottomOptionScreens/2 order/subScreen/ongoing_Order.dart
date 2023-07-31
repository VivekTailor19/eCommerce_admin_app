import 'package:flutter/material.dart';

import '../orderScreen.dart';


Widget OngoingScreen()
{
  return Column(
    children: [
      OrderTile(),
      OrderTile(),
      OrderTile(),
    ],
  );
}