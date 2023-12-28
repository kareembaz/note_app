import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/screens/edit_screen/edit_cubit/edit_states.dart';

class EditCubit extends Cubit {
  EditCubit() : super(EditInitialState());

  EditCubit get(context) => BlocProvider.of(context);
}
