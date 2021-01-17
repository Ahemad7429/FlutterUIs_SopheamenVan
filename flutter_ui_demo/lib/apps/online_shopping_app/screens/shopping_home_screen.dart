import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/online_shopping_app/constant/data_json.dart';
import 'package:flutter_ui_demo/apps/online_shopping_app/screens/product_detail_screen.dart';
import 'package:flutter_ui_demo/apps/online_shopping_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class ShoppingHomeScreen extends StatefulWidget {
  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen> {
  int activeMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        children: [
          _buildNavigationBar(),
          SizedBox(height: 20),
          _buildListHeaderView(),
          SizedBox(height: 30),
          _buildItemCards(),
        ],
      ),
    );
  }

  Widget _buildItemCards() {
    final size = MediaQuery.of(context).size;
    return Wrap(
      children: List.generate(
        dataItems.length,
        (index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(
                          id: dataItems[index]['id'].toString(),
                          name: dataItems[index]['name'],
                          code: dataItems[index]['code'],
                          img: dataItems[index]['img'],
                          price: dataItems[index]['price'].toString(),
                          promotionPrice:
                              dataItems[index]['promotionPrice'].toString(),
                          size: dataItems[index]['size'],
                          color: dataItems[index]['color'],
                        )));
          },
          child: Card(
            elevation: 2,
            child: Column(
              children: [
                Hero(
                  tag: dataItems[index]['id'].toString(),
                  child: Container(
                    height: (size.width - 16) / 2,
                    width: (size.width - 16) / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          dataItems[index]['img'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    dataItems[index]['code'],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    dataItems[index]['price'].toString() + " USD",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ).toList(),
    );
  }

  Widget _buildListHeaderView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
            children: List.generate(
          menuItems.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  activeMenuIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: index == activeMenuIndex
                            ? primary
                            : Colors.transparent,
                        width: 2.0),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  menuItems[index],
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ),
        ).toList()),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Online Shopping',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Icon(LineIcons.search),
              SizedBox(width: 15),
              Icon(LineIcons.shopping_cart),
            ],
          )
        ],
      ),
    );
  }
}
