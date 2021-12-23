import 'package:flutter/material.dart';

import '/src/models/user.dart';
import '/src/widgets/text_field/custom_text_field.dart';
import '/src/widgets/label/label.dart';
import '../../../widgets/button/submit_button.dart';

class RegisterFactoryCard extends StatefulWidget {
  final UserModel user;
  const RegisterFactoryCard({Key? key, required this.user}) : super(key: key);
  @override
  _RegisterFactoryCardState createState() => _RegisterFactoryCardState();
}

class _RegisterFactoryCardState extends State<RegisterFactoryCard> {
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final FocusNode _keyFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();

  String get keyValue => _keyController.text;
  String get name => _nameController.text;

  // void setFactory() async {
  //   final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
  //   await database.setFactory(user: widget.user, key: keyValue, name: name).catchError((error) {
  //     print(error);
  //   }).then(
  //     (value) => FlutterToast(context).showToast(
  //       child: Text("Factory added successfully!"),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400,
      child: Card(
        elevation: 8,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              label("Enter the 20 digit aplha-numeric key!"),
              CustomTextField(
                controller: _keyController,
                focusNode: _keyFocusNode,
                enabled: true,
                labelText: "20 digit key",
                onChanged: (value) => setState(() {}),
                onEditingComplete: () {},
              ),
              CustomTextField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                enabled: true,
                labelText: "Assign a name to the factory!",
                onChanged: (value) => setState(() {}),
                onEditingComplete: () {},
              ),
              SubmitButton(
                text: "Submit",
                onPressed: () {},
                color: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
