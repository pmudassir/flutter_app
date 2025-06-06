import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem = "Item 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), //widget.title since its a stateful widget
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // there is a default leading button in the app bar, so we need to disable it for manual control
        // if removed the below line, and remove the above leading button, the default back button will appear
        // navigator.pushReplacement will replace the current page with the new page, and the old page will be removed from the stack
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: "Item 1", child: Text("Item 1")),
                  DropdownMenuItem(value: "Item 2", child: Text("Item 2")),
                  DropdownMenuItem(value: "Item 3", child: Text("Item 3")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
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
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: Text('Click Me'),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Click Me')),
              FilledButton(onPressed: () {}, child: Text('Click Me')),
              TextButton(onPressed: () {}, child: Text('Click Me')),
              OutlinedButton(onPressed: () {}, child: Text('Click Me')),
              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
