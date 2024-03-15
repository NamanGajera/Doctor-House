import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/userIntro.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets/homeScreen_Body.dart';
import 'widgets/searchDoctor.dart';

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
