import 'package:flutter/material.dart';
import 'package:online_store_app/tabs/home_tab.dart';
import 'package:online_store_app/tabs/products_tab.dart';
import 'package:online_store_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Products"),
            centerTitle: true,
          ),drawer: CustomDrawer(_pageController),

          body: ProductsTab(),
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.blue,
        )
      ],
    );
  }
}
