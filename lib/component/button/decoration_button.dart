import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class DecorationButton extends StatelessWidget {
  Color color;
  String title;
  Widget child;

  DecorationButton(
      {required this.color, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    color.withOpacity(0.5),
                    color,
                  ],
                  stops: [
                    0.0,
                    1.0
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  tileMode: TileMode.repeated),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child,
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        AutoSizeText(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 12, height: 1),
          maxLines: 2,
        ),
      ],
    );
  }
}
