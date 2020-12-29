import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/common/navigation_path.dart';

class UIHomeScreen extends StatelessWidget {
  Widget _buildAppButton({@required String title, @required Function onClick}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FlatButton(
          color: Colors.deepOrangeAccent,
          onPressed: onClick,
          child: Text(title),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter UIs Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _buildAppButton(
            title: 'Dark Microphone App',
            onClick: () {
              Navigator.of(context).pushNamed(NavigationPath.homeScreen);
            },
          ),
          _buildAppButton(
            title: 'Champing App',
            onClick: () {
              Navigator.of(context).pushNamed(NavigationPath.chWelcomeScreen);
            },
          ),
          _buildAppButton(
            title: 'Covid-19 Tracker App',
            onClick: () {
              Navigator.of(context).pushNamed(NavigationPath.covidHomePage);
            },
          ),
          _buildAppButton(
            title: 'Furniture App',
            onClick: () {
              Navigator.of(context).pushNamed(NavigationPath.furHomeScreen);
            },
          ),
          _buildAppButton(
            title: 'Interior Design App',
            onClick: () {
              Navigator.of(context).pushNamed(NavigationPath.interiorHomePage);
            },
          ),
          _buildAppButton(
            title: 'Pet App',
            onClick: () {
              Navigator.of(context).pushNamed(NavigationPath.petHomeScreen);
            },
          ),
        ],
      ),
    );
  }
}
