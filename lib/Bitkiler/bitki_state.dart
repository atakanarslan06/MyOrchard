import 'package:equatable/equatable.dart';
import '../model/bitki_model.dart';
import 'bloc_status.dart';

class BitkiState extends Equatable {
  final BitkiCardModel? bitkiCardModel;
  final AppSubmissionStatus appStatus;

  const BitkiState({
    this.bitkiCardModel,
    this.appStatus = const InitialStatus(),
  });

  BitkiState copyWith({
    BitkiCardModel? bitkiCardModel,
    AppSubmissionStatus? appStatus,
  }) {
    return BitkiState(
      bitkiCardModel: bitkiCardModel ?? this.bitkiCardModel,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [bitkiCardModel, appStatus];
}