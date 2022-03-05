import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

///
class ReadMoreMarkdown extends StatefulWidget {
  // TODO: handling trim text in the best way
  // TODO: Animation at expanding/collapsing
  // TODO: Parse markdown to avoid breaking at trimming
  // Base: https://github.com/jonataslaw/readmore/blob/master/lib/readmore.dart

  ///
  const ReadMoreMarkdown({
    Key? key,
    this.trimLength = 240,
    required this.data,
    this.trimExpandedText = 'show less',
    this.trimCollapsedText = 'read more',
  }) : super(key: key);

  /// Used on TrimMode.Length
  final int trimLength;

  ///
  final String trimExpandedText;

  ///
  final String trimCollapsedText;

  ///
  final String data;

  @override
  _ReadMoreMarkdownState createState() => _ReadMoreMarkdownState();
}

class _ReadMoreMarkdownState extends State<ReadMoreMarkdown> {
  bool _readMore = false;

  Future<void> _launchURL(String url) async =>
      await canLaunch(url) ? launch(url) : throw 'Could not launch $url';

  void _onTapLink() {
    setState(() {
      _readMore = !_readMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextSpan link = TextSpan(
      text: _readMore ? widget.trimExpandedText : widget.trimCollapsedText,
      // style: _readMore ? _defaultMoreStyle : _defaultLessStyle,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    return RichText(
      textAlign: TextAlign.end,
      text: TextSpan(
        children: <InlineSpan>[
          WidgetSpan(
            child: MarkdownBody(
              data: _readMore
                  ? widget.data
                  : widget.data.substring(
                      0,
                      widget.trimLength,
                    ),
              selectable: true,
              onTapLink: (String text, String? href, String title) async {
                if (href != null) await _launchURL(href);
              },
            ),
          ),
          link,
        ],
      ),
    );
  }
}
