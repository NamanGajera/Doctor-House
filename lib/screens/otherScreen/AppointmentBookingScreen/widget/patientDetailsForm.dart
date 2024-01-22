import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../utils/const/colors.dart';
import '../../../../utils/const/size.dart';
import '../../../../utils/helper/function.dart';

class PatientDetailForm extends StatelessWidget {
  const PatientDetailForm({
    super.key,
    required this.fullname,
    required this.items,
    required this.selectedValue,
  });

  final TextEditingController fullname;
  final List<String> items;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Full Name',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: fullname,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              labelStyle: const TextStyle(
                color: Ncolor.darkblue1,
                fontSize: Nsize.labletextfont,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              hintText: '  Enter Full Patient Name',
            ),
            onTapOutside: Nhelper.hideKeybord,
            // validator: validator,
          ),
          const SizedBox(height: 10),
          const Text(
            'Gender',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: Nsize.screenheight * 0.025,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Ncolor.darkblue1),
                borderRadius: BorderRadius.circular(26)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  '  Gender',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {},
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 140,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Your Age',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: fullname,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              labelStyle: const TextStyle(
                color: Ncolor.darkblue1,
                fontSize: Nsize.labletextfont,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              hintText: '  Enter Your Age',
            ),
            onTapOutside: Nhelper.hideKeybord,
            keyboardType: TextInputType.number,
            // validator: validator,
          ),
          const SizedBox(height: 10),
          const Text(
            'Write Your Problem',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: fullname,
            maxLines: 10,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              labelStyle: const TextStyle(
                color: Ncolor.darkblue1,
                fontSize: Nsize.labletextfont,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              hintText: '  Write Your Problem',
            ),
            onTapOutside: Nhelper.hideKeybord,
            keyboardType: TextInputType.number,
            // validator: validator,
          ),
        ],
      ),
    );
  }
}
