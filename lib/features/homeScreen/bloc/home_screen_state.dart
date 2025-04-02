part of 'home_screen_bloc.dart';

@immutable
class HomeScreenState extends Equatable {
  final bool showCategoryLoader;
  final bool showUpcomingLoader;
  final bool showTopDoctorLoader;
  final bool showTrustedHospitalLoader;
  final bool showDoctorCategoryDataLoader;
  final bool showDoctorDataFetchLoader;
  final bool showHospitalDataFetchLoader;
  final String? selectedDoctorCategoryId;
  final List<CategoryData>? doctorCategoryData;
  final List<AppointmentData>? upcomingAppointment;
  final List<DoctorDetailsData>? topDoctor;
  final List<DoctorDetailsData>? doctorDataByCategoryId;
  final List<HospitalDetailsData>? trustedHospital;
  final DoctorDetailsData? doctorData;
  final HospitalDetailsData? hospitalData;

  const HomeScreenState({
    this.showCategoryLoader = false,
    this.showUpcomingLoader = false,
    this.showTopDoctorLoader = false,
    this.showTrustedHospitalLoader = false,
    this.showDoctorCategoryDataLoader = false,
    this.showDoctorDataFetchLoader = false,
    this.showHospitalDataFetchLoader = false,
    this.selectedDoctorCategoryId = '1',
    this.doctorCategoryData,
    this.upcomingAppointment,
    this.topDoctor,
    this.trustedHospital,
    this.doctorDataByCategoryId,
    this.doctorData,
    this.hospitalData,
  });

  @override
  List<Object?> get props => [
        showCategoryLoader,
        doctorCategoryData,
        doctorCategoryData,
        showUpcomingLoader,
        showTopDoctorLoader,
        showHospitalDataFetchLoader,
        topDoctor,
        selectedDoctorCategoryId,
        showTrustedHospitalLoader,
        trustedHospital,
        showDoctorCategoryDataLoader,
        doctorDataByCategoryId,
        showDoctorDataFetchLoader,
        doctorData,
        hospitalData,
      ];

  HomeScreenState copyWith({
    bool? showCategoryLoader,
    bool? showUpcomingLoader,
    bool? showTopDoctorLoader,
    bool? showTrustedHospitalLoader,
    bool? showDoctorDataFetchLoader,
    bool? showHospitalDataFetchLoader,
    List<CategoryData>? doctorCategoryData,
    List<AppointmentData>? upcomingAppointment,
    List<DoctorDetailsData>? topDoctor,
    List<HospitalDetailsData>? trustedHospital,
    List<DoctorDetailsData>? doctorDataByCategoryId,
    bool? showDoctorCategoryDataLoader,
    String? selectedDoctorCategoryId,
    DoctorDetailsData? doctorData,
    HospitalDetailsData? hospitalData,
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
      showDoctorDataFetchLoader: showDoctorDataFetchLoader ?? this.showDoctorDataFetchLoader,
      doctorData: doctorData ?? this.doctorData,
      hospitalData: hospitalData ?? this.hospitalData,
      showHospitalDataFetchLoader: showHospitalDataFetchLoader ?? this.showHospitalDataFetchLoader,
    );
  }
}

final class HomeScreenInitialState extends HomeScreenState {}

class AuthFailureState extends HomeScreenState {
  final dynamic statusCode;
  final dynamic message;

  const AuthFailureState({this.message, this.statusCode});
}
