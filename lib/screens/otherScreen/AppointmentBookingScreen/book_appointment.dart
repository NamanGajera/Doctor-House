import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/common/buttons/simplebutton.dart';
import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/heading.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingcontroller = Get.put(BookingController());

    // bookingcontroller.bookingloading.value = false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Book Appointment'),
        body: SizedBox(
          height: Nsize.screenheight - MediaQuery.of(context).padding.top,
          width: Nsize.screenwidth,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, right: 14, left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                /// Select date heading
                Heading(
                  heading: 'Select Date',
                  wantseebtn: false,
                  headingFontSize: 20,
                ),

                /// Select Date
                CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 90)),
                    onDateChanged: (value) {
                      bookingcontroller.date =
                          '${value.day}-${value.month}-${value.year}';
                      bookingcontroller.selectedDate = value;
                    }),

                const SizedBox(height: 10),
                // Select Time
                Heading(
                  heading: 'Select Time',
                  wantseebtn: false,
                  headingFontSize: 20,
                ),
                const SizedBox(height: 10),

                /// Morning Slot
                const Text(
                  'Morning',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// morning slot

                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: Nsize.screenheight * 0.044,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          bookingcontroller.selecttime(index);
                          bookingcontroller.currenttimeindex = index;
                        },
                        child: Obx(
                          () => Container(
                            alignment: Alignment.center,
                            height: Nsize.screenheight * 0.044,
                            width: Nsize.screenwidth * 0.24,
                            decoration: BoxDecoration(
                              color:
                                  bookingcontroller.currentindex.value == index
                                      ? Ncolor.darkblue2
                                      : null,
                              border: Border.all(
                                width: 1.5,
                                color: bookingcontroller.currentindex.value ==
                                        index
                                    ? Ncolor.darkblue2
                                    : Ncolor.darkblue1,
                              ),
                              borderRadius: BorderRadius.circular(
                                  bookingcontroller.currentindex.value == index
                                      ? 16
                                      : 12),
                            ),
                            child: Text(
                              Nlist.timeSlot[index],
                              style: TextStyle(
                                color: bookingcontroller.currentindex.value ==
                                        index
                                    ? Colors.white
                                    : Ncolor.darkblue1,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /// Afternoon Slot
                const Text(
                  'Afternoon',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// afternoon slot
                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: Nsize.screenheight * 0.044,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          bookingcontroller.selecttime(index + 6);
                          bookingcontroller.currenttimeindex = index + 6;
                        },
                        child: Obx(
                          () => Container(
                            alignment: Alignment.center,
                            height: Nsize.screenheight * 0.044,
                            width: Nsize.screenwidth * 0.24,
                            decoration: BoxDecoration(
                              color: bookingcontroller.currentindex.value ==
                                      index + 6
                                  ? Ncolor.darkblue2
                                  : null,
                              border: Border.all(
                                width: 1.5,
                                color: bookingcontroller.currentindex.value ==
                                        index + 6
                                    ? Ncolor.darkblue2
                                    : Ncolor.darkblue1,
                              ),
                              borderRadius: BorderRadius.circular(
                                  bookingcontroller.currentindex.value ==
                                          index + 6
                                      ? 16
                                      : 12),
                            ),
                            child: Text(
                              Nlist.timeSlot[index + 6],
                              style: TextStyle(
                                color: bookingcontroller.currentindex.value ==
                                        index + 6
                                    ? Colors.white
                                    : Ncolor.darkblue1,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /// Next Button
                SizedBox(
                  height: Nsize.screenheight * 0.06,
                  width: Nsize.screenwidth,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 12, left: 12, bottom: 8),
                    child: SimpleButton(
                      height: Nsize.screenheight * 0.06,
                      width: Nsize.screenwidth,
                      applyborderRadius: true,
                      borderRadius: 24,
                      applyboxShadow: false,
                      applybold: true,
                      buttonText: 'Next',
                      backgroundColor: Ncolor.darkblue2,
                      fontSize: 22,
                      loading: false,
                      onTap: () => bookingcontroller.nextToPatientDetails(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
