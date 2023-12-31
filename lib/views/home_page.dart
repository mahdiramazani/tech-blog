import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/component/fake_data.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/models/data.dart';
import 'package:flutter_application_2/component/my_colors.dart';
import 'package:flutter_application_2/component/my_string.dart';
import 'package:flutter_application_2/views/profileView.dart';
import 'homeBode.dart';
import "package:get/get.dart";



class HomePage extends StatelessWidget {
  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Widget> viewList = [
      HomeBody(size: size),
      ProfileView(size: size),
    ];

    return SafeArea(
      child: Scaffold(
        //header applixation
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 243, 242, 242),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Image(
                image: AssetImage(Assets.images.icon.path),
              )),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("حساب کاربری"),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("حساب کاربری"),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("حساب کاربری"),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("حساب کاربری"),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("حساب کاربری"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 35,
                      color: Colors.black,
                    ),
                    SizedBox(
                        height: size.height / 13.6,
                        width: size.width / 3.7,
                        child: Image(
                            image: AssetImage(Assets.images.headicon.path))),
                    const Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Obx((){
          return Stack(children: [
          Center(
              child: Positioned.fill(
                  child: IndexedStack(
            index: selectedIndex.value,
            children: [
              HomeBody(size: size),
              ProfileView(size: size),
            ],
          ))),
          //button Navigation
          ButtonNavigation(
            size: size,
            changePage: (int value) {
              
                selectedIndex.value = value;
              
            },
          )
          
        ]);
        })
      ),
    );
  }
}

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({
    super.key,
    required this.size,
    required this.changePage,
  });

  final Size size;
  final Function changePage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: Container(
        height: size.height / 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient:
                LinearGradient(colors: GradinatCollors.navigatorBackground)),
        child: Container(
          height: size.height / 10,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient:
                  LinearGradient(colors: GradinatCollors.buttonNavigation)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  changePage(0);
                },
                icon: ImageIcon(AssetImage(Assets.icons.home.path)),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage(Assets.icons.write.path)),
                color: Colors.white,
              ),
              IconButton(
                  onPressed: () {
                    changePage(1);
                  },
                  icon: ImageIcon(
                    AssetImage(Assets.icons.user.path),
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
