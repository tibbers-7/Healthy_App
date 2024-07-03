import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  ReadMoreText({required this.text, this.maxLines = 5});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final span = TextSpan(text: widget.text, style: const TextStyle(fontSize: 15, color: Color.fromARGB(81, 0, 0, 0)));
    final tp = TextPainter(
      text: span,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );

    tp.layout(maxWidth: MediaQuery.of(context).size.width - 60); // Adjust based on your padding/margin

    if (tp.didExceedMaxLines && !isExpanded) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: tp.text!.toPlainText().substring(0, tp.getOffsetBefore(tp.getPositionForOffset(Offset(tp.width - 40, tp.height)).offset)!) ,
              style: const TextStyle(
                fontFamily: 'Poppins', 
                fontSize: 14, 
                color: Color.fromARGB(81, 0, 0, 0),
                height: 1.5, 
                letterSpacing: 0.8,
              ),
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = true;
                      });
                    },
                    child: const Text(
                      'Read More...',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.text, style: const TextStyle(
            fontFamily: 'Poppins', 
            fontSize: 14, 
            color: Color.fromARGB(81, 0, 0, 0),
            height: 1.5, 
            letterSpacing: 0.8,
            )),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = false;
              });
            },
            child: const Text(
              'Read Less',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      );
    }
  }
}