import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_form_field.dart';
import '../blocs/form_cubit.dart';

class UserFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("User Form")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                CustomFormField(
                  label: "Name",
                  onChanged: (value) => context.read<FormCubit>().updateField('name', value),
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => context.read<FormCubit>().updateField('email', value),
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "Phone",
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => context.read<FormCubit>().updateField('phone', value),
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "Gender",
                  isDropdown: true,
                  dropdownItems: ["Male", "Female", "Other"],
                  onChanged: (value) => context.read<FormCubit>().updateField('gender', value),
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "Country",
                  onChanged: (value) => context.read<FormCubit>().updateField('country', value),
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "State",
                  onChanged: (value) => context.read<FormCubit>().updateField('state', value),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (context.read<FormCubit>().validateForm()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form submitted successfully")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all required fields")),
                      );
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
