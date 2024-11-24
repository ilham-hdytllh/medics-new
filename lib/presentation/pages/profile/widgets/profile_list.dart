import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileList extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  ProfileList({required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1500,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 247, 250, 247),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5800,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      title,
                    ),
                  ),
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1100,
                decoration: const BoxDecoration(),
                child: Icon(
                  IconlyLight.arrowRight,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
