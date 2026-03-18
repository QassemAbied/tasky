import 'package:flutter/widgets.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/helper/shared_pref.dart';
import '../../../domain/usecases/add_quote_usecase.dart';
import '../../../domain/usecases/add_user_name_use_case.dart';
import '../../../domain/usecases/get_image_usecase.dart';
import '../../../domain/usecases/get_quote_usecase.dart';
import '../../../domain/usecases/get_user_name_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../domain/usecases/upload_image_usecase.dart';

class UserDetailsProvider with ChangeNotifier {
  final AddUserNameUseCase addUserNameUseCase;
  final LogoutUseCase logoutUseCase;
  final GetUserNameUseCase getUserNameUseCase;
  final GetQuoteUseCase getQuoteUseCase;
  final AddQuoteUseCase addQuoteUseCase;
  final GetImageUseCase getImageUseCase;
  final UploadImageUseCase uploadImageUseCase;

  UserDetailsProvider(
    this.addUserNameUseCase,
    this.logoutUseCase,
    this.getUserNameUseCase,
    this.getQuoteUseCase,
    this.addQuoteUseCase,
    this.getImageUseCase,
    this.uploadImageUseCase,
  );

  String? image;
  String? name;
  String? quote;

  Future<void> addUserDetails(String userName, String quoteNotes) async {
    await addUserNameUseCase(userName);
    await addQuoteUseCase(quoteNotes);
    name=userName;
    quote=quoteNotes;
   notifyListeners();
  }

  Future getImage() async {
    image= await getImageUseCase();
    notifyListeners();
  }

  Future uploadImage(String imagePath) async {
    await uploadImageUseCase.call(imagePath);
    image=imagePath;
    notifyListeners();
  }

  void getUserDetails() {
   name= getUserNameUseCase();
   quote= getQuoteUseCase();
    notifyListeners();
  }

  Future logout() async {
    await logoutUseCase();
    await SharedPrefHelper.setData(
        key: AppConstants.onBoardingKey, value: false);

    notifyListeners();
  }
}
