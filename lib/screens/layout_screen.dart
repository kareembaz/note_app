import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/cubit/cubit.dart';
import 'package:notebook/cubit/states.dart';
import 'package:notebook/screens/edit.dart';
import 'package:notebook/share/components/components.dart';

class NodeScreen extends StatelessWidget {
  var textControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NodeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        late var listItem = NoteCubit().get(context).notes;
        return Scaffold(
          backgroundColor: Colors.grey[800],
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Text(
                        'Nodes App',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0),
                          icon: Icon(Icons.filter_list_sharp),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: textControll,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  onTap: () {},
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                      focusColor: Colors.grey,
                      hintText: 'Search notes.....',
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.white,
                      fillColor: Colors.grey[600],
                      filled: true),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => ItemCard(listItem![index]),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.0),
                    itemCount: listItem!.length,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 20.0,
            onPressed: () {
              navigatorTO(context, EditScreen());
            },
            child: Icon(Icons.add),
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey[500],
          ),
        );
      },
    );
  }
}
