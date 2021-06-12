import 'package:albumapp/Data/Remote/RemoteRepository/RemoteRepository.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatefulWidget {
  SpalshScreen({Key key}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
          future: getData(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Container(
                    child: Center(
                      child: Image.asset("assets/icon.png"),
                    ),
                  )
                : snapshot.hasError
                    ? Center(
                        child:
                            Text("Can not connect to server. Please try again"),
                      )
                    : Container();
          }),
    );
  }

  getData() async {
    var a = await Future.wait(
      [
        RemoteRepository().getAlbums(),
        RemoteRepository().getPhotos(),
      ],
    );
    return a[0];
  }
}
