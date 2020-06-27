library usefulcard;

import 'package:flutter/material.dart';

class CardShadow extends StatefulWidget {
  final bool tap;
  final String title;
  final String contant;
  final String image;
  double size;

  final double pacity;
  final double padding;
  final bool NoLine;
  List<String> Details;
  CardShadow({

    this.title,
    @required this.image,
    this.pacity=0.5,
    this.contant,
    this.size = 300,
    this.padding=5,
    this.tap=true,
    this.Details,
    this.NoLine=false,
  }) : assert(image != null, 'have to send image'),
        assert(size >= 150, 'min height is 150');


  @override
  _CardShadowState createState() => _CardShadowState();
}

class _CardShadowState extends State<CardShadow> with TickerProviderStateMixin {


  void checkExaption(BuildContext context){
    if(widget.size>MediaQuery.of(context).size.height){
      throw('the size is bigger then screen');
    }
    if(widget.Details!=null) {
      if (widget.Details.length > 4) {
        throw('max length of Detail List is 4');
      }
    }
  }
  Widget Textpage1(bool isTitle){
    // print(widget.height);
    if (widget.size < 300 && widget.size >=200 ) {
      if(isTitle==true )
        return getText(widget.title, 15);
      else  {
        return getText(widget.contant, 12);
      }
    }
    if ( widget.size<200 && widget.size>=150) {
      if(isTitle==true)
        return getText(widget.title, 12);
      else {
        return getText(widget.contant, 10);
      }
    }
    if (widget.size >= 300 ) {
      if(isTitle==true)
        return getText(widget.title, 25);
      else{ return getText(widget.contant, 18);}
    }
  }
  @override
  Widget build(BuildContext context) {
    checkExaption(context);
    return SizedBox(
      height: widget.size,
      width: widget.size/3 *2,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Stack(children: [
          BackroundImage(height: widget.size,image: widget.image,pacity: widget.pacity,),
          new SingleChildScrollView(
            child: new Container(
              margin: const EdgeInsets.fromLTRB(0,10, 0, 5),
              child: new Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: widget.tap==true?() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CardShadowItem(
                                    image: widget.image,
                                    title: widget.title,
                                    contant: widget.contant,
                                    pacity: widget.pacity,
                                    Details : widget.Details,
                                    line: widget.NoLine,
                                  )));

                    }:null,
                    child: new Container(
                      alignment: Alignment.center,
                      child: new Container(
                        height: widget.size/3* 2,
                      ),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          image: new DecorationImage(
                            repeat: ImageRepeat.noRepeat,
                            image: typeimage(widget.image),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black,
                                blurRadius: 20.0,
                                offset: new Offset(0.0, 10.0))
                          ]),
                    ),
                  ),

                  Row(
                    children: [
                      Textpage1 (true),
                      Spacer(),

                    ],
                  ),
                  line(widget.NoLine, widget.title,widget.size),
                  Textpage1 (false),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class CardShadowItem extends StatefulWidget {
  final String title;
  final String contant;
  final String image;
  final double pacity;
  final bool line;
  List<String> Details;
  CardShadowItem({
    this.title,
    @required this.image,
    @required this.pacity,
    @required this.line,
    this.contant,
    this.Details,
  }) : assert(image != null, 'have to send image');

  @override
  _CardShadowItemState createState() => _CardShadowItemState();
}

class _CardShadowItemState extends State<CardShadowItem>
    with TickerProviderStateMixin {
  Widget describe(){
    if(widget?.Details?.isEmpty??true && widget.contant.isEmpty){ return null;}
    if(widget?.Details?.isEmpty ??true && widget.contant.isNotEmpty){ return getText(widget.contant,25,);}
    if(widget?.Details?.isNotEmpty??true ){
      if(widget.contant!=null && widget.Details.contains(widget.contant)==false ) {
        widget.Details.add(widget.contant);
      }
      return Column(
        children: new List.generate(widget.Details.length,(i)=>
            getText(widget.Details[i]+"\n",25),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.all(5),
            child: Stack(children: [
              BackroundImage(height: MediaQuery.of(context).size.height,pacity: widget.pacity,
                  image: widget.image
              ),
              new SingleChildScrollView(
                child: new Container(
                  margin: const EdgeInsets.all(12.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        alignment: Alignment.center,
                        child: new Container(
                          height: MediaQuery.of(context).size.height / 3 * 2,
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            image: new DecorationImage(
                              repeat: ImageRepeat.noRepeat,
                              image:typeimage(widget.image),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                  offset: new Offset(0.0, 10.0))
                            ]),
                      ),
                      getText(widget.title, 40,),
                      line(widget.line, widget.title,210),
                      describe(),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
        floatingActionButton: Align(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,size: 35,),
              backgroundColor: Colors.transparent,
            ),
            alignment: Alignment(-1, 0.15)),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      ),
    );
  }
}
class BackroundImage extends StatelessWidget {
  final String image;
  final double height;
  final double pacity;

  BackroundImage({this.height,this.image,@required this.pacity});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height,
      child: new Container(
        alignment: Alignment.center,
        child: new Container(),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.multiply),
            image:typeimage(this.image),
          ),
        ),
      ),
    );
  }
}
Widget getText(String text,double frontsize,){
  if(text==null){
    return SizedBox.shrink();
  }
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(text,
        style: new TextStyle(
            color: Colors.white, fontFamily: 'Arvo',fontSize: frontsize)),
  );
}
Widget line(bool line,String text,double size){
  if(text!=null && line==false && size >=200 ) {
    return Divider(
      thickness: 3,
      color: Colors.grey,
    );
  }
  else return SizedBox.shrink();
}
ImageProvider typeimage(String image){
  if(image.contains('http')){
    return NetworkImage(image);
  }
  else
    return AssetImage(image);
}