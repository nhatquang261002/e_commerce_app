// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

enum UserStatus { login, logout, update }

class UserState extends Equatable {
  UserStatus userStatus;
  UserModel user;

  UserState({
    this.userStatus = UserStatus.logout,
    this.user = const UserModel(
        firstName: '',
        lastName: '',
        location: '',
        phoneNumber: null,
        email: '',
        password: ''),
  });

  @override
  List<Object> get props => [userStatus, user];

  UserState copyWith({
    UserStatus? userStatus,
    UserModel? user,
  }) {
    return UserState(
      userStatus: userStatus ?? this.userStatus,
      user: user ?? this.user,
    );
  }
}
