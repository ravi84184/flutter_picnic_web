import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_picnic_web/utility/app_assets.dart';
import 'package:flutter_picnic_web/utility/app_colors.dart';
import 'package:flutter_picnic_web/utility/app_string.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              AppAssets.bg,
              fit: BoxFit.cover,
            ).image,
          ),
        ),
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.white24,
                blurRadius: 5.0,
                offset: new Offset(5.0, 5.0),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: -100,
                right: 120,
                child: Image.asset(AppAssets.headphone),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header part
                  _headerWidget(),

                  /// body part
                  Flexible(child: _bodyWidget()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LOGO
          _logoWidget(),

          /// Navigation Menu
          _menuWidget(),

          /// Button
          _btnWidget(),
        ],
      ),
    );
  }

  Widget _logoWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssets.logo,
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Picnic",
          style: TextStyle(fontFamily: AppString.fontBold, fontSize: 30),
        ),
      ],
    );
  }

  Widget _menuWidget() {
    return Container(
      child: Row(
        children: [
          _menuItemWidget(text: "Home"),
          _menuItemWidget(text: "About"),
          _menuItemWidget(text: "Blog"),
          _menuItemWidget(text: "Contact us"),
        ],
      ),
    );
  }

  _menuItemWidget({String text}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: TextStyle(fontSize: 24, fontFamily: AppString.fontLight),
      ),
    );
  }

  Widget _btnWidget() {
    return Container(
      child: RaisedButton(
        child: Text(
          "Get a Quote",
          style: TextStyle(fontSize: 18, fontFamily: AppString.fontMedium),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textColor: AppColors.white,
        color: AppColors.btnColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
      ),
    );
  }

  Widget _bodyWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _mainContainWidget()),
          _bottomListWidget(),
        ],
      ),
    );
  }

  Widget _mainContainWidget() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Enjoy the\ntime together",
                  style: TextStyle(
                    fontSize: 55,
                    fontFamily: AppString.fontBold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "650+ Travel Agents serving 1258+ Destinations worldwide",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppString.fontLight,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: AppColors.btnColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Watch Video",
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppString.fontMedium,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColors.btnColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset(AppAssets.group))
        ],
      ),
    );
  }

  Widget _bottomListWidget() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listTile(text: "Camp Fire", image: AppAssets.campFire, isLike: true),
          // _listTile(text: "DJ Night", image: AppAssets.djNight),
          _listTile(text: "Photography", image: AppAssets.photography),
          _listTile(text: "Competitions", image: AppAssets.competitions),
        ],
      ),
    );
  }

  Widget _listTile({String text, String image, bool isLike = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Stack(
        children: [
          // Like/dislike icon
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                color: Colors.white.withOpacity(0.5),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.white24,
                    blurRadius: 5.0,
                    offset: new Offset(5.0, 5.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    image,
                    height: 150,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  Text(text),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              alignment: Alignment.topRight,
              child: Image.asset(
                isLike ? AppAssets.likeIcon : AppAssets.disLikeIcon,
                height: isLike ? 40 : 20,
                width: isLike ? 40 : 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
