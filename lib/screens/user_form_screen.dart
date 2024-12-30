import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_form_field.dart';
import '../blocs/form_cubit.dart';

class UserFormScreen extends StatelessWidget {
  // 1. Global key to track form validation state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("User Form")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // 2. Attach the key to the Form widget
            child: Column(
              children: [
                CustomFormField(
                  label: "Name",
                  onChanged: (value) => context.read<FormCubit>().updateField('name', value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name'; // Error message if empty
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => context.read<FormCubit>().updateField('email', value),
                  validator: (value) {
                    // Check if email is empty
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Validate email format with regular expression
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "Phone",
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => context.read<FormCubit>().updateField('phone', value),
                  validator: (value) {
                    // Check if phone number is empty
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    // Validate phone number is exactly 10 digits
                    if (value.length != 10) {
                      return 'Phone number must be exactly 10 digits';
                    }
                    // Ensure the phone number contains only numeric digits
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid phone number with only digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "Gender",
                  isDropdown: true,
                  dropdownItems: ["Male", "Female", "Other"],
                  onChanged: (value) => context.read<FormCubit>().updateField('gender', value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender'; // Error message if not selected
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "Country",
                  onChanged: (value) => context.read<FormCubit>().updateField('country', value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your country'; // Error message if empty
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  label: "State",
                  onChanged: (value) => context.read<FormCubit>().updateField('state', value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state'; // Error message if empty
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // 3. Validate the form using FormState.validate()
                    if (_formKey.currentState?.validate() ?? false) {
                      // If form is valid, show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form submitted successfully")),
                      );

                      // Print the form data after successful submission
                      print("Form submitted successfully with data: ${context.read<FormCubit>().state}");
                    } else {
                      // If form is invalid, show error message
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
