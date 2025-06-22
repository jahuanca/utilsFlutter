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

    DateTime initiaDate = DateTime.now().subtract(
      const Duration(days: 450)
    );
    String result = initiaDate.timeFromDate();

    return Scaffold(
      appBar: appBarWidget(
          text: 'Utils',
          leading: const Icon(Icons.people),
          actions: [
            MenuOverlayWidget(
              onTapItem: print,
              isExpand: false,
              items: const ['1 opcion', '2 opcion mas larga viendo tamaño'],
            ),
          ]),
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
            Text(result),
            MenuOverlayWidget(
              onTapItem: print,
              items: const ['1 opcion', '2 opcion mas larga viendo tamaño'],
            ),
            InputWidget(
              maxLength: 250,
              maxLines: 4,
              isDense: true,
              hintText: 'Text area',
              isTextArea: true,
            ),
            InputWidget(
              label: 'Usuario:',
              icon: const Icon(Icons.abc),
              iconOverlay: const Icon(Icons.abc_outlined),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              hintText: 'Usuario',
            ),
            const DropdownMenuWidget(
              items: ['1 opcion', '2 opcion'],
              onChanged: print,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              label: 'Opciones:',
            ),
            const CheckBoxWidget(
              label: 'Etiqueta de prueba:',
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              title: 'Presione checkbox',
              isChecked: true,
              error: 'Este es un error',
            ),
            ButtonWidget(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                text: 'Ingresar'),
            PasswordInputWidget(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              hintText: 'Contraseña',
              iconOverlay: Icons.remove_red_eye,
              isObscure: true,
            ),
            TagWidget(
              title: 'Este es un tag',
              icon: Icons.abc,
              padding: const EdgeInsets.only(left: 10, top: 4),
            ),
            TagWidget(
              alignmentOfContent: MainAxisAlignment.center,
              title: 'Tag sin icono y alineamiento',
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
              cardElevation: 14,
              paddingAll:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decorationAll: BoxDecoration(
                  border: Border.all(color: primaryColor()),
                  borderRadius: BorderRadius.circular(borderRadius())),
              /* actions: const [
                IconButton(onPressed: null, icon: Icon(Icons.edit)),
                IconButton(onPressed: null, icon: Icon(Icons.delete))
              ],*/
              actions: [
                IconButtonWidget(
                  onPressed: null,
                  iconData: Icons.edit,
                  shape: BoxShape.circle,
                  backgroundColor: infoColor(),
                ),
                IconButtonWidget(
                  onPressed: null,
                  iconData: Icons.edit,
                  shape: BoxShape.circle,
                  backgroundColor: infoColor(),
                ),
              ],
              alignmentOfActions: MainAxisAlignment.center,
              //shape: BoxShape.rectangle,
              //path: 'https://imgs.search.brave.com/TOSM-yLTsegMoH6QyZRJre73TnPam6v5YAUht-y_37Y/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4t/aWNvbnMtcG5nLmZy/ZWVwaWsuY29tLzI1/Ni84MzIzLzgzMjMz/MTcucG5nP3NlbXQ9/YWlzX2h5YnJpZA',
            ),
            InputWidget(
              inputFormatters: [inputFormatterPhoneNumber],
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
                onTap: () => showDialogWidget(
                    message: 'Este es un mensaje 3', context: context),
                text: 'Texto',
                iconData: Icons.abc_rounded,
                padding: const EdgeInsets.all(8)),
            ButtonWidget(
              elevation: 10,
              text: 'Base',
              padding: const EdgeInsets.all(8),
            ),
            ButtonWidget(
              text: 'Ghost',
              iconData: Icons.abc_rounded,
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
            ),
          ],
        ),
      ),
    );
  }
}
