part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class GetDoctorCategoryEvent extends HomeScreenEvent {}

class GetUpcomingScheduleEvent extends HomeScreenEvent {
  final Map<String, dynamic> upcomingDataBody;

  GetUpcomingScheduleEvent({required this.upcomingDataBody});
}
