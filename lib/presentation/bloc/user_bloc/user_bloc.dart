import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/domain/usecases/get_user.dart';
import 'package:e_commerce_app/domain/usecases/login.dart';
import 'package:e_commerce_app/domain/usecases/logout.dart';
import 'package:e_commerce_app/domain/usecases/save_user.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SaveUserUserCase _saveUserUserCase;
  final GetUserUsecase _getUserUsecase;
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  UserBloc({
    required SaveUserUserCase saveUserUserCase,
    required GetUserUsecase getUserUsecase,
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _saveUserUserCase = saveUserUserCase,
        _getUserUsecase = getUserUsecase,
        _loginUseCase = loginUseCase,
        _logoutUseCase = logoutUseCase,
        super(UserState()) {
    on<Login>(_login);
    on<Logout>(_logout);
    on<GetUser>(_getUser);
    on<SaveUser>(_saveUser);
  }

  void _login(Login event, Emitter<UserState> emit) async {
    _loginUseCase();

    emit(state.copyWith(userStatus: UserStatus.login));
  }

  void _logout(Logout event, Emitter<UserState> emit) async {
    _logoutUseCase();

    emit(state.copyWith(userStatus: UserStatus.logout));
  }

  void _getUser(GetUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(userStatus: UserStatus.update));
    UserModel user = await _getUserUsecase();
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
