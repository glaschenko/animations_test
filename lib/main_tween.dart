

import 'package:flutter/animation.dart';

void main(){
  IntTween tween = IntTween(begin: 0, end: 10);
  var duration = Duration(seconds: 10);
  final step = Duration.millisecondsPerSecond / 60;
  for(var currentTime = 0.0; currentTime < duration.inMilliseconds; currentTime += step){
    var val = tween.lerp(currentTime/duration.inMilliseconds);
    print("cur time: $currentTime , val: $val");
  }

}