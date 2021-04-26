import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Container(
            height: 50,
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              indicatorColor: Colors.transparent,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 18,
                  ),
                  child: Text(
                    '편지',
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    "icon_char.png",
                    fit: BoxFit.contain,
                  ),
                  child: Text(
                    '채팅',
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 18,
                  ),
                  child: Text(
                    '홈',
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.list,
                    size: 18,
                  ),
                  child: Text(
                    '뉴스레터',
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.list,
                    size: 18,
                  ),
                  child: Text(
                    '테스트',
                    style: TextStyle(fontSize: 9),
                  ),
                ),
              ],
            )));
  }
}
