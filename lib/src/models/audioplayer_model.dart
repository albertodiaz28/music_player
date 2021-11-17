import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {

  bool _playing = false;
  Duration _songDuration = new Duration( milliseconds: 0 );
  Duration _current = new Duration( milliseconds: 0 );
  late AnimationController _controller;

  String get songTotalDuration => this.printDuration(this._songDuration);
  String get currentSecond => this.printDuration(this._current);

  double get porcentaje => (this._songDuration.inSeconds > 0)
                            ? this._current.inSeconds / this._songDuration.inSeconds
                            : 0;

  set controller( AnimationController valor ) {
    this._controller = valor;
  }
  AnimationController get controller => this._controller;

  set playing( bool valor ) {
    this._playing = valor;
    notifyListeners();
  }
  bool get playing => this._playing;

  set songDuration( Duration valor ) {
    this._songDuration = valor;
    notifyListeners();
  }
  Duration get songDuration => this._songDuration;

  set current( Duration valor ) {
    this._current = valor;
    notifyListeners();
  }
  Duration get current => this._current;

  String printDuration(Duration duration) {

    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }

}