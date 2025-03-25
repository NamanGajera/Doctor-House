part of 'home_screen_bloc.dart';

@immutable
class HomeScreenState extends Equatable {
  final bool showCategoryLoader;
  final bool showUpcomingLoader;
  final bool showTopDoctorLoader;
  final bool showTrustedHospitalLoader;
  final List<DoctorCategoryData>? doctorCategoryData;
  final List<AppointmentData>? upcomingAppointment;
  final List<TopDoctor>? topDoctor;
  final List<TopHospital>? trustedHospital;

  const HomeScreenState({
    this.showCategoryLoader = false,
    this.showUpcomingLoader = false,
    this.showTopDoctorLoader = false,
    this.showTrustedHospitalLoader = false,
    this.doctorCategoryData,
    this.upcomingAppointment,
    this.topDoctor,
    this.trustedHospital,
  });

  @override
  List<Object?> get props => [
        showCategoryLoader,
        doctorCategoryData,
        doctorCategoryData,
        showUpcomingLoader,
        showTopDoctorLoader,
        topDoctor,
        showTrustedHospitalLoader,
        trustedHospital,
      ];

  HomeScreenState copyWith({
    bool? showCategoryLoader,
    bool? showUpcomingLoader,
    bool? showTopDoctorLoader,
    bool? showTrustedHospitalLoader,
    List<DoctorCategoryData>? doctorCategoryData,
    List<AppointmentData>? upcomingAppointment,
    List<TopDoctor>? topDoctor,
    List<TopHospital>? trustedHospital,
  }) {
    return HomeScreenState(
      showCategoryLoader: showCategoryLoader ?? this.showCategoryLoader,
      showUpcomingLoader: showUpcomingLoader ?? this.showUpcomingLoader,
      showTopDoctorLoader: showTopDoctorLoader ?? this.showTopDoctorLoader,
      showTrustedHospitalLoader: showTrustedHospitalLoader ?? this.showTrustedHospitalLoader,
      doctorCategoryData: doctorCategoryData ?? this.doctorCategoryData,
      upcomingAppointment: upcomingAppointment ?? this.upcomingAppointment,
      topDoctor: topDoctor ?? this.topDoctor,
      trustedHospital: trustedHospital ?? this.trustedHospital,
    );
  }
}

final class HomeScreenInitialState extends HomeScreenState {}

class AuthFailureState extends HomeScreenState {
  final dynamic statusCode;
  final dynamic message;

  const AuthFailureState({this.message, this.statusCode});
}
