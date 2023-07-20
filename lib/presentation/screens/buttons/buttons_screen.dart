import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
            const ElevatedButton(
                onPressed: null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text("Elevated Icon"),
            ),
            FilledButton(
                onPressed: () {}, child: const Text(("Filled Button"))),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.accessibility_rounded),
                label: const Text("label")),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined button")),
            OutlinedButton.icon(
                onPressed: () {},
                label: const Text("OUlineddd"),
                icon: const Icon(Icons.terminal)),
            TextButton(onPressed: () {}, child: const Text("TExto")),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_tree_sharp),
                label: const Text("Homero")),
            const CustomButton(),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.read_more_outlined)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_balance_wallet_sharp),
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  iconColor: MaterialStatePropertyAll(colors.primary)),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "hola",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
