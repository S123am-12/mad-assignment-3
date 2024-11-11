import 'package:flutter/material.dart';
class Demise extends StatefulWidget {
  const Demise({super.key});

  @override
  State<Demise> createState() => _DemiseState();
}

class _DemiseState extends State<Demise> {
  Offset _startLastoffset=Offset.zero;
  Offset _lastOffset=Offset.zero;
  Offset _currentoffset=Offset.zero;
  double _lastscale=1.0;
  double _currentscale=1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrix'),),
        body: _buildBody(context),
    );
  }
  Widget _buildBody(BuildContext context){
    return GestureDetector(
      onScaleStart: _oneScaleStart,
      onScaleUpdate: _ScaleUpdate,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
      child: Stack(
        fit:StackFit.expand,
        children: [
          _transformScaleAndTranslate(),
          _positionedStatusBar(),
          _positioninkwell(context),
        ],
      ),
    );
  }
  Transform _transformScaleAndTranslate(){
    return Transform.scale(
      scale: _currentscale,
      child: Transform.translate(
        offset: _currentoffset,
        child: Image.asset('images/panda.jpg'),
        ),
    );
  }
  Positioned _positionedStatusBar(){
    return Positioned(
      top: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,

        height:50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Scale: ${_currentscale.toStringAsFixed(4)}',
            ),
            Text(
              'Current:$_currentoffset',
            ),
          ],
        ),
      ),
    );
    
  }
  void _oneScaleStart(ScaleStartDetails details){
    print('Scale started at: $details');
    _startLastoffset=details.focalPoint;
    _lastOffset=_currentoffset;
    _lastscale=_currentscale;
  }
  void _ScaleUpdate(ScaleUpdateDetails details){
    print('Scale updated details: $details - Scale: ${details.scale},');
    if(details.scale !=0){
      double currentScale=_lastscale*details.scale;

    
    if(currentScale < 0.5){
      currentScale=0.5;
    }
    setState(() {
      _currentscale=currentScale;
    });
    print('New scale: $_currentscale - _lastscale: $_lastscale');
    }else if(details.scale==1.0){
      Offset offsetAdjust=(_startLastoffset-_lastOffset)/_lastscale;
      Offset currentoffset=details.focalPoint -(offsetAdjust*_currentscale);
      setState(() {
        _currentoffset=currentoffset;
      });
      print('offdetails: $offsetAdjust -_currentoffset: $_currentoffset');
    }
  } 
    void _onDoubleTap(){
    print('Double tap');
    double currentscale=_lastscale *2.0;
    if(currentscale > 16.0){
      currentscale=1.0;
      _resettodefault();
    }
    _lastscale=currentscale;
    setState(() {
      _currentscale=currentscale;
    });
  }
  void _onLongPress(){
    print('Long press');
    setState(() {
      _resettodefault();
    });
    
  }
  void _resettodefault(){
    _startLastoffset=Offset.zero;
    _lastOffset=Offset.zero;
    _currentoffset=Offset.zero;
    _lastscale=1.0;
    _currentscale=1.0;
  }
  /// A positioned widget that contains a row of two buttons.
  ///
  /// The first button is an InkWell that changes the scale of the image when
  /// tapped, double tapped, or long pressed. The second button is an InkResponse
  /// that resets the scale to the default when tapped.
  ///
  /// The buttons are positioned at the top of the screen and are evenly spaced
  /// horizontally.
  ///
  /// This widget is used in the [Matrix] widget to control the scale of the
  /// image.
  ///
  Positioned _positioninkwell(BuildContext context){
    return Positioned(
      top: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            splashColor: Colors.lightGreenAccent,
          highlightColor: Colors.lightBlueAccent,
          onTap: _setscalesmall,
          onDoubleTap: _setscalrbig,
          onLongPress: _onLongPress,
            child: Container(
              height: 48,
              width: 128,
              child: Icon(Icons.touch_app,
              size: 32,
              ),
            ),

          ),
          InkResponse(
            splashColor: Colors.lightGreenAccent,
            highlightColor: Colors.lightBlueAccent,
            onTap: _setscalrbig,
            onLongPress: _onLongPress,
            child: Container(
              height: 48,
              width: 128,
              child: Icon(Icons.touch_app,
              size: 32,
              ),
            ),
          )
         
        ],
      ),

    );
  }
  void _setscalesmall(){
    setState(() {
      _currentscale=0.5;
    });
  }
  void _setscalrbig(){
    setState(() {
      _currentscale=16.0;
    });
  }
}
