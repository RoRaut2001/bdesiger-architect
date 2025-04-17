import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../../Model/rating.dart';

class ArchitectRatingSplineChart extends StatelessWidget {
  final List<Rating> ratingData;

  const ArchitectRatingSplineChart({Key? key, required this.ratingData}) : super(key: key);

  List<ChartSampleData> _processRatingData(List<Rating> ratingData) {
    return ratingData.map((rating) {
      final createdDate = rating.createdDate;
      if (createdDate != null && createdDate.isNotEmpty) {
        final date = DateFormat('yyyy-MM-dd').parse(createdDate);
        return ChartSampleData(date: date, rating: rating.rating ?? 0.0);
      }
      // Return default ChartSampleData if createdDate is null/invalid
      return ChartSampleData(date: DateTime.now(), rating: 0.0);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartSampleData> chartData = _processRatingData(ratingData);

    // Check if chartData is empty
    if (chartData.isEmpty) {
      return const Center(
        child: Text(
          'No data available to display.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    // Determine the minimum and maximum dates
    final DateTime minDate = chartData.map((data) => data.date).reduce((a, b) => a.isBefore(b) ? a : b);
    final DateTime maxDate = chartData.map((data) => data.date).reduce((a, b) => a.isAfter(b) ? a : b);

    final TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Ratings Over Time', alignment: ChartAlignment.near),
      primaryXAxis: DateTimeAxis(
        minimum: minDate.subtract(const Duration(days: 1)), // Add padding for aesthetics
        maximum: maxDate.add(const Duration(days: 1)),     // Add padding for aesthetics
        dateFormat: DateFormat.MMMd(),
        majorGridLines: MajorGridLines(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      primaryYAxis: NumericAxis(
        minimum: 0.0,
        maximum: 5.0,
        interval: 0.5,
        axisLine: AxisLine(width: 0),
        labelFormat: '{value}',
        majorTickLines: MajorTickLines(size: 0),
      ),
      tooltipBehavior: tooltipBehavior,
      series: <SplineSeries<ChartSampleData, DateTime>>[
        SplineSeries<ChartSampleData, DateTime>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData data, _) => data.date,
          yValueMapper: (ChartSampleData data, _) => data.rating,
          pointColorMapper: (ChartSampleData data, _) => data.rating < 4.6
              ? Colors.red
              : Colors.green,
          markerSettings: const MarkerSettings(isVisible: true),
          name: 'Rating',
        ),
      ],
    );
  }
}

class ChartSampleData {
  final DateTime date;
  final double rating;

  ChartSampleData({required this.date, required this.rating});
}
