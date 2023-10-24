import 'package:flutter/material.dart';


class DetectedFaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff4f4),
      appBar:
      AppBar(
        elevation:0,
        centerTitle:true,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xfffff4f4),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:Text(
          "Detected Faces",
          style:TextStyle(
            fontWeight:FontWeight.w400,
            fontStyle:FontStyle.normal,
            fontSize:14,
            color:Color(0xff000000),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color:Color(0xff212435),
          size:24,
        ),
      ),
      body:SingleChildScrollView(
        child:
        Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisSize:MainAxisSize.max,
          children: [

            GridView(
              padding:EdgeInsets.all(16),
              shrinkWrap:true,
              scrollDirection:Axis.vertical,
              physics:ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing:8,
                mainAxisSpacing:8,
                childAspectRatio:0.68,
              ),
              children:[

                Card(
                  margin:EdgeInsets.all(5),
                  color:Color(0xffffffff),
                  shadowColor:Color(0xff000000),
                  elevation:1,
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(25.0),
                  ),
                  child:
                  Padding(
                    padding:EdgeInsets.all(8),
                    child:
                    Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisSize:MainAxisSize.min,
                      children: [
                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        Image(
                          image:NetworkImage("https://image.freepik.com/free-psd/simple-black-men-s-tee-mockup_53876-57893.jpg"),
                          height:MediaQuery.of(context).size.height * 0.15,
                          width:MediaQuery.of(context).size.width,
                          fit:BoxFit.cover,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding:EdgeInsets.all(20),
                            child:
                            Column(
                              mainAxisAlignment:MainAxisAlignment.start,
                              crossAxisAlignment:CrossAxisAlignment.center,
                              mainAxisSize:MainAxisSize.min,
                              children: [
                                Text(
                                  "Sam Dy",
                                  textAlign: TextAlign.start,
                                  maxLines:1,
                                  overflow:TextOverflow.clip,
                                  style:TextStyle(
                                    fontWeight:FontWeight.w700,
                                    fontStyle:FontStyle.normal,
                                    fontSize:12,
                                    color:Color(0xff000000),
                                  ),
                                ),
                                Padding(
                                  padding:EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child:Text(
                                    "3.1465245",
                                    textAlign: TextAlign.start,
                                    maxLines:1,
                                    overflow:TextOverflow.clip,
                                    style:TextStyle(
                                      fontWeight:FontWeight.w200,
                                      fontStyle:FontStyle.normal,
                                      fontSize:8,
                                      color:Color(0xff7c7c7c),
                                    ),
                                  ),
                                ),
                              ],),),),
                      ],),),
                ),
              ],),
          ],),),
    )
    ;}
}
