import 'package:flutter/material.dart';
import 'package:hour/stopwatch_provider.dart';
import 'package:provider/provider.dart';

class LapRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stopwatchProvider = Provider.of<StopwatchProvider>(context);

    // Determine the background color based on the current theme
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final lapColor = isDarkTheme
        ? Colors.grey[800]
        : Colors.teal.shade50; // Background for laps
    final textColor =
        isDarkTheme ? Colors.white : Colors.black; // Text color for laps

    return Card(
      margin: const EdgeInsets.all(20),
      shadowColor: Colors.black,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                'Lap Records',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Use Expanded to allow ListView to take the remaining space
            Expanded(
              child: ListView.builder(
                itemCount: stopwatchProvider.lapTimes.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: lapColor, // Use dynamic color
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(
                        'Lap ${index + 1}: ${stopwatchProvider.lapTimes[index]}',
                        style: TextStyle(
                          fontSize: 20,
                          color: textColor, // Use dynamic text color
                        ),
                      ),
                      trailing: Icon(
                        Icons.hourglass_empty,
                        color: Colors.teal,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
