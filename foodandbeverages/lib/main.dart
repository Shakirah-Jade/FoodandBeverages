import 'package:flutter/material.dart';

void main() => runApp(FoodandBeverages());

class FoodandBeverages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 'Burger';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 400.0,
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent])
                      .createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/town2.jpg',
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'JAPAN',
                  style: TextStyle(
                      fontSize: 85.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.25),
                      letterSpacing: 10.0),
                ),
              ),
              Positioned(
                  top: 4.0,
                  right: 7.0,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Center(
                      child: Icon(Icons.menu),
                    ),
                  )),
              Positioned(
                  top: 2.0,
                  right: 6.0,
                  child: Container(
                    height: 12.0,
                    width: 12.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Color(0xFFFD3664)),
                  )),
              Positioned(
                  top: 200.0,
                  left: 40.0,
                  child: Column(
                    children: [
                      Text(
                        'WELCOME TO',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 32.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  )),
              Positioned(
                  top: 235.0,
                  left: 40.0,
                  child: Row(
                    children: [
                      Text(
                        'TOKYO',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFD3664)),
                      ),
                      Text(
                        ',',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'JAPAN',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
              Positioned(
                  top: 320.0,
                  left: 25.0,
                  right: 25.0,
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF262626),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lets explore some food here...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                          ),
                          contentPadding: EdgeInsets.only(top: 10.0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildmenuitem('Burger', Icons.fastfood),
              _buildmenuitem('Tea', Icons.local_drink),
              _buildmenuitem('Beer', Icons.local_drink_sharp),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildmenuitem('Cake', Icons.cake),
              _buildmenuitem('Coffee', Icons.coffee),
              _buildmenuitem('Meat', Icons.food_bank),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildmenuitem('Ice', Icons.ice_skating),
              _buildmenuitem('Fish', Icons.fit_screen),
              _buildmenuitem('Donuts', Icons.circle),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildmenuitem('Cake', Icons.cake),
              _buildmenuitem('Coffee', Icons.coffee),
              _buildmenuitem('Meat', Icons.food_bank),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildmenuitem(String name, IconData) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        selectedmenuoption(name);
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        height: selected == name ? 100.0 : 75.0,
        width: selected == name ? 100.0 : 75.0,
        color: selected == name ? Color(0xFFFD3566) : Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              IconData,
              color: selected == name ? Colors.white : Colors.grey,
              size: 45.0,
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              name,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: selected == name ? Colors.white : Colors.grey,
                  fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }

  selectedmenuoption(String name) {
    setState(() {
      selected = name;
    });
  }
}
