part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class GetDoctorCategoryEvent extends HomeScreenEvent {}

class GetUpcomingScheduleEvent extends HomeScreenEvent {
  final Map<String, dynamic> upcomingDataBody;

  GetUpcomingScheduleEvent({required this.upcomingDataBody});
}

class GetTopSpecialistsEvent extends HomeScreenEvent {}

class GetTrustedHospitalEvent extends HomeScreenEvent {}

class ToggleDoctorLikeEvent extends HomeScreenEvent {
  final String doctorId;
  final bool isLike;

  ToggleDoctorLikeEvent({required this.doctorId, required this.isLike});
}

class ToggleHospitalLikeEvent extends HomeScreenEvent {
  final String hospitalId;
  final bool isLike;

  ToggleHospitalLikeEvent({
    required this.hospitalId,
    required this.isLike,
  });
}
