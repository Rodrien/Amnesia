import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            color: systemInf.colorFondoPrincipal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icon.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Contactame",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RawMaterialButton(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          constraints: BoxConstraints(minWidth: 0),
                          onPressed: () async {
                            const url = 'https://twitter.com/Rodrien98';
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                                forceSafariVC: true,
                                forceWebView: false,
                              );
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,
                            backgroundImage:
                                AssetImage('assets/images/Twitter_icon.png'),
                          ),
                        ),
                        RawMaterialButton(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          constraints: BoxConstraints(minWidth: 0),
                          onPressed: () async {
                            const url = 'https://github.com/Rodrien';
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                                forceSafariVC: true,
                                forceWebView: false,
                              );
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,
                            backgroundImage:
                                AssetImage('assets/images/Github_icon.png'),
                          ),
                        ),
                        RawMaterialButton(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          constraints: BoxConstraints(minWidth: 0),
                          onPressed: () async {
                            const url = 'https://www.instagram.com/rodrien98/';
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                                forceSafariVC: true,
                                forceWebView: false,
                              );
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,
                            backgroundImage:
                                AssetImage('assets/images/Instagram_icon.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "Creado por Enrique Rodriguez",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
