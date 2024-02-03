import 'package:flutter/material.dart';

  double getResponsiveFontSize(context ,{required double fontSize}){

    double scaleFactor = getScaleFactor(context) ;

    double  responsiveFontSize = fontSize * scaleFactor ;
    double  minFontSize = fontSize *.8 ;
    double  maxFontSize = fontSize *1.2 ;
   return responsiveFontSize.clamp(minFontSize, maxFontSize) ;
  }
  double getScaleFactor(context) {
    double width =MediaQuery.sizeOf(context).width ;
    if(width < 500 ){
      return  width / 400;
    }
    else if (width < 900){
      return   width / 700;

    }else{
      return  width / 1000;

    }
  }



