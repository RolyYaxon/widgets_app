import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = "snack_screen";
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final sakbar = SnackBar(
      content: const Text("data"),
      action: SnackBarAction(label: "Entendido", onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(sakbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title:  const Text("Vamoa darle?"),
              content:  const Text("Culpa do commodo occaecat exercitation exercitation duis sint eiusmod esse laborum ipsum et. Consequat incididunt deserunt Lorem ipsum reprehenderit nisi excepteur minim occaecat culpa. Minim adipisicing magna tempor ex ea aute velit ad magna labore aliquip magna reprehenderit irure. Id culpa est excepteur eu in est aute veniam minim velit laboris ex in. Qui eiusmod nisi proident nisi sit sit do exercitation fugiat ullamco et exercitation excepteur ex."),
            actions: [
              TextButton( onPressed: ()=>context.pop(), 
              child: const Text("Cancelar")),
              FilledButton(onPressed: ()=>context.pop(), 
              child: const Text("Aceptar"))
            ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Snackbar y dialogos",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        "Sunt laborum Eu veniam et in officia sit fugiat laboris ullamco fugiat officia mollit nulla. Lorem nostrud occaecat duis exercitation tempor minim id sit quis ad et aute nulla. Lorem do voluptate adipisicing id ad occaecat. In exercitation ea enim consequat mollit ea fugiat veniam dolore.voluptate esse nulla cillum nulla sit occaecat sit labore.")
                  ]);
                },
                child: const Text("User licenses")),
            const SizedBox(
              height: 10,
            ),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text("Show more"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Ver mas"),
        onPressed: () {
          showCustomSnackbar(context);
        },
        icon: const Icon(Icons.memory_rounded),
      ),
    );
  }
}
