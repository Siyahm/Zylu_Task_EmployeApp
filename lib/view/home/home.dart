import 'package:employee_app/view/add_screen/add_screen.dart';
import 'package:employee_app/view/home/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, index) => const ListTileWidget(),
            separatorBuilder: (context, index) => const Divider(
                  thickness: 2,
                  height: 2,
                ),
            itemCount: 3),
      ),
      floatingActionButton: CircleAvatar(
        radius: 25,
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddScreen(),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
