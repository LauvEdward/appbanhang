import 'package:appbanhang/model/provice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:get/get.dart';

class ListProvice extends StatelessWidget {
  final List<Provice> provice;

  ListProvice({Key? key, required this.provice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (provice.length > 0) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Create Account"),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              // runSpacing: 1,
              children: provice
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // color: Colors.black38,
                              border:
                                  Border.all(color: Colors.grey, width: 0.2),
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                            child: Text(
                              e.name ?? "",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
