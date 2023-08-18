 


 import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

 
import 'dart:math';

 
 import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Pie Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedPieChartPage(),
    );
  }
}

class AnimatedPieChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Pie Chart'),
      ),
      body: Center(
        child: AnimatedPieChart(
          cases: 100,
          deaths: 50,
          recovered: 30,
        ),
      ),
    );
  }
}

class AnimatedPieChart extends StatefulWidget {
  final int cases;
  final int deaths;
  final int recovered;

  AnimatedPieChart({required this.cases, required this.deaths, required this.recovered});

  @override
  _AnimatedPieChartState createState() => _AnimatedPieChartState();
}

class _AnimatedPieChartState extends State<AnimatedPieChart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final total = widget.cases + widget.deaths + widget.recovered;
        final casesAngle = 2 * pi * (widget.cases / total) * _animation.value;
        final deathsAngle = 2 * pi * (widget.deaths / total) * _animation.value;
        final recoveredAngle = 2 * pi * (widget.recovered / total) * _animation.value;

        return Center(
          child: CustomPaint(
            painter: PieChartPainter(
              casesAngle: casesAngle,
              deathsAngle: deathsAngle,
              recoveredAngle: recoveredAngle,
            ),
            child: Container(
              width: 200,
              height: 250,
            ),
          ),
        );
      },
    );
  }
}

 

 class PieChartPainter extends CustomPainter {
  final double casesAngle;
  final double deathsAngle;
  final double recoveredAngle;

  PieChartPainter({
    required this.casesAngle,
    required this.deathsAngle,
    required this.recoveredAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);

    final paintCases = Paint()..color = Color.fromARGB(255, 62, 158, 236);
    final paintDeaths = Paint()..color = const Color.fromARGB(255, 247, 92, 81);
    final paintRecovered = Paint()..color = const Color.fromARGB(255, 108, 214, 111);

    final startAngle = -pi / 2;

    canvas.drawArc(rect, startAngle, casesAngle, true, paintCases);
    canvas.drawArc(rect, startAngle + casesAngle, deathsAngle, true, paintDeaths);
    canvas.drawArc(rect, startAngle + casesAngle + deathsAngle, recoveredAngle, true, paintRecovered);

    
    final casesLabelX = centerX + radius * 0.7 * cos(startAngle + casesAngle / 2);
    final casesLabelY = centerY + radius * 0.7 * sin(startAngle + casesAngle / 2);

    final deathsLabelX = centerX + radius * 0.7 * cos(startAngle + casesAngle + deathsAngle / 2);
    final deathsLabelY = centerY + radius * 0.7 * sin(startAngle + casesAngle + deathsAngle / 2);

    final recoveredLabelX = centerX + radius * 0.7 * cos(startAngle + casesAngle + deathsAngle + recoveredAngle / 2);
    final recoveredLabelY = centerY + radius * 0.7 * sin(startAngle + casesAngle + deathsAngle + recoveredAngle / 2);

    
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    
    textPainter.text = TextSpan(
      text: 'Cases: ${((casesAngle / (2 * pi)) * 100).toStringAsFixed(2)}%',
      style: TextStyle(color: Colors.black, fontSize: 12,),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(casesLabelX, casesLabelY));


    textPainter.text = TextSpan(
      text: 'Deaths: ${((deathsAngle / (2 * pi)) * 100).toStringAsFixed(2)}%',
      style: TextStyle(color: Colors.black, fontSize: 12),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(deathsLabelX, deathsLabelY));

    textPainter.text = TextSpan(
      text: 'Recovered: ${((recoveredAngle / (2 * pi)) * 100).toStringAsFixed(2)}%',
      style: TextStyle(color: Colors.black, fontSize: 12),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(recoveredLabelX, recoveredLabelY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}










































// class AnimatedPieChart extends StatefulWidget {
//   final int cases;
//   final int deaths;
//   final int recovered;

//   AnimatedPieChart({required this.cases, required this.deaths, required this.recovered});

//   @override
//   _AnimatedPieChartState createState() => _AnimatedPieChartState();
// }

// class _AnimatedPieChartState extends State<AnimatedPieChart> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // You can adjust the animation duration
//     );
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

//     _controller.forward(); // Start the animation
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         // Calculate the current values for the pie chart segments
//         final total = widget.cases + widget.deaths + widget.recovered;
//         final casesAngle = 2 * pi * (widget.cases / total) * _animation.value;
//         final deathsAngle = 2 * pi * (widget.deaths / total) * _animation.value;
//         final recoveredAngle = 2 * pi * (widget.recovered / total) * _animation.value;

//         return Center(
//           child: CustomPaint(
//             painter: PieChartPainter(
//               casesAngle: casesAngle,
//               deathsAngle: deathsAngle,
//               recoveredAngle: recoveredAngle,
//             ),
//             child: Container(
//               width: 200, // Adjust the size of the pie chart
//               height: 200,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class PieChartPainter extends CustomPainter {
//   final double casesAngle;
//   final double deathsAngle;
//   final double recoveredAngle;

//   PieChartPainter({
//     required this.casesAngle,
//     required this.deathsAngle,
//     required this.recoveredAngle,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;
//     final radius = size.width / 2;
//     final rect = Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);

//     final paintCases = Paint()..color = Colors.blue;
//     final paintDeaths = Paint()..color = Colors.red;
//     final paintRecovered = Paint()..color = Colors.green;

//     canvas.drawArc(rect, -pi / 2, casesAngle, true, paintCases);
//     canvas.drawArc(rect, -pi / 2 + casesAngle, deathsAngle, true, paintDeaths);
//     canvas.drawArc(rect, -pi / 2 + casesAngle + deathsAngle, recoveredAngle, true, paintRecovered);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
