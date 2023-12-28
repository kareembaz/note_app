import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notebook/cubit/cubit.dart';
import 'package:notebook/cubit/states.dart';

class EditScreen extends StatelessWidget {
  var titleControll = TextEditingController();
  var bodyControll = TextEditingController();

  // var dateTime =DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NodeStates>(
      listener: (context, state) {
        if (state is insertIntoDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        // var cubit = NodeCubit().get(context).insertIntoDatabase();
        return Scaffold(
          backgroundColor: Colors.grey[800],
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 20.0, bottom: 20.0),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.arrow_back_ios_new),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: titleControll,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white, fontSize: 30.0),
                onTap: () {},
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.symmetric(vertical: 12),
                  focusColor: Colors.grey,
                  border: InputBorder.none,
                  hintText: 'Title ',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
              TextFormField(
                controller: bodyControll,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                ),
                onTap: () {},
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.symmetric(vertical: 12),
                  focusColor: Colors.grey,
                  border: InputBorder.none,
                  hintText: 'Type something here...... ',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 20.0,
            onPressed: () {
              NoteCubit().get(context).insertIntoDatabase(
                    title: titleControll.text,
                    body: bodyControll.text,
                    date: DateFormat.yMMMd().format(DateTime.now()).toString(),
                    time: TimeOfDay.now().format(context).toString(),
                  );
            },
            child: Icon(Icons.save),
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey[500],
          ),
        );
      },
    );
  }
}
