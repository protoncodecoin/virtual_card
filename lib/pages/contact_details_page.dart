import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:virtual_card/models/contact_model.dart';
import 'package:virtual_card/providers/contact_provider.dart';
import 'package:virtual_card/utils/helper_functions.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName = 'details';
  final int id;
  const ContactDetailsPage({super.key, required this.id});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  late int id;

  @override
  void initState() {
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => FutureBuilder<ContactModel>(
          future: provider.getContactById(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final contact = snapshot.data;
              return ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  Image.file(
                    File(contact!.image),
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  ListTile(
                    title: Text(contact.mobile),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              _callContact(contact.mobile);
                            },
                            icon: const Icon(Icons.call)),
                        IconButton(
                            onPressed: () {
                              _smsContact(contact.mobile);
                            },
                            icon: const Icon(Icons.sms))
                      ],
                    ),
                  )
                ],
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Failed to Load data"),
              );
            }
            return const Center(
              child: Text("Loading data..."),
            );
          },
        ),
      ),
    );
  }

  void _callContact(String mobile) async {
    //
    final url = 'tel:$mobile';

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      if (context.mounted) showMsg(context, "Cannot perform this task");
    }
  }

  void _smsContact(String mobile) async {
    final url = 'sms:$mobile';

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      if (context.mounted) showMsg(context, "Cannot perform this task");
    }
  }
}
