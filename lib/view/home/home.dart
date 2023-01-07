import 'package:employee_app/controller/add_screen_controller.dart';
import 'package:employee_app/controller/home_controller.dart';
import 'package:employee_app/view/add_screen/add_screen.dart';
import 'package:employee_app/view/home/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);

    // final addScreenController =
    //     Provider.of<AddScreenController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.getAllEmployees();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<HomeController>(
          builder: (context, value, child) => ListView.separated(
            itemBuilder: (context, index) => ListTileWidget(
              index: index,
            ),
            separatorBuilder: (context, index) => const Divider(
              thickness: 2,
              height: 2,
            ),
            itemCount: value.employeeList.length,
          ),
        ),
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
