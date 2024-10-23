import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings.dart';
import 'body_view/otp_view_body.dart';

class OtpView extends StatelessWidget {
  final String? email;
  const OtpView({
    super.key,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          title: Text(AppStrings.password, style: TextStyle(fontSize: 18.sp)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: OtpViewBody(
        email: email,
      ),
    );
  }
}
