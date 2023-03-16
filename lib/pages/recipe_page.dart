import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // 보통 16으로 많이 준다
        child: ListView(
          // column의 기본 정렬 - 중앙, row의 기본 정렬 - 좌측, Listview 기본 정렬 - 좌측
          children: [
            _title("Recipes"),
            _menus(),
            _listItem("Made Coffee", "coffee"),
            _listItem("Made Burger", "burger"),
            _listItem("Made Pizze", "pizza")
            // method는 카멜표기법
          ],
        ),
      ),
    );
  }

  Widget _listItem(String text, String imgName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        AspectRatio(
          aspectRatio: 2 / 1,
          child : ClipRRect(
              borderRadius: BorderRadius.circular(20),
          child: Image.asset(
              "assets/images/$imgName.jpeg",
              fit: BoxFit.cover)
          )
        ),
        SizedBox(height: 10),
        Text(text, style: TextStyle(fontSize: 20)),
        Text(
            "Have you ever made your own $text? Once you've tried a homemade $text, you'll never go back.",
            style: TextStyle(color: Colors.grey, fontSize: 12)),
      ]),
    );
  }

  Widget _title(String text, {double tp = 20.0}) {
    return Padding(
      padding: EdgeInsets.only(top: tp),
      // 동적인 값은 const 붙이면 안 됨, const는 메모리에 한 번만 띄워짐
      child: Text(text, style: TextStyle(fontSize: 30)),
    );
  }

  Widget _menus() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          _menu("All", Icons.food_bank),
          SizedBox(width: 25),
          _menu("Coffee", Icons.emoji_food_beverage),
          SizedBox(width: 25),
          _menu("Burger", Icons.fastfood),
          SizedBox(width: 25),
          _menu("Pizza", Icons.local_pizza),
          SizedBox(width: 25),
        ],
      ),
    );
  }

  Widget _menu(String text, IconData mIcon) {
    //Container  = stateless의 자식, stateless는 widget의 자식, 그러니 웬만하면 container는 widget으로 바꾸어 주기
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // = flex와 같은 것
        children: [
          Icon(mIcon, color: Colors.red, size: 30
            ,),
          Text(text, style: TextStyle(color: Colors.black87),),
        ],
      ),
    );
  }

  // 언더 스코어 = private

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(CupertinoIcons.search),
          color: Colors.black,
          onPressed: () {
            print("클릭");
          },
        ),
        Icon(CupertinoIcons.heart, color: Colors.redAccent),
        SizedBox(width: 15),
      ],
    );
  }
}
