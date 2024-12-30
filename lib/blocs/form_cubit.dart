import 'package:bloc/bloc.dart';

class FormCubit extends Cubit<Map<String, dynamic>> {
  FormCubit() : super({});

  void updateField(String key, dynamic value) {
    final currentState = Map<String, dynamic>.from(state);
    currentState[key] = value; // Debug log to show updated field
    emit(currentState);
  }

  bool validateForm() {
    final requiredFields = ['name', 'email', 'phone', 'gender', 'country', 'state', 'city'];
    for (final field in requiredFields) {
      if (!state.containsKey(field) || state[field] == null || state[field].toString().isEmpty) {
        return false;
      }
    }
    return true;
  }
}
