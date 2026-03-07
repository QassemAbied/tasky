
enum UserStaus { initial, loading, loaded, error }
enum LogoutStaus { initial, loading, loaded, error }



class UserDetailsState {

  final UserStaus userStaus;
  final LogoutStaus logoutStaus;
  final String userName;
  final String quote;
  final String error;

  UserDetailsState({
    this.userStaus=UserStaus.initial,
    this.logoutStaus=LogoutStaus.initial,
    this.userName='',
    this.quote='',
    this.error='',
  });
  UserDetailsState copyWith({
    UserStaus? userStaus,
    LogoutStaus? logoutStaus,
    String? userName,
    String? quote,
    String? error
}){
    return UserDetailsState(
      userStaus: userStaus??this.userStaus,
      logoutStaus: logoutStaus??this.logoutStaus,
      userName: userName??this.userName,
      error: error??this.error,
      quote: quote??this.quote,
    );
  }
}

//final class UserDetailsInitial extends UserDetailsState {}
