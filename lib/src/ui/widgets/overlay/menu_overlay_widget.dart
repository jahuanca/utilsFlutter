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
  final String? label;
  final String? value;

  MenuOverlayWidget({
    super.key,
    required this.items,
    required this.onTapItem,
    this.isExpand = false,
    this.width,
    this.label = 'label',
    this.value = 'id',
  });

  @override
  Widget build(BuildContext context) {
    return TapRegion(
        onTapInside: (event) => showOverlay(context, event),
        onTapOutside: (event) => dismiss(),
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
              children: items
                  .map(
                    (e) {
                      late Widget content;
                      switch (e.runtimeType) {
                        case String: content = Text(e);
                          break;
                        default: content = Text(e[label]);
                      }

                      return GestureDetector(
                      onTap: () => onTapItem(e),
                      child: Container(
                        decoration: BoxDecoration(),
                        padding: const EdgeInsets.all(15),
                        child: content,
                      ),
                    );
                    },
                  )
                  .toList(),
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
