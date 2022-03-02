import 'package:flutter/material.dart';

class AnimationMonth extends StatefulWidget {
  const AnimationMonth({Key? key}) : super(key: key);

  @override
  _AnimationMonthState createState() => _AnimationMonthState();
}

class _AnimationMonthState extends State<AnimationMonth>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> titleAnimation;
  late Animation<double> priceAnimation;
  late Animation<double> tagAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    titleAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.3, curve: Curves.bounceInOut)));
    tagAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.bounceInOut)));
    priceAnimation  = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1, curve: Curves.bounceInOut)));
    _controller.addListener(() {
      setState(() {});
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent.shade100,
      body: SafeArea(
        child: GestureDetector(
          onVerticalDragEnd: (DragEndDetails drag )
          {
            if(drag.velocity.pixelsPerSecond.dx>0)
            {
              print("dx>0");
              _controller.reset();
            }
            else if (drag.velocity.pixelsPerSecond.dx <0)
            {
              print("dx>0");
              _controller.forward();
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.translate(
                      offset: Offset(0.0, 30 * (1 - titleAnimation.value)),
                      child: Opacity(
                          opacity: titleAnimation.value,
                          child: const Text(
                            "Title",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ))),
                  Transform.translate(
                      offset: Offset(0, 20 * (1 - tagAnimation.value)),
                      child: Opacity(
                          opacity: tagAnimation.value,
                          child: const Text(
                            "Subtitle",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14,color: Colors.white),
                          ))),
                  Transform.translate(
                      offset: Offset(0.0, 10* (1 - priceAnimation.value)),
                      child: Opacity(
                          opacity: priceAnimation.value,
                          child: const Text(
                            "\$123",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.lightGreen),
                          ))),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: ()
                      {
                        _controller.reset();
                        _controller.forward();
                      },
                      child: const Text("Animate"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
