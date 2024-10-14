import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/di/di.dart';
import '../../view_models/forget_password/forget_password_view_model.dart';
import 'body_view/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key,});

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
      body: const OtpViewBody(),
    );
  }
}
