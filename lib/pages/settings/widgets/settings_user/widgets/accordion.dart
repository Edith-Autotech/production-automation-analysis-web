import 'package:flutter/material.dart';

import '/constants/style.dart';
import '/widgets/custom_text.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String description;
  const Accordion({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          ListTile(
            title: CustomText(text: widget.title),
            trailing: IconButton(
              onPressed: () => setState(() => _showContent = !_showContent),
              icon: Icon(
                _showContent ? Icons.arrow_drop_down : Icons.arrow_drop_up,
              ),
            ),
          ),
          if (_showContent)
            Container(
              padding: EdgeInsets.symmetric(
                vertical: defaultPadding,
                horizontal: defaultPadding,
              ),
              child: CustomText(text: widget.description),
            )
          else
            Container(),
        ],
      ),
    );
  }
}
