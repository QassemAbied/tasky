import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/helper/extension.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/routing/routers.dart';
import 'package:tasky/core/theme/app_text_style.dart';
import 'package:tasky/feature/presentation/pages/profile/view/widget/build_list_title.dart';
import 'package:tasky/feature/presentation/pages/profile/view/widget/bulid_change_theme_list_title.dart';
import '../../../controller/user_details_controller/user_details_provider.dart';

class ProfileScreen extends StatelessWidget {
 const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = context.read<UserDetailsProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<UserDetailsProvider>(
                    builder: (BuildContext context, UserDetailsProvider value, Widget? child) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 55,
                                backgroundImage:
                                ( value.image==null)
                                    ? AssetImage(
                                  'assets/images/image_avater.png',
                                )
                                    : FileImage(File(value.image!)),
                                backgroundColor: Colors.transparent,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () async{
                                    showDialogImage(context);
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: context.textSurface,
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: context.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(10),
                          FittedBox(
                            child: Text(
                              value.name??'',
                              style: AppTextStyle.regular(
                                fontSize: 20,
                                color: context.textPrimary,
                              ),
                            ),
                          ),
                          verticalSpace(5.0),
                          Text(
                            value.quote??'',
                            style: AppTextStyle.regular(
                              fontSize: 14,
                              color: context.textSecondary,
                            ),
                          ),
                        ],
                      );
                    },)
                ],
              ),
            ),

            verticalSpace(20.0),
            Text(
              'Profile Info',
              style: AppTextStyle.regular(
                fontSize: 20,
                color: context.textPrimary,
              ),
            ),
            verticalSpace(20.0),
            BuildListTitle(
              image: 'assets/svgs/profile_icon.svg',
              title: 'User Details',
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: () {
                context.pushNamed(
                  Routers.userDetailsScreen,
                  arguments: {'userName': controller.name, 'quote': controller.quote},
                );
              },
            ),

            Divider(),
            BuildChangeThemeListTitle(),
            Divider(),
            BuildListTitle(
              image: 'assets/svgs/logout_icon.svg',
              title: 'Log Out',
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: () async {
                context.read<UserDetailsProvider>().logout();
                context.pushNamedAndRemoveUntil(Routers.onBoardingScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future showDialogImage(BuildContext context) {
 return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: [
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Gallery'),
            onTap: () {
              selectedImagesPicker(ImageSource.gallery,context);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_camera),
            title: Text('Camera'),
            onTap: () {
              selectedImagesPicker(ImageSource.camera,context);
            },
          ),
        ],
      );
    },
  );
}

void selectedImagesPicker(ImageSource imageSource,BuildContext context) async {
  XFile? pickedImage = await ImagePicker().pickImage(source: imageSource);
  if(pickedImage !=null){
    final appDir = await getApplicationDocumentsDirectory();
    final newFile = await File(
      pickedImage.path,
    ).copy('${appDir.path}/${pickedImage.name}');
    context.read<UserDetailsProvider>().uploadImage(newFile.path);
  }

  context.pop();
}
