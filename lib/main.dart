import 'package:flutter/material.dart';

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: buildAppBar(),
      body: buildSafeArea(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      fixedColor: Colors.white,
      backgroundColor: Colors.grey,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedindex,
      onTap: (value){
        setState(() {
          _selectedindex = value ;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Shop",),
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "search"),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "message",),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "me"),

      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: (){} ,
          icon: const Icon(Icons.menu , color: Colors.black,),
      ),
    );
  }

  SafeArea buildSafeArea() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Find your",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text("Inspiration" ,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color:  Colors.grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search,color: Colors.white,),
                                hintText: "search you are looking for",
                                hintStyle: TextStyle(color: Colors.white, fontSize: 14)
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,)
                      ],
                    )
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("promo Today", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      const SizedBox(height: 15,),
                      SizedBox(
                        height: 160,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            promoCard("assets/images/one.jpeg",),
                            promoCard("assets/images/two.jpeg"),
                            promoCard("assets/images/three.jpeg"),
                            promoCard("assets/images/four.jpeg"),
                            promoCard("assets/images/five.jpeg"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/three.jpeg"),
                              )
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                      Colors.black.withOpacity(0.9),
                                      Colors.black.withOpacity(0.4),
                                      Colors.black.withOpacity(0.1)
                                    ]
                                )
                            ),
                            child: const Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text("best design", style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white
                                ),),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


  Widget promoCard(image) {
    return AspectRatio(
        aspectRatio: 3 / 2.3 ,
            child: Container(
              margin: const EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
        color: Colors.orange,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image)
          ),
    ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0),
                        ]
                    )
                ),
              )
    ),
    );
  }


