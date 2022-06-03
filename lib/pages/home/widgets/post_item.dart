// (lib/pages/home/widgets/post_item.dart)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({required this.index});
  
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
		      //TODO: 投稿のモデルが出来次第追加
                      backgroundImage: NetworkImage(),
                    ),
                  ),
		  //TODO: 投稿のモデルが出来次第追加
                  Text(''),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints.expand(height: 1),
          color: Colors.grey,
        ),
        Container(
          constraints: BoxConstraints(maxHeight: 282),
          decoration: BoxDecoration(
            image: DecorationImage(
	    //TODO: 投稿のモデルが出来次第追加
              image: NetworkImage(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.mode_comment,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.mode_comment),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        TextButton(
          child: Text(
	  //TODO: 投稿のモデルが出来次第追加
            5.toString() + " likes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onPressed: () {},
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 10),
              child: Text(
	      //TODO: 投稿のモデルが出来次第追加
	        '',
                style: TextStyleTheme.textStyleBold,
              ),
            ),
	    //TODO: 投稿のモデルが出来次第追加
            Text(''),
          ],
        ),
        TextButton(
          child: Text(
	  //TODO: 投稿のモデルが出来次第追加
            "View all " + "3" + " comments",
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () {},
        ),
      ],
    ));
  }
}
