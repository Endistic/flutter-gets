import 'package:flutter/material.dart';
import 'package:getx_state_management/data/color_data.dart';
import 'package:getx_state_management/model/color_item.dart';


class ColorListScreen extends StatefulWidget {
  final Function(ColorItem)? onColorItemSelected;

  ColorListScreen({Key? key, this.onColorItemSelected}) : super(key: key);

  @override
  _ColorListScreenState createState() => _ColorListScreenState();
}

class _ColorListScreenState extends State<ColorListScreen> {
  
  @override
  Widget build(BuildContext context) {
    print('Color ${ColorData.colors}');
    return Scaffold(
      appBar: AppBar(title: Text("Color Screen"), automaticallyImplyLeading: true),
        body: ListView.builder(
            itemCount: ColorData.colors.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  color:  ColorData.colors[index].color,
                ),
                tileColor: Colors.grey[100],
                title: Text(ColorData.colors[index].title.toString()),
                onTap: () {
                  widget.onColorItemSelected?.call(ColorData.colors[index]);
                },
              );
            }));
  }
}