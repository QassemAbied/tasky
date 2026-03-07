import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/feature/domain/usecases/add_quote_usecase.dart';
import 'package:tasky/feature/domain/usecases/get_quote_usecase.dart';
import 'package:tasky/feature/domain/usecases/logout_usecase.dart';
import 'package:tasky/feature/presentation/controller/user_details/user_details_state.dart';

import '../../../domain/usecases/add_user_name_use_case.dart';
import '../../../domain/usecases/get_user_name_usecase.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final AddUserNameUseCase addUserNameUseCase;
  final LogoutUseCase logoutUseCase;
  final GetUserNameUseCase getUserNameUseCase;
  final GetQuoteUseCase getQuoteUseCase;
  final AddQuoteUseCase addQuoteUseCase;
  UserDetailsCubit(
    this.addUserNameUseCase,
    this.getUserNameUseCase,
    this.addQuoteUseCase,
    this.getQuoteUseCase,
    this.logoutUseCase,
  ) : super(UserDetailsState());

  Future<void> addUserDetails(String userName, String quote) async {
    try {
      emit(state.copyWith(userStaus: UserStaus.loading));

      await addUserNameUseCase(userName);
      await addQuoteUseCase(quote);

      emit(
        state.copyWith(
          userStaus: UserStaus.loaded,
          userName: userName,
          quote: quote,
        ),
      );
    } catch (e) {
      emit(state.copyWith(userStaus: UserStaus.error, error: e.toString()));
    }
  }

  void getUserDetails() {
    try {
      final name = getUserNameUseCase();
      final quote = getQuoteUseCase();

      emit(
        state.copyWith(
          userStaus: UserStaus.loaded,
          userName: name ?? '',
          quote: quote ?? '',
        ),
      );
    } catch (e) {
      emit(state.copyWith(userStaus: UserStaus.error, error: e.toString()));
    }
  }

  Future logout() async {
    emit(state.copyWith(logoutStaus: LogoutStaus.loading));
    try {
      await logoutUseCase();
      emit(state.copyWith(logoutStaus: LogoutStaus.loaded));
    } catch (error) {
      emit(
        state.copyWith(logoutStaus: LogoutStaus.error, error: error.toString()),
      );
    }
  }
}
