import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchProvider with ChangeNotifier {
  bool isRunning = false;
  Stopwatch? _stopwatch;
  List<String> lapTimes = [];
  late Duration _lapTime;
  String elapsedTime = '00:00.00';

  StopwatchProvider() {
    _stopwatch = Stopwatch();
    _lapTime = Duration.zero;
  }

  void startStopwatch() {
    if (!isRunning) {
      _stopwatch!.start();
      _updateTimer();
      isRunning = true;
      notifyListeners();
    }
  }

  void stopStopwatch() {
    if (isRunning) {
      _stopwatch!.stop();
      _lapTime += _stopwatch!.elapsed;
      isRunning = false;
      notifyListeners();
    }
  }

  void resetStopwatch() {
    if (!isRunning) {
      _stopwatch!.reset();
      _lapTime = Duration.zero;
      elapsedTime = '00:00.00';
      lapTimes.clear();
      notifyListeners();
    }
  }

  void lapStopwatch(BuildContext context) {
    if (isRunning) {
      if (lapTimes.length < 10) {
        final lapTime = _stopwatch!.elapsed + _lapTime;
        lapTimes.insert(0, _formatDuration(lapTime));
        _lapTime = Duration.zero;
        notifyListeners();
      } else {
        // Show an alert when the maximum number of lap records is reached
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Maximum Lap Records Reached'),
              content: Text('You have reached the maximum of 10 lap records.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = (duration.inMilliseconds ~/ 60000) % 60;
    final seconds = (duration.inMilliseconds ~/ 1000) % 60;
    final milliseconds = (duration.inMilliseconds % 1000);
    return '$minutes:${seconds.toString().padLeft(2, '0')}.${(milliseconds ~/ 10).toString().padLeft(2, '0')}';
  }

  void _updateTimer() {
    Future.delayed(Duration(milliseconds: 10), () {
      if (isRunning) {
        final totalMilliseconds =
            _lapTime.inMilliseconds + _stopwatch!.elapsedMilliseconds;
        elapsedTime =
            _formatDuration(Duration(milliseconds: totalMilliseconds));
        notifyListeners();
        _updateTimer();
      }
    });
  }
}
