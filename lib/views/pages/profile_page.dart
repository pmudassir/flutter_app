import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("username"),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            Text(controller.text),
            Checkbox.adaptive(
              tristate: true,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            CheckboxListTile.adaptive(
              tristate: true,
              title: Text("Click me"),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            Switch.adaptive(
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            SwitchListTile.adaptive(
              title: Text("Switch me"),
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            Slider.adaptive(
              max: 10,
              divisions: 10,
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            // you can use GestureDetector or InkWell to handle the tap event
            // the main difference is that InkWell has a splash color and GestureDetector does not
            InkWell(
              splashColor: Colors.teal,
              onTap: () {
                print("Image selected");
              },
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.white12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
