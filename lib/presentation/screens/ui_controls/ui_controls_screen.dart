import 'package:flutter/material.dart';

class UIScreen extends StatelessWidget {
  static const name = "ui_screen";
  const UIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple UI Controls"),
      ),
      body: const _UiView(),
    );
  }
}

class _UiView extends StatefulWidget {
  const _UiView();

  @override
  State<_UiView> createState() => _UiViewState();
}

enum Transport { car, plane, boat, sub }

class _UiViewState extends State<_UiView> {
  bool isDeveloper = true;
  Transport selectedTransport = Transport.car;
  bool breakfast = false;
  bool lunch = false;
  bool dinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text("Developer mode"),
            subtitle: const Text("Subcontrols"),
            value: isDeveloper,
            onChanged: (value) {
              setState(() {
                isDeveloper = !isDeveloper;
              });
            }),
        ExpansionTile(
          initiallyExpanded: true,
          title: const Text("Transportation Vehicule"),
          subtitle: Text("$selectedTransport"),
          children: [
            RadioListTile(
                title: const Text("Car"),
                value: Transport.car,
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = Transport.car;
                  });
                }),
            RadioListTile(
                title: const Text("plane"),
                value: Transport.plane,
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = Transport.plane;
                  });
                }),
            RadioListTile(
                title: const Text("boat"),
                value: Transport.boat,
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = Transport.boat;
                  });
                }),
            RadioListTile(
                title: const Text("sub"),
                value: Transport.sub,
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = Transport.sub;
                  });
                }),
          ],
        ),
        CheckboxListTile(
          title:  const Text("va a querer des?"),
            value: breakfast,
            onChanged: (value) {
              setState(() {
                breakfast = !breakfast;
              });
            }),
          CheckboxListTile(
          title:  const Text("va a querer al?"),
            value: lunch,
            onChanged: (value) {
              setState(() {
                lunch = !lunch;
              });
            }),
             CheckboxListTile(
          title:  const Text("va a querer ce?"),
            value: dinner,
            onChanged: (value) {
              setState(() {
                dinner = !dinner;
              });
            }),
      ],
    );
  }
}
