import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:utils/utils.dart';

void main() async {
  loadConfig(
      DataConfig(
        primaryColor: Colors.greenAccent, 
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(text: 'Example'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputWidget(hintText: 'Hint de texto', padding: const EdgeInsets.all(8),),
            ButtonWidget(text: 'Texto', icon: Icons.abc_rounded, padding: const EdgeInsets.all(8)),
            ButtonWidget(
              text: 'Base', 
              padding: const EdgeInsets.all(8),),
            ButtonWidget(
              text: 'Ghost',
              icon: Icons.abc_rounded,
              buttonType: ButtonType.ghost, 
              padding: const EdgeInsets.all(8),),
            ButtonWidget(
              text: 'Link',
              buttonType: ButtonType.link,
              buttonStyle: ButtonStyle.success,
              padding: const EdgeInsets.all(8),),
            ButtonWidget(
              text: 'Success',
              buttonType: ButtonType.base,
              buttonStyle: ButtonStyle.success,
              padding: const EdgeInsets.all(8),),
            ButtonWidget(
              text: 'Info',
              buttonType: ButtonType.base,
              buttonStyle: ButtonStyle.info,
              padding: const EdgeInsets.all(8),),
            ButtonWidget(
              text: 'Danger',
              buttonType: ButtonType.base,
              buttonStyle: ButtonStyle.danger,
              padding: const EdgeInsets.all(8),),
            const IconButtonWidget(iconData: Icons.access_alarm,),
            const ImageActionWidget(
                padding: EdgeInsets.symmetric(vertical: 25),
                height: 150,
                width: 150,
                iconData: Icons.abc_outlined,
                borderColor: Colors.black,
                urlImage: 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png'),
          ],
        ),
      ),
    );
  }
}
