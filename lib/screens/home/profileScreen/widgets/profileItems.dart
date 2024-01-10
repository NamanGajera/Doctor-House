// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../utils/const/list.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: Nlist.accountInfoList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(
                    Nlist.accountInfoIconList[index],
                    size: 28,
                  ),
                  title: Text(
                    Nlist.accountInfoList[index],
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Nlist.accountInfoTralingIcon[index],
                    size: 28,
                  ),
                ),
                const Divider(
                  thickness: 1.1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
