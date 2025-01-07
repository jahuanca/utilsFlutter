import 'package:flutter/material.dart';
import 'package:utils/src/core/default_extensions.dart';
import 'package:utils/src/data/data_functions.dart';

// ignore: must_be_immutable
class MenuOverlayWidget extends StatelessWidget {
  OverlayEntry? overlayEntry;
  final List<dynamic> items;
  final void Function(dynamic e) onTapItem;
  final bool isExpand;
  final double? width;
  final String? idLabel;
  final String? idValue;

  MenuOverlayWidget({
    super.key,
    required this.items,
    required this.onTapItem,
    this.isExpand = false,
    this.width,
    this.idLabel = 'label',
    this.idValue = 'id',
  });

  @override
  Widget build(BuildContext context) {
    return TapRegion(
        onTapInside: (event) => showOverlay(context, event),
        onTapOutside: (event) =>
            Future.delayed(Duration(milliseconds: 100), () => {dismiss()}),
        child: Icon(Icons.arrow_drop_down));
  }

  void showOverlay(BuildContext context, PointerDownEvent event) {
    final Size size = MediaQuery.of(context).size;
    final double? widthInside = (isExpand) ? size.width : width;
    final double minWidth = widthInside.orZero() + 30;
    final double? left =
        (minWidth + event.position.dx > size.width) ? null : event.position.dx;
    final double? rigth =
        (minWidth + event.position.dx > size.width) ? defaultDouble : null;

    if (overlayEntry != null) return;

    final List<Widget> children = items
        .map(
          (e) => GestureDetector(
            onTap: () => onTapItem(e),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: (e.runtimeType) == String
                    ? Text(e)
                    : Text('${e.toJson()[idLabel]}'),
              ),
            ),
          ),
        )
        .toList();

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: left,
        right: rigth,
        top: event.position.dy,
        child: Card(
          elevation: 10,
          child: Container(
            width: widthInside,
            color: cardColor(),
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    );

    if (overlayEntry != null) {
      Overlay.of(context).insert(overlayEntry!);
    }
  }

  void dismiss() {
    if (overlayEntry != null) {
      overlayEntry?.remove();
      overlayEntry = null;
    }
  }
}
