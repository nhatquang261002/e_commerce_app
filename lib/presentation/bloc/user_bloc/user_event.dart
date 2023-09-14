// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUser extends UserEvent {
  final String email;
  const GetUser({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class SaveUser extends UserEvent {
  final UserModel user;

  const SaveUser({required this.user});

  @override
  List<Object> get props => [user];
}
