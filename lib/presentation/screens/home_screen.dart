import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController initialValueController = TextEditingController();
  TextEditingController numberOfTermsController = TextEditingController();
  List<int> lucasSequence = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle:  Text("Lucas Number App"),
      ),
      child:  SafeArea(
        child:  Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CupertinoTextField(
              controller: initialValueController,
              keyboardType: TextInputType.number,
              placeholder: "Valor inicial",
            ),
            const SizedBox(height: 16),
            CupertinoTextField(
              controller: numberOfTermsController,
              keyboardType: TextInputType.number,
              placeholder: "Introduce el numero de terminos a generar",
            ),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              onPressed: generateSequence,
              borderRadius: const BorderRadius.all(Radius.circular(80.0)),
              child: const Text("Generar numeros"),
            ),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              onPressed: deleteSequence,
              borderRadius: const BorderRadius.all(Radius.circular(80.0)),
              child: const Text("Borrar numeros"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: lucasSequence.length,
                itemBuilder: (context, index) {
                  return CupertinoListTile(
                    leading: const Icon(CupertinoIcons.number_circle),
                    title: Text("${lucasSequence[index]}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
        ),
    );
  }

  void deleteSequence() {
    setState(() {
      lucasSequence.clear();
      initialValueController.clear();
      numberOfTermsController.clear();
    });
  }


  void generateSequence() {
    int initialValue = int.tryParse(initialValueController.text) ?? 2;
    int numberOfTerms = int.tryParse(numberOfTermsController.text) ?? 0;

    if (numberOfTerms <= 0) {
      showAlert(context);
      return;
    }

    setState(() {
      lucasSequence.clear();
      lucasSequence.add(initialValue);
      if (numberOfTerms > 1) {
        lucasSequence.add(1);
      }
      for (int i = 2; i < numberOfTerms; i++) {
        lucasSequence.add(lucasSequence[i - 1] + lucasSequence[i - 2]);
      }
      FocusScope.of(context).unfocus();
    });
  }
  void showAlert(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Error'),
        content: Text('La cantidad de numeros a generar es incorrecta.'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra la alerta
            },
          ),
        ],
      );
    },
  );
}
}
