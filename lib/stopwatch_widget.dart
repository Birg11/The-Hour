import 'package:flutter/material.dart';
import 'package:hour/lap_records.dart';
import 'package:hour/stopwatch_provider.dart';
import 'package:provider/provider.dart';

class StopwatchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stopwatchProvider = Provider.of<StopwatchProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Display elapsed time
          Text(
            stopwatchProvider.elapsedTime,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.tealAccent,
            ),
          ),
          const SizedBox(height: 20),

          // Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildActionButton(
                context: context,
                label: 'Start',
                onPressed: stopwatchProvider.startStopwatch,
              ),
              _buildActionButton(
                context: context,
                label: 'Stop',
                onPressed: stopwatchProvider.stopStopwatch,
              ),
              _buildActionButton(
                context: context,
                label: 'Reset',
                onPressed: stopwatchProvider.resetStopwatch,
              ),
              _buildActionButton(
                context: context,
                label: 'Lap',
                onPressed: () => stopwatchProvider.lapStopwatch(context),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Lap Records
          Expanded(child: LapRecords()),
        ],
      ),
    );
  }

  // Helper method to build action buttons
  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal, // Button text color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
