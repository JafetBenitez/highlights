import 'package:flutter/material.dart';
import 'package:highlights/models/quote.dart';
import 'package:highlights/styles/custome_text_style.dart';

class QouteScreen extends StatefulWidget {
  Quote quote;

  QouteScreen({this.quote});
  @override
  _QouteScreenState createState() => _QouteScreenState(quote: this.quote);
}

class _QouteScreenState extends State<QouteScreen> {
  Quote quote;
  _QouteScreenState({this.quote});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(actions: <Widget>[Text('Detail')],),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                  image: AssetImage(this.quote.image))),
              child: Center(child: Text(this.quote.quote, style: CustomeTextStyle.quoteText)),),

          
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.share),
        ),
      
      );
  }
}