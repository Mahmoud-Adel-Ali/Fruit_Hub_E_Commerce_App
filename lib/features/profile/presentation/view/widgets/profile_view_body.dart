import 'package:flutter/material.dart';

import 'about_us_profile_view_section.dart';
import 'global_profile_view_section.dart';
import 'profile_view_header.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Column(
        spacing: 16,
        children: [
          ProfileViewHeader(),
          GlobalProfileViewSection(),
          AboutUsProfileViewSection(),
        ],
      ),
    );
  }
}
