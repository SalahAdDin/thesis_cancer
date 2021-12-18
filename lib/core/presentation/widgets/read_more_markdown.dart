import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class ReadMoreMarkdown extends StatefulWidget {
  const ReadMoreMarkdown({
    Key? key,
    this.trimLength = 240,
    required this.data,
    this.trimExpandedText = 'show less',
    this.trimCollapsedText = 'read more',
  }) : super(key: key);

  /// Used on TrimMode.Length
  final int trimLength;

  final String trimExpandedText;
  final String trimCollapsedText;

  final String data;

  @override
  _ReadMoreMarkdownState createState() => _ReadMoreMarkdownState();
}

class _ReadMoreMarkdownState extends State<ReadMoreMarkdown> {
  bool showMore = false;

  Future<void> _launchURL(String url) async =>
      await canLaunch(url) ? launch(url) : throw 'Could not launch $url';

  void _onClickShowMore() {
    setState(() {
      showMore = !showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MarkdownBody(
          data: showMore
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
        Positioned(
          right: 0.0,
          bottom: -17.5,
          child: TextButton(
            onPressed: _onClickShowMore,
            child: Text(
              showMore ? widget.trimExpandedText : widget.trimCollapsedText,
            ),
          ),
        )
      ],
    );
  }
}
