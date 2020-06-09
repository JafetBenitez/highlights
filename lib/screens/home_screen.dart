import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:highlights/models/quote.dart';
import 'package:highlights/screens/quote_screen.dart';
import 'package:highlights/styles/custome_text_style.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quote> _quotes = [
    Quote(
        id: 1,
        image: "assets/china.jpg",
        quote:
            "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones"),
    Quote(
        id: 2,
        image: "assets/gensler.jpg",
        quote:
            "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones"),
    Quote(
        id: 3,
        image: "assets/colonial.jpg",
        quote:
            "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones"),
        Quote(
        id: 4,
        image: "assets/colonial.jpg",
        quote:
            "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones"),
      Quote(
        id: 5,
        image: "assets/colonial.jpg",
        quote:
            "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          cursorColor: Colors.white,

          style: TextStyle(
            color: Colors.white,
            
          ),
          decoration: InputDecoration(
            hintText: "search a quote",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: Icon(Icons.search)
          ),
          ),
      ),
      body: Container(

          padding: EdgeInsets.all(5),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: _quotes.length,
            itemBuilder: (BuildContext ctx, int idx) {
              return InkWell(
                  onTap: () {

                    Navigator.push(ctx, 
                      MaterialPageRoute(
                          builder: (ctx) => QouteScreen(quote: _quotes[idx])
                    ));
                  },
                  child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                        image: AssetImage(_quotes[idx].image)),
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                  padding: EdgeInsets.all(20),
                  child: 
                      Center(
                        child: Text(
                        _quotes[idx].truncatedQuote(),
                        style: CustomeTextStyle.quoteText,
                        )),
      
                ),
              );
            },
            staggeredTileBuilder: (index) =>
                new StaggeredTile.count(1, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )),
    );
  }
}
