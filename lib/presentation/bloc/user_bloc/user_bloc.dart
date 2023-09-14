import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/domain/usecases/get_user.dart';
import 'package:e_commerce_app/domain/usecases/save_user.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SaveUserUserCase _saveUserUserCase;
  final GetUserUsecase _getUserUsecase;

  UserBloc({
    required SaveUserUserCase saveUserUserCase,
    required GetUserUsecase getUserUsecase,
  })  : _saveUserUserCase = saveUserUserCase,
        _getUserUsecase = getUserUsecase,
        super(UserState()) {
    on<GetUser>(_getUser);
    on<SaveUser>(_saveUser);
  }

  void _getUser(GetUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(userStatus: UserStatus.logout));
    UserModel user = await _getUserUsecase(email: event.email);
    emit(state.copyWith(
      user: user,
      userStatus: UserStatus.login,
    ));
  }

  void _saveUser(SaveUser event, Emitter<UserState> emit) async {
    UserModel user = event.user;
    emit(state.copyWith(userStatus: UserStatus.update));
    await _saveUserUserCase(user: user);
    print(user.location);
    emit(state.copyWith(
      userStatus: UserStatus.login,
      user: event.user,
    ));
  }
}
