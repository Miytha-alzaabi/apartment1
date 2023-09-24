import 'package:flutter/material.dart';


enum SingingCharacter { user, owner, both }

class DefaultRadioButton extends StatefulWidget {
  const DefaultRadioButton({super.key});

  @override
  State<DefaultRadioButton> createState() => _DefaultRadioButtonState();
}

class _DefaultRadioButtonState extends State<DefaultRadioButton> {

  SingingCharacter? _character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text("User"),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.user,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text("Owner"),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.owner,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text("Both"),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.both,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ]
    );
  }
}