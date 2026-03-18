import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasky/feature/presentation/controller/user_details_controller/user_details_provider.dart';
import '../../../../../core/common_widgets/dismiss_keyboard_widget.dart';
import '../../../../../core/common_widgets/text_field.dart';
import '../../../../../core/helper/extension.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/app_text_style.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key, required this.userName, required this.quote});
final String userName;
final String quote;
  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
 late final TextEditingController nameUserController ;

late final  TextEditingController motivationController;

@override
  void initState() {
    super.initState();
    nameUserController=TextEditingController(text: widget.userName);
    motivationController=TextEditingController(text: widget.quote);
  }
 @override
 void dispose() {
   nameUserController.dispose();
   motivationController.dispose();
   super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: Scaffold(
        appBar: AppBar(title: Text('User Details')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name',
                      style: AppTextStyle.regular(
                        fontSize: 16,
                        color: context.textPrimary,
                      ),
                    ),
                    verticalSpace(15.0),
                    AppTextFiled(
                      controller: nameUserController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your User Name';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(15.0),
                    Text(
                      'Motivation Quote',
                      style: AppTextStyle.regular(
                        fontSize: 16,
                        color: context.textPrimary,
                      ),
                    ),
                    verticalSpace(15.0),
                    AppTextFiled(
                      controller: motivationController,
                      minLines: 8,
                      maxLines: 12,

                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Motivation Quote';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(15.0),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<UserDetailsProvider>().addUserDetails(
                            nameUserController.text,
                            motivationController.text,
                          );
                          Navigator.pop(context);
                        },
                        child: Text('Save Changes'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
