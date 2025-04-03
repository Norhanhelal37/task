import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenUtilExtension on num {

  Widget get hs => SizedBox(width: w); 

  Widget get vs => SizedBox(height: h);

  
  EdgeInsetsDirectional get all => EdgeInsetsDirectional.all(toDouble().r);
  


  EdgeInsetsDirectional get ph =>
      EdgeInsetsDirectional.symmetric(horizontal: toDouble().w);
   
  EdgeInsetsDirectional get pv =>
      EdgeInsetsDirectional.symmetric(vertical: toDouble().h);
 

  EdgeInsets get allEdgeInsets => EdgeInsets.all(toDouble().r);
  
}

extension BuildContextExtension on BuildContext {

  MediaQueryData get mediaQuery => MediaQuery.of(this);


  double get screenWidth => mediaQuery.size.width;

  double get screenHeight => mediaQuery.size.height;

  
}
