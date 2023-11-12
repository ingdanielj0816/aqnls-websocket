import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia/utils/theme.dart';

class ChallengeItem extends StatefulWidget {
  final String imagePath;

  const ChallengeItem({
    super.key, 
    required this.imagePath
  });

  @override
  State<ChallengeItem> createState() => _ChallengeItemState();
}

class _ChallengeItemState extends State<ChallengeItem> {

  final StreamController<bool> _autoplayStreamController = StreamController<bool>();
  bool _currentAutoPlayValue = false;
  late Timer _autoplayTimer;

  @override
  void initState() {
    super.initState();
    _startAutoplayTimer();
  }

  void _startAutoplayTimer() {
    _autoplayTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_autoplayStreamController.isClosed) {
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
    return Container(
      width: 274,
      height: 79,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
          ),
          const BoxShadow(
            color: AppColors.whiteColor,
            spreadRadius: -5.0,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Question Icon
          const Image(
            image: AssetImage('assets/images/general-culture-icon.png'),
          ),
          // Number of questions
          Text('20',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                shadows: <Shadow>[
                  Shadow(
                    color: Color(0xFFC14D33),
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  ),
                ],
              ))),
          // Arrow Icon
          const Icon(
            Icons.arrow_forward_ios,
            size: 30,
          ),
          // Wildcard Icon
          StreamBuilder(
            stream: _autoplayStreamController.stream,
            initialData: true,
            builder: (context, snapshot) {
              return ShakeWidget(
                shakeConstant: ShakeRotateConstant1(),
                duration: const Duration(seconds: 2),
                autoPlay: snapshot.data!,
                child: Image(
                  image: AssetImage(widget.imagePath),
                  width: 60,
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
