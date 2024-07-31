import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/DataModel.dart';
import 'Home_Screen.dart';
import 'Places_Screen.dart';

class Home_page extends StatefulWidget {
  @override
  String? imagePath;
  String? name;
  Home_page? selectedCity;
  int selectedIndex = -1;
  Home_page({this.imagePath, this.name});
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Available cities',
          style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
        titleSpacing: 20,
        actions: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
        child: ListView.separated(
          itemCount: homeDATA.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemBuilder: (BuildContext context, int index) {
            return buildCityItem(context, index);
          },
        ),
      ),
    );
  }
  GestureDetector buildCityItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Places_Page(
              placesData: homeDATA[index].place,
              placeName: homeDATA[index].name!,
                )));
      },
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: 320.0,
                height: 320.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage(homeDATA[index].image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],
          ),
          Positioned(
            left: 110,
            top: 20,
            child: Center(
              child: Text(
                homeDATA[index].name!,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
