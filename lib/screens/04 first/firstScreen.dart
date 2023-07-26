import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  int selected = 2;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: StylishBottomBar(
          items: [
            BottomBarItem(
              icon:  Icon(Icons.abc),
              title:  Text('Abc'),
              backgroundColor: Colors.red,
              selectedIcon: const Icon(Icons.read_more),
            ),BottomBarItem(
              icon:  Icon(Icons.abc),
              title:  Text('Abc'),
              backgroundColor: Colors.red,
              selectedIcon: const Icon(Icons.read_more),
            ),


            BottomBarItem(
              icon: Icon(Icons.safety_divider),
              title:  Text('Safety'),
              backgroundColor: Colors.orange,
            ),
            BottomBarItem(
              icon: Icon(Icons.safety_divider),
              title:  Text('Safety'),
              backgroundColor: Colors.orange,
            ),

          ],
          currentIndex: selected,
          onTap: (index) {
            setState(() {
              selected = index;
              controller.jumpToPage(index);
            });
          },
          option: BubbleBarOptions(
            barStyle: BubbleBarStyle.horizotnal,
            bubbleFillStyle: BubbleFillStyle.outlined,
          ),

        ),
      ),
    );
  }
}
