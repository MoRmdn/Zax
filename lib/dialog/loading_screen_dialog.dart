import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zax/helper/app_config.dart';
import 'package:zax/helper/loading_controller.dart';

class LoadingScreen {
  //* class singleton
  LoadingScreen._onlyInstance();
  static final _shared = LoadingScreen._onlyInstance();
  factory LoadingScreen.instance() => _shared;

  LoadingScreenController? _controller;

  void show({
    required BuildContext context,
    required String content,
    Size? dSize,
  }) {
    if (_controller?.update(content) ?? false) {
      return;
    } else {
      _controller = _loadingDialogOverLay(
        context: context,
        dialogContent: content,
        dSize: dSize,
      );
    }
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  //* show update close loading dialog
  LoadingScreenController _loadingDialogOverLay({
    required BuildContext context,
    required String dialogContent,
    //* size of this widget as it's context widget size
    Size? dSize,
  }) {
    //? add text to the stream
    final text = StreamController<String>();
    text.add(dialogContent);

    //? save the state of the current widget and insert overlay on this state
    final state = Overlay.of(context);

    //? determine overlay size based on context of the widget where i call overlay on
    final renderBox = context.findRenderObject() as RenderBox;
    final size = dSize ?? renderBox.size;

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.8,
                maxWidth: size.width * 0.8,
                minWidth: size.width * 0.5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        AppConfig.loadingColorizedGif,
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StreamBuilder<String>(
                        stream: text.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    state?.insert(overlay);
    return LoadingScreenController(
      close: () {
        text.close();
        overlay.remove();
        return true;
      },
      update: (updateContent) {
        text.add(updateContent);
        return true;
      },
    );
  }
}
