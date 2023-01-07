import 'package:employee_app/controller/add_screen_controller.dart';
import 'package:employee_app/view/add_screen/widgets/employee_status_widget.dart';
import 'package:employee_app/view/add_screen/widgets/text_formfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final addScreenController =
        Provider.of<AddScreenController>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employees'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<AddScreenController>(
                builder: (context, value, child) =>
                    const EmployeeStatusWidget(),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextFormFieldWidget(
                label: 'Full Name',
                controller: addScreenController.nameController,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextFormFieldWidget(
                label: 'Date',
                controller: addScreenController.dateController,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, size.height * 0.06),
                ),
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
