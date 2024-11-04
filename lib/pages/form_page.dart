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
  final _mobieController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _webController = TextEditingController();
  final _designationController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.contactModel.name;
    _mobieController.text = widget.contactModel.mobile;
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
    _mobieController.dispose();
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
            )
          ],
        ),
      ),
    );
  }
}
