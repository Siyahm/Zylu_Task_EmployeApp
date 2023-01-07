import 'package:employee_app/controller/add_screen_controller.dart';
import 'package:employee_app/view/add_screen/widgets/employee_status_widget.dart';
import 'package:employee_app/view/add_screen/widgets/text_formfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addScreenController =
        Provider.of<AddScreenController>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employees'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const EmployeeStatusWidget(),
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
                Consumer<AddScreenController>(
                  builder: (context, value, child) => Stack(
                    children: [
                      TextFormFieldWidget(
                        label: 'dd/mm/yy',
                        controller: value.dateController,
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          await value.showDate(context);
                          // value.pickDate();
                        },
                      ),
                      Positioned(
                        right: 12,
                        top: 5,
                        child: IconButton(
                          onPressed: () async {
                            await value.showDate(context);
                            // value.pickDate();
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, size.height * 0.06),
                  ),
                  onPressed: () {
                    addScreenController.addEmployee(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
