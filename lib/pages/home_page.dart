// ignore_for_file: prefer_const_constructors

import 'package:carvaan/model/radio.dart';
import 'package:carvaan/utils/ai_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MyRadio> radios;
  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString('assets/radio.json');
    radios = MyRadioList.fromJson(radioJson).radios;
    print(radios);
    setState(() {
      
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(LinearGradient(
                colors: [AIUtil.primaryColor1, AIUtil.primaryColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ))
              .make(),
          AppBar(
            title: "Carvaan".text.xl4.bold.white.make().shimmer(
                primaryColor: Vx.pink300, secondaryColor: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100).p16(),
          VxSwiper.builder(
            itemCount: radios.length,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
            itemBuilder: (context, index) {
              final rad = radios[index];
              return VxBox(
                      child: ZStack([
                        Positioned(top: 0.0,
                        right: 0.0,
                        child:VxBox(child:rad.category.text.uppercase.white.make().px16(),
                       
                        ).height(40).black.alignCenter.withRounded(value:10.0).make(),
                        ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: VStack([

                    rad.name.text.xl2.white.bold.make().shimmer(
                        primaryColor: Vx.pink300, secondaryColor: Colors.white),
                    rad.tagline.text.sm.white.make().shimmer(
                        primaryColor: Vx.green300,
                        secondaryColor: Colors.white),
                  ]).p16(),
                ),
                Align(
                  alignment: Alignment.center,
                  child: [
                    Icon(
                      CupertinoIcons.play_circle,
                      color: Colors.white,
                    ),10.heightBox
                  ].vStack(),
                )
              ])).clip(Clip.antiAlias)
                  .bgImage(
                    DecorationImage(
                        image: NetworkImage(rad.image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken)),
                  )
                  .border(color: Colors.black, width: 5.0)
                  .withRounded(value: 60.0)
                  .make()
                  .onInkDoubleTap(() {
                    print("double tapped");
                  })
                  .p16();
                  
            },
          ).centered(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Icon(CupertinoIcons.stop_circle, color: Colors.white,
            size:50.0,),

          ).pOnly(bottom: context.percentHeight * 12)
        ],
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
