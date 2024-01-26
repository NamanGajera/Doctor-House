import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/userIntro.dart';
import 'package:dr_house/screens/otherScreen/SearchBarScreen/searchBar_screen.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/homeScreen_Body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 12, left: 12),
            child: Column(
              children: [
                /// User Name and Intro
                UserIntro(
                  userName: 'Hii ${Ntext.userName}!',
                  intro: Ntext.intro,
                ),
                const SizedBox(height: 15),

                /// Search Bar
                const SearchDoctor(),
                const SizedBox(height: 15),
                const HomeScreenBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getdata() async {
    User? user = auth.currentUser;
    final uid = user?.uid;

    final DocumentSnapshot userdoc =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    setState(() {
      Ntext.userName = userdoc.get('name');
      Ntext.userEmail = userdoc.get('email');
    });
  }
}

class SearchDoctor extends StatelessWidget {
  const SearchDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SearchBarScreen());
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: Nsize.screenheight * 0.025,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Ncolor.darkblue1),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Row(
          children: [
            Icon(Iconsax.search_favorite_1),
            SizedBox(width: 10),
            Text(
              'Search Doctor',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
