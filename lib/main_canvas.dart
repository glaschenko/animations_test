

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
   window.onBeginFrame = animateFrame;
   window.scheduleFrame();
}

void animateFrame(Duration timeStamp) {
   final PictureRecorder recorder = PictureRecorder();
   final Canvas canvas = Canvas(recorder);

   final paint = Paint()
   ..style = PaintingStyle.stroke
   ..color = Colors.lightGreen
   ..strokeWidth = 40;

   Rect rect = Rect.fromLTRB(-100,-100,100,100);

   canvas
   ..translate(400, 400)
   ..drawRect(rect, paint);

   final Picture picture = recorder.endRecording();

   final SceneBuilder sceneBuilder = SceneBuilder()
   ..pushOffset(0, 0)
   ..addPicture(Offset.zero, picture)
   ..pop();

   window
      ..render(sceneBuilder.build())
      ..scheduleFrame();
}
