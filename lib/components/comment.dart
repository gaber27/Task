import 'package:bhi/icons/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import '../constants/color.dart';



Widget comment({
  required IconData img ,
  required String name ,
  required String content ,
  required String numOfLikes,
  required String time ,
  required bool isLike ,
  required bool isMain ,


}) => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [

        AdvancedAvatar(
          child: Icon(
            img,
            color: Colors.deepOrange,
            size: 40,
          ),
        ),
        Text(name,style: TextStyle(color: headColor,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1),),
        SizedBox(width: 5,),
        Text(time,style: TextStyle(color: headColor,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1),)
      ],
    ),
    Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Text(content,style: TextStyle(color: Colors.grey[400],fontSize: 20,fontWeight: FontWeight.w700,letterSpacing: 1),),
    ),
    SizedBox(height: 25,),
    Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(' ...',style: TextStyle(color: headColor,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1,),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.reply_rounded,color: headColor,size: 30,),
          ),
          isMain?
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(' Reply',style: TextStyle(color: headColor,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1,),),
          ):
          Text(''),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(BhiIcon.up_bold,color: headColor,size: 30,),
          ),
          isLike?
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(numOfLikes,style: TextStyle(color: headColor,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1,),),
          )
              : Padding(
            padding: const EdgeInsets.only(right: 8.0),
                child: Icon(BhiIcon.angle_double_down,color: headColor,size: 30,),
              ),
          Icon(BhiIcon.down_bold,color: headColor,size: 30,),

        ],
      ),
    )

  ],
);
