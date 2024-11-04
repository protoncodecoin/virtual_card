import 'package:flutter/material.dart';
import 'package:virtual_card/models/contact_model.dart';
import 'package:virtual_card/utils/constants.dart';

class FormPage extends StatefulWidget {
  static const String routeName = 'form';
  final ContactModel contactModel;

  const FormPage({super.key, required this.contactModel});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _webController = TextEditingController();
  final _designationController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.contactModel.name;
    _mobileController.text = widget.contactModel.mobile;
    _addressController.text = widget.contactModel.address;
    _emailController.text = widget.contactModel.email;
    _companyController.text = widget.contactModel.company;
    _webController.text = widget.contactModel.website;
    _designationController.text = widget.contactModel.designation;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _webController.dispose();
    _designationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Page"),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Contact Name",
                prefixIcon: Icon(Icons.person),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyFieldErrorMsg;
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: _mobileController,
              decoration: const InputDecoration(
                labelText: "Mobile Number",
                prefixIcon: Icon(Icons.phone),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyFieldErrorMsg;
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email Address",
                prefixIcon: Icon(Icons.email),
                border: InputBorder.none,
              ),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: "Street Address",
                prefixIcon: Icon(Icons.location_city),
                border: InputBorder.none,
              ),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _companyController,
              decoration: const InputDecoration(
                labelText: "Company Name",
                prefixIcon: Icon(Icons.business),
                border: InputBorder.none,
              ),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _designationController,
              decoration: const InputDecoration(
                labelText: "Designation",
                prefixIcon: Icon(Icons.work),
                border: InputBorder.none,
              ),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _webController,
              decoration: const InputDecoration(
                labelText: "Website",
                prefixIcon: Icon(Icons.pages),
                border: InputBorder.none,
              ),
              validator: (value) {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
