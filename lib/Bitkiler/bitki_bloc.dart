import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/bitki_services.dart';
import 'bitki_event.dart';
import 'bitki_state.dart';
import 'bloc_status.dart';

class BitkiBloc extends Bloc<BitkiEvent, BitkiState> {
  final BitkiService? bitkiServ;

  BitkiBloc({this.bitkiServ}) : super(const BitkiState()) {
    on<BitkiEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(BitkiEvent event, Emitter<BitkiState> emit) async {
    if (event is BitkiGetCardData) {
      emit(state.copyWith(appStatus: SubmissionLoading()));
      try {
        await bitkiServ?.getBitkiCard();
        emit(state.copyWith(appStatus: const SubmissionSuccess()));
        emit(state.copyWith(bitkiCardModel: await bitkiServ?.getBitkiCard()));
      } catch (e) {
        emit(state.copyWith(appStatus: SubmissionFailed(e)));
      }
    }
  }
}