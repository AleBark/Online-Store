import 'package:flutter/material.dart';
import 'package:online_store_app/tabs/home_tab.dart';
import 'package:online_store_app/tabs/order_tab.dart';
import 'package:online_store_app/tabs/places_tab.dart';
import 'package:online_store_app/tabs/products_tab.dart';
import 'package:online_store_app/widgets/cart_button.dart';
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
          floatingActionButton: CartButton(),
        ),
        Scaffold(
            body: ProductsTab(),
            appBar: AppBar(
              title: Text("Products"),
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            floatingActionButton: CartButton()),
        Scaffold(
          appBar: AppBar(
            title: Text("Find a store"),
            centerTitle: true,
          ),
          body: PlacesTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("My Orders"),
            centerTitle: true,
          ),
          body: OrdersTab(),
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}
