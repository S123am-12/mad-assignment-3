import 'package:flutter/material.dart';
import 'package:flutter_application_1/matrix.dart';
class GasturePage extends StatefulWidget {
  const GasturePage({super.key});

  @override
  State<GasturePage> createState() => _GasturePageState();
}

class _GasturePageState extends State<GasturePage> {
 String _gestureDetected = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures'),
      ),
      body:SafeArea
      (child: SingleChildScrollView
      (child: Column(
       children: [
        _buildGestureDetectore(),
        Divider(
          color: Colors.grey.shade400,
          height: 40.0,
        ),
        _buildDraggable(),
        const Divider(
          height: 44.0,
        ),
        _buildDragTarget(),
        const Divider(
          height: 44.0,
        ),
       // _buildLongPressGestureDetector(),
        const Divider(
          color: Colors.black,
        ),
        TextButton(
          onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => const Demise()) );
          },
           style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),),
           child: Text('Go to touch page'),
          ),
       ],
      ),
      ),
      ),
    );

  }
  GestureDetector _buildGestureDetectore(){
    return GestureDetector(
      onTap: (){
        _displayGestureDected('onTap');
        print('onTap');
      },
      onDoubleTap: (){
        print('onDoubleTap');
        _displayGestureDected('onDoubleTap');
      },
      onLongPress: (){
        print('onLongPress');
        _displayGestureDected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details){
        print('onPanUpdate');
        _displayGestureDected('onPanUpdate');
      },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(
              Icons.access_alarm,
              size: 98.0,
            ),
            Text(_gestureDetected),
          ],
        ),
      ),
    );
  }
  void _displayGestureDected(String gesture){
    setState(() {
      _gestureDetected = gesture;
    });
  }
  Draggable <int>_buildDraggable(){
    return Draggable(
      childWhenDragging: const Icon(
        Icons.palette,
        size: 48,
        color: Colors.blue,
      ),
      feedback: const Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80,
      ),
      data: Colors.deepOrange.value,
      child: const Column(
        children: [
          Icon(
            Icons.palette,
            size: 48,
            color: Colors.deepOrange,
          ),
          Text('Dreagg me'),
        ],
      ),
    );
  }
Color? _paintedColor;
  DragTarget<int> _buildDragTarget(){
  return DragTarget<int>(
    onAcceptWithDetails: (DragTargetDetails<int> details){
      _paintedColor = Color(details.data);
    },
    builder: (BuildContext context, List<dynamic> acceptedData, List<dynamic> rejectedData) {
      if (acceptedData.isEmpty) {
        return Text('Drag to and see the color change', style: TextStyle(color: _paintedColor));
      } else {
        return Text('Painted color: $acceptedData', style: TextStyle(color: Color(acceptedData[0]), fontWeight: FontWeight.bold));
      }
    },
  );
}
}