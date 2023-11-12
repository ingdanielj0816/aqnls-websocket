import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:trivia/widgets/custom_button.dart';

class ShakeButton extends StatefulWidget {
  final String labelText;
  final ShakeConstant shakeConstant;
  final Color backgroundColor;
  final Color shadowColor;
  final VoidCallback onTap;

  const ShakeButton({
    super.key,
    required this.labelText,
    required this.shakeConstant,
    required this.backgroundColor,
    required this.shadowColor,
    required this.onTap,
  });

  @override
  State<ShakeButton> createState() => _ShakeButtonState();
}

class _ShakeButtonState extends State<ShakeButton> {

  final StreamController<bool> _autoplayStreamController = StreamController<bool>();
  bool _currentAutoPlayValue = false;
  late Timer _autoplayTimer;

  @override
  void initState() {
    super.initState();
    _startAutoplayTimer();
  }

  void _startAutoplayTimer() {
    _autoplayTimer = Timer.periodic(const Duration(seconds: 2), (_) {
        if(_autoplayStreamController.isClosed) {
          _autoplayTimer.cancel();
          return;
        }

      _currentAutoPlayValue = !_currentAutoPlayValue;
      _autoplayStreamController.add(_currentAutoPlayValue);
    });
  }
  
  @override
  void dispose() {
    _autoplayStreamController.close();
    _autoplayTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _autoplayStreamController.stream,
      initialData: false,
      builder: (context, snapshot) {
        return ShakeWidget(
          shakeConstant: widget.shakeConstant,
          autoPlay: snapshot.data!,
          child: CustomButton(
              width: 180,
              height: 50,
              backgroundColor: widget.backgroundColor,
              shadowColor: widget.shadowColor,
              labelText: widget.labelText,
              fontSize: 12,
              onTap: widget.onTap),
        );
      }
    );
  }
}
