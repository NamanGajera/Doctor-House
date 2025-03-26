part of 'home_screen_bloc.dart';

@immutable
class HomeScreenState extends Equatable {
  final bool showCategoryLoader;
  final bool showUpcomingLoader;
  final bool showTopDoctorLoader;
  final bool showTrustedHospitalLoader;
  final bool showDoctorCategoryDataLoader;
  final String? selectedDoctorCategoryId;
  final List<CategoryData>? doctorCategoryData;
  final List<AppointmentData>? upcomingAppointment;
  final List<DoctorDetailsData>? topDoctor;
  final List<DoctorDetailsData>? doctorDataByCategoryId;
  final List<HospitalDetailsData>? trustedHospital;

  const HomeScreenState({
    this.showCategoryLoader = false,
    this.showUpcomingLoader = false,
    this.showTopDoctorLoader = false,
    this.showTrustedHospitalLoader = false,
    this.showDoctorCategoryDataLoader = false,
    this.selectedDoctorCategoryId = '1',
    this.doctorCategoryData,
    this.upcomingAppointment,
    this.topDoctor,
    this.trustedHospital,
    this.doctorDataByCategoryId,
  });

  @override
  List<Object?> get props => [
        showCategoryLoader,
        doctorCategoryData,
        doctorCategoryData,
        showUpcomingLoader,
        showTopDoctorLoader,
        topDoctor,
        selectedDoctorCategoryId,
        showTrustedHospitalLoader,
        trustedHospital,
        showDoctorCategoryDataLoader,
        doctorDataByCategoryId,
      ];

  HomeScreenState copyWith({
    bool? showCategoryLoader,
    bool? showUpcomingLoader,
    bool? showTopDoctorLoader,
    bool? showTrustedHospitalLoader,
    List<CategoryData>? doctorCategoryData,
    List<AppointmentData>? upcomingAppointment,
    List<DoctorDetailsData>? topDoctor,
    List<HospitalDetailsData>? trustedHospital,
    List<DoctorDetailsData>? doctorDataByCategoryId,
    bool? showDoctorCategoryDataLoader,
    String? selectedDoctorCategoryId,
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
      selectedDoctorCategoryId: selectedDoctorCategoryId ?? this.selectedDoctorCategoryId,
      doctorDataByCategoryId: doctorDataByCategoryId ?? this.doctorDataByCategoryId,
      showDoctorCategoryDataLoader: showDoctorCategoryDataLoader ?? this.showDoctorCategoryDataLoader,
    );
  }
}

final class HomeScreenInitialState extends HomeScreenState {}

class AuthFailureState extends HomeScreenState {
  final dynamic statusCode;
  final dynamic message;

  const AuthFailureState({this.message, this.statusCode});
}
