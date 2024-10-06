import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:utils/utils.dart';

void main() async {
  loadConfig(DataConfig(
    primaryColor: Colors.greenAccent,
  ));
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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBarWidget(text: 'Utils'),
      bottomNavigationBar: BottomNavigationBarWidget(
          indexSelectedItem: 3,
          onTapItem: print,
          showTitles: false,
          icons: [
            BottomNavigationItemWidget(
                icon: Icons.home_outlined, title: 'Inicio'),
            BottomNavigationItemWidget(
                icon: Icons.people_alt_outlined, title: 'Clientes'),
            BottomNavigationItemWidget(
                icon: Icons.shopping_bag_outlined, title: 'Productos'),
            BottomNavigationItemWidget(
                icon: Icons.settings_outlined, title: 'Perfil'),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TagWidget(
              title: 'Este es un tag',
              icon: Icons.abc,
              padding: const EdgeInsets.only(left: 10, top: 4),
            ),
            ItemListImageDataWidget(
              width: size.width,
              height: size.height * 0.2,
              path: 'assets/images/icon_avatar.png',
              storageType: StorageType.localStorage,
              title: 'Jose Antonio Huanca Ancajima',
              subtitle: 'Enace IV Etapa Mz H2 Lt 11',
              detail: '989743471',
              //shape: BoxShape.rectangle,
              //path: 'https://imgs.search.brave.com/TOSM-yLTsegMoH6QyZRJre73TnPam6v5YAUht-y_37Y/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4t/aWNvbnMtcG5nLmZy/ZWVwaWsuY29tLzI1/Ni84MzIzLzgzMjMz/MTcucG5nP3NlbXQ9/YWlzX2h5YnJpZA',
            ),
            InputWidget(
              icon: const Icon(
                Icons.map,
                color: Colors.black,
              ),
              inputBorderCurrent: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius()),
                  borderSide: BorderSide(width: 1, color: cardColor())),
              hintText: 'Hint de texto',
              padding: const EdgeInsets.all(8),
            ),
            InputWidget(
              icon: const Icon(
                Icons.map,
                color: Colors.black,
              ),
              inputBorderCurrent: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius()),
                  borderSide: BorderSide(width: 1, color: cardColor())),
              hintText: 'Hint de texto',
              padding: const EdgeInsets.all(8),
            ),
            ButtonWidget(
                onTap: () => 
                showDialogWidget(
                  message: 'Este es un mensaje 3',
                  context: context),
                text: 'Texto',
                icon: Icons.abc_rounded,
                padding: const EdgeInsets.all(8)),
            ButtonWidget(
              elevation: 10,
              text: 'Base',
              padding: const EdgeInsets.all(8),
            ),
            ButtonWidget(
              text: 'Ghost',
              icon: Icons.abc_rounded,
              buttonType: ButtonType.ghost,
              padding: const EdgeInsets.all(8),
            ),
            ButtonWidget(
              text: 'Link',
              buttonType: ButtonType.link,
              buttonStyle: ButtonStyle.success,
              padding: const EdgeInsets.all(8),
            ),
            ButtonWidget(
              text: 'Success',
              buttonType: ButtonType.base,
              buttonStyle: ButtonStyle.success,
              padding: const EdgeInsets.all(8),
            ),
            ButtonWidget(
              text: 'Info',
              buttonType: ButtonType.base,
              buttonStyle: ButtonStyle.info,
              padding: const EdgeInsets.all(8),
            ),
            ButtonWidget(
              text: 'Danger',
              buttonType: ButtonType.base,
              buttonStyle: ButtonStyle.danger,
              padding: const EdgeInsets.all(8),
            ),
            const IconButtonWidget(
              iconData: Icons.access_alarm,
            ),
            const ImageActionWidget(
              padding: EdgeInsets.symmetric(vertical: 25),
              height: 150,
              width: 150,
              iconData: Icons.abc_outlined,
              borderColor: Colors.black,
              urlImage:
                  'https://static.vecteezy.com/system/resources/thumbnails/008/442/086/small_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
