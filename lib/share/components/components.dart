import 'package:flutter/material.dart';

Widget ItemCard(Map? model) => Card(
      key: Key(model!['id'].toString()),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: ListTile(
        title: RichText(
          text: TextSpan(
              text: '${model['title']} :\n',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                height: 1.5,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${model['body']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ]),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Edited : ${model['time']}   ${model['date']}',
            style: TextStyle(
              fontSize: 10,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
          color: Colors.grey,
        ),
      ),
    );

Future navigatorTO(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));
