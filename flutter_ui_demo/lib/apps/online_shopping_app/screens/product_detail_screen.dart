import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/online_shopping_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetailScreen extends StatefulWidget {
  final String id;
  final String name;
  final String code;
  final String img;
  final String price;
  final String promotionPrice;
  final List size;
  final List color;

  const ProductDetailScreen({
    this.id,
    this.name,
    this.code,
    this.img,
    this.price,
    this.promotionPrice,
    this.size,
    this.color,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var activeSize = 1;
  var activeColor = 1;

  String activeImage = '';

  int qty = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      activeImage = widget.img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    return Container(
      height: 80,
      width: double.infinity,
      child: FlatButton(
        color: primary,
        onPressed: () {},
        child: Text(
          'ADD TO CART',
          style: TextStyle(
            fontSize: 18,
            color: white,
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        children: [
          _buildNavigationBar(),
          SizedBox(height: 10),
          _buildImageHeader(),
          SizedBox(height: 20),
          _buildNameView(),
          SizedBox(height: 20),
          _buildCodeView(),
          SizedBox(height: 20),
          _buildPriceView(),
          SizedBox(height: 20),
          _buildSizeView(),
          SizedBox(height: 20),
          _buildColorView(),
          SizedBox(height: 20),
          _buildQuantityView(),
          SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildQuantityView() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Qty :',
            style: TextStyle(
              height: 1.5,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
              child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (qty > 1) {
                    setState(() {
                      qty = --qty;
                    });
                  }
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: black.withOpacity(0.5),
                    ),
                  ),
                  child: Icon(
                    LineIcons.minus,
                    color: black.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(width: 25),
              Text(
                qty.toString(),
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(width: 25),
              InkWell(
                onTap: () {
                  setState(() {
                    qty = ++qty;
                  });
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: black.withOpacity(0.5),
                    ),
                  ),
                  child: Icon(
                    LineIcons.plus,
                    color: black.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildColorView() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color :',
            style: TextStyle(
              height: 1.5,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
              child: Wrap(
            children: List.generate(
              widget.color.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    activeColor = widget.color[index]['id'];
                    activeImage = widget.color[index]['value'];
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: activeColor == widget.color[index]['id']
                          ? primary
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(widget.color[index]['value']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildSizeView() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size :',
            style: TextStyle(
              height: 1.5,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
              child: Wrap(
            children: List.generate(
              widget.size.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    activeSize = widget.size[index]['id'];
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: activeSize == widget.size[index]['id']
                          ? primary
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Text(
                    widget.size[index]['value'],
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildPriceView() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price :',
            style: TextStyle(
              height: 1.5,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Row(
              children: [
                Text(
                  widget.promotionPrice + ' USD',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  widget.price + ' USD',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: primary,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeView() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Code :',
            style: TextStyle(
              height: 1.5,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Text(
              widget.code,
              style: TextStyle(
                height: 1.5,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameView() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name :',
            style: TextStyle(
              height: 1.5,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Text(
              widget.name,
              style: TextStyle(
                height: 1.5,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageHeader() {
    return Card(
      elevation: 2,
      child: Hero(
        tag: widget.id,
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(activeImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
