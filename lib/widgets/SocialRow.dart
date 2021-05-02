import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    return Center(
      child: Container(
        height: 75,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 5, top: 10, bottom: 10, right: 5),
          scrollDirection: Axis.horizontal,
          children: [
            RawMaterialButton(
              constraints: BoxConstraints(minWidth: 0),
              padding: EdgeInsets.only(left: 5, right: 5),
              //constraints: BoxConstraints(minWidth: 0),
              onPressed: () {},
              shape: CircleBorder(),
              child: CircleAvatar(
                minRadius: 28,
                backgroundImage: AssetImage('assets/images/Facebook_icon.png'),
              ),
            ),
            RawMaterialButton(
              padding: EdgeInsets.only(left: 5, right: 5),
              constraints: BoxConstraints(minWidth: 0),
              onPressed: () {},
              shape: CircleBorder(),
              child: CircleAvatar(
                minRadius: 28,
                backgroundImage: AssetImage('assets/images/Twitter_icon.png'),
              ),
            ),
            RawMaterialButton(
              padding: EdgeInsets.only(left: 5, right: 5),
              constraints: BoxConstraints(minWidth: 0),
              onPressed: () {},
              shape: CircleBorder(),
              child: CircleAvatar(
                minRadius: 28,
                backgroundImage: AssetImage('assets/images/Google_icon.png'),
              ),
            ),
            RawMaterialButton(
              padding: EdgeInsets.only(left: 5, right: 5),
              constraints: BoxConstraints(minWidth: 0),
              onPressed: () {},
              shape: CircleBorder(),
              child: CircleAvatar(
                minRadius: 28,
                backgroundImage: AssetImage('assets/images/Apple_icon.png'),
              ),
            ),
            RawMaterialButton(
              padding: EdgeInsets.only(left: 5, right: 5),
              constraints: BoxConstraints(minWidth: 0),
              onPressed: () {},
              shape: CircleBorder(),
              child: CircleAvatar(
                minRadius: 28,
                backgroundImage: AssetImage('assets/images/Github_icon.png'),
              ),
            ),
            /*RawMaterialButton(
              padding: EdgeInsets.only(left: 5, right: 5),
              constraints: BoxConstraints(minWidth: 0),
              onPressed: () {},
              shape: CircleBorder(),
              child: CircleAvatar(
                minRadius: 28,
                backgroundImage: AssetImage('assets/images/Facebook_icon.png'),
              ),
            ),
            RawMaterialButton(
              padding: EdgeInsets.only(left: 5, right: 5),
              constraints: BoxConstraints(minWidth: 0),
              onPressed: () {},
              shape: CircleBorder(),
              child: CircleAvatar(
                minRadius: 28,
                backgroundImage: AssetImage('assets/images/Facebook_icon.png'),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
