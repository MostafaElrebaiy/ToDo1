import 'package:flutter/material.dart';
import 'package:untitled/widgets/start.dart';

class Cards extends StatelessWidget {
  Function delete;
  Tasks item;

  Cards({
    required this.delete,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Color.fromRGBO(58, 66, 86, 1),
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              item.title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    delete(item);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  item.author,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
