import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Responsive Cards'),
        ),
        body: Center(
          child: Responsive(
            desktop: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        FixedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        ResizeableBox(),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Column(
                      children: [
                        FixedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        ResizeableBox(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            mobile: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        FixedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        ResizeableBox(),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Column(
                      children: [
                        FixedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        ResizeableBox(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}

class FixedBox extends StatelessWidget {
  const FixedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Text(
          'Fixed Box',
          style: TextStyle(color: Colors.white),
        ),
      ),
      width: 75,
      height: 25,
    );
  }
}

class ResizeableBox extends StatefulWidget {
  const ResizeableBox({super.key});

  @override
  State<ResizeableBox> createState() => _ResizeableBoxState();
}

class _ResizeableBoxState extends State<ResizeableBox> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints
              .maxWidth, // Use LayoutBuilder constraints to determine width
          color: Colors.green,
          child: Center(
            child: Text(
              'Resizable Box',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
