abstract class NewsState{}

class InitialState extends NewsState{}

class BottomNavState extends NewsState {}

class GetBusinessNewsLoading extends NewsState {}

class GetBusinessNewsSuccess extends NewsState {}

class GetBusinessNewsError extends NewsState {
  final String error;
  GetBusinessNewsError(this.error);
}

class GetSportNewsLoading extends NewsState {}

class GetSportNewsSuccess extends NewsState {}

class GetSportNewsError extends NewsState {
  final String error;
  GetSportNewsError(this.error);
}

class GetScienceNewsLoading extends NewsState {}

class GetScienceNewsSuccess extends NewsState {}

class GetScienceNewsError extends NewsState {
  final String error;
  GetScienceNewsError(this.error);
}
