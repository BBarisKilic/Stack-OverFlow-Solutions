import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: Center(
            child: SafeArea(
              child: ScrollSizingWidget(),
            ),
          ),
        ),
      );
}

class ScrollSizingWidget extends StatefulWidget {
  const ScrollSizingWidget({Key? key}) : super(key: key);

  @override
  State<ScrollSizingWidget> createState() => _ScrollSizingWidgetState();
}

class _ScrollSizingWidgetState extends State<ScrollSizingWidget> {
  late final ScrollController _horizontal;
  late final ScrollController _vertical;

  @override
  void initState() {
    super.initState();
    _horizontal = ScrollController();
    _vertical = ScrollController();
  }

  @override
  void dispose() {
    _horizontal.dispose();
    _vertical.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scrollbar(
        controller: _horizontal,
        scrollbarOrientation: ScrollbarOrientation.bottom,
        child: SingleChildScrollView(
          controller: _horizontal,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: 500,
            width: 1000,
            child: Scrollbar(
              controller: _vertical,
              scrollbarOrientation: ScrollbarOrientation.right,
              child: CustomScrollView(
                controller: _vertical,
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 200.0,
                    collapsedHeight: 200.0,
                    pinned: true,
                    stretch: true,
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    title: Container(
                      height: 200.0,
                      color: Colors.red,
                    ),
                    titleSpacing: 0,
                  ),
                  SliverFixedExtentList(
                    itemExtent: 1200.0,
                    delegate: SliverChildBuilderDelegate(
                      (_, __) => Container(
                        color: Colors.orange,
                      ),
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
