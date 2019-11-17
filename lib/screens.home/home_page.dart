import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './counter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import '../model/counter.dart';
import 'package:provider/provider.dart';
import './feed_page.dart';
import './favorite_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  int pageIndex = 0;
  File _image;

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                _getImage();
              },
              child: CircleAvatar(
                backgroundImage: _image == null
                    ? NetworkImage(
                        'https://justice.org.au/wp-content/uploads/2017/08/avatar-icon.png')
                    : FileImage(_image),
              ),
            )
          ],
          leading: Text('Counter: ${counterModel.getCounter()}'),
        ),
        body: pageIndex == 0 ? FeedPage() : FavoritePage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CounterPage()))
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.assistant),
              title: Text('My Feed'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              title: Text('Favorites'),
            ),
          ],
          onTap: (int index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
        ));
  }
}
