part of 'home_screen_bloc.dart';

@immutable
class HomeScreenState extends Equatable {
  final bool showCategoryLoader;
  final bool showUpcomingLoader;
  final List<DoctorCategoryData>? doctorCategoryData;
  final List<AppointmentData>? upcomingAppointment;

  const HomeScreenState({
    this.showCategoryLoader = false,
    this.showUpcomingLoader = false,
    this.doctorCategoryData,
    this.upcomingAppointment,
  });

  HomeScreenState copyWith({
    bool? showCategoryLoader,
    bool? showUpcomingLoader,
    List<DoctorCategoryData>? doctorCategoryData,
    List<AppointmentData>? upcomingAppointment,
  }) {
    return HomeScreenState(
      showCategoryLoader: showCategoryLoader ?? this.showCategoryLoader,
      doctorCategoryData: doctorCategoryData ?? this.doctorCategoryData,
      upcomingAppointment: upcomingAppointment ?? this.upcomingAppointment,
      showUpcomingLoader: showUpcomingLoader ?? this.showUpcomingLoader,
    );
  }

  @override
  List<Object?> get props => [
        showCategoryLoader,
        doctorCategoryData,
        doctorCategoryData,
        showUpcomingLoader,
      ];
}

final class HomeScreenInitialState extends HomeScreenState {}

class AuthFailureState extends HomeScreenState {
  final dynamic statusCode;
  final dynamic message;

  const AuthFailureState({this.message, this.statusCode});
}
