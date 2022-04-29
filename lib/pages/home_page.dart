import 'package:carvaan/utils/ai_util.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() =>  _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(LinearGradient(
                  colors: [AIUtil.primaryColor1, AIUtil.primaryColor2]))
              .make(),
        ],
      ),
    );
  }
}