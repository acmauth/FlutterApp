import 'package:flutter/material.dart';
import 'package:grade_plus_plus/Router.dart';
import 'package:grade_plus_plus/pages/fragments/exports.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionHeader(
          title: 'Profile Information',
          icon: Icons.person_outline,
        ),
        TappableElement(
          label: 'Edit Account',
          icon: Icons.person_pin_circle,
          onTap: () => Router.push(context, '/edit_account'),
        ),
        TappableElement(
          label: 'Update Grades',
          icon: Icons.loop,
          onTap: () => Router.push(context, '/update_grades'),
        ),
        TappableElement(
          label: 'Download Data',
          icon: Icons.file_download,
          onTap: () => Router.push(context, '/download_data'),
        ),
        TappableElement(
          label: 'Request Deletion',
          icon: Icons.delete,
          color: Colors.red.shade400,
          onTap: () => Router.push(context, '/request_deletion'),
        ),
      ],
    );
  }
}
