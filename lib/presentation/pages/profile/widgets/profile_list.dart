import 'package:flutter/widgets.dart';

class ProfileList extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  ProfileList({required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: double.infinity,
        child: Row(
          children: [
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
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        title,
                        overflow: TextOverflow
                            .ellipsis, // Menambahkan elipsis jika teks terlalu panjang
                        style: TextStyle(
                          color: color, // Sesuaikan warna teks jika perlu
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
