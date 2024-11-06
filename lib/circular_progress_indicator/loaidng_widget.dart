import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loadingWidget(),
    );
  }
}

class loadingWidget extends StatefulWidget {
  @override
  _loadingWidgetState createState() => _loadingWidgetState();
}

class _loadingWidgetState extends State<loadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: false);

    // Create a TweenSequence to define the animations in sequence
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 2 * 3.14159),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 2 * 3.14159),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(2 * 3.14159),
        weight: 10.0, // 1 second pause
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sequential Transformations'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            // Determine the current rotation based on the animation value
            double rotationX =
                _animation.value <= 3.14159 ? _animation.value : 0.0;
            double rotationY =
                _animation.value > 3.14159 ? _animation.value - 3.14159 : 0.0;

            return Transform(
              transform: Matrix4.identity()
                ..rotateX(rotationX)
                ..rotateY(rotationY),
              alignment: Alignment.center,
              child: child,
            );
          },
          child: Container(
            width: 12,
            height: 12,
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
