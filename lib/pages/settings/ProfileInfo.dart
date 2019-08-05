import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/fragments/exports.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionHeader(
          title: "Profile Information",
          icon: Icons.person_outline,
        ),
        TappableElement(
          label: "Edit Account",
          icon: Icons.person_pin_circle,
          onTap: () => {},
        ),
        TappableElement(
          label: "Update Grades",
          icon: Icons.loop,
          onTap: () => {},
        ),
        TappableElement(
          label: "Download Data",
          icon: Icons.file_download,
          onTap: () => {},
        ),
        TappableElement(
          label: "Request Deletion",
          icon: Icons.delete,
          color: Colors.red.shade400,
          onTap: () => {},
        ),
      ],
    );
  }
}
