import 'package:html/parser.dart';

extension on String {
  String parseHtmlString() {
    final document = parse(this);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
