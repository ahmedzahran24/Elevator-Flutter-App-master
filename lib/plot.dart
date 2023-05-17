import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AnalysisScreen extends StatefulWidget {
  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  List<DocumentSnapshot> appointments = [];
  Map<String, int> dateCounts = {};
  Map<String, int> timeCounts = {};
  String mostFrequentDate = '';
  String mostFrequentTime = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // Fetch appointments and listen for updates
    final appointmentsSnapshot =
        await FirebaseFirestore.instance.collection('analysis').get();
    final counterSnapshot = await FirebaseFirestore.instance
        .collection('analysis')
        .doc('counter')
        .get();

    setState(() {
      appointments = appointmentsSnapshot.docs;
      final counterVal = counterSnapshot['counterVal'];
      // Convert counter value to an integer
      final int counter = int.tryParse(counterVal) ?? 0;

      // Update plot data
      updatePlotData(counter);
    });
  }

  void updatePlotData(int counter) {
    dateCounts.clear();
    timeCounts.clear();

    for (var i = 0; i < counter; i++) {
      final appointment = appointments[i];
      final date = appointment['date'] as String;
      final time = appointment['time'] as String;
      final floor = appointment['floor'] as int;

      // Count dates and times
      dateCounts[date] = (dateCounts[date] ?? 0) + 1;
      timeCounts[time] = (timeCounts[time] ?? 0) + 1;
    }

    // Find the most frequent date
    final mostFrequentDateEntry =
        dateCounts.entries.reduce((a, b) => a.value > b.value ? a : b);
    mostFrequentDate = mostFrequentDateEntry.key;

    // Find the most frequent time
    final mostFrequentTimeEntry =
        timeCounts.entries.reduce((a, b) => a.value > b.value ? a : b);
    mostFrequentTime = mostFrequentTimeEntry.key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments Analysis'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Most Frequent Date: $mostFrequentDate',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Most Frequent Time: $mostFrequentTime',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('analysis')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Fetch the counter value from the snapshot
                final counterVal = snapshot.data!.docs
                    .firstWhere((doc) => doc.id == 'counter')['counterVal'];
                final int counter = int.tryParse(counterVal) ?? 0;

                // Update plot data
                updatePlotData(counter);

                // Create chart series for floor numbers
                final seriesList = [
                  charts.Series<MapEntry<String, int>, String>(
                    id: 'Floor',
                    domainFn: (entry, _) => entry.key,
                    measureFn: (entry, _) => entry.value,
                    data: dateCounts.entries.toList(),
                    labelAccessorFn: (entry, _) => '${entry.key}',
                  ),
                ];

                return charts.BarChart(
                  seriesList,
                  animate: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
