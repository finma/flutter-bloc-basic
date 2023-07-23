import 'package:bloc/bloc.dart';

class ThemeBloc extends Cubit<bool> {
  ThemeBloc() : super(true);

  void changeTheme() => emit(!state);

  @override
  void onChange(Change<bool> change) {
    print(change);
    super.onChange(change);
  }
}
