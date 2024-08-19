import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/pages/home_circle_ui.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Circles(),
  ));
}

class Circles extends StatelessWidget {
  const Circles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Expanded(
                child: GridView.builder(
              itemCount: 30,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 40),
              itemBuilder: (context, index) {
                return HomeCircleUi(
                    name: 'Funny Memes of the year',
                    imageurl:
                        'https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?cs=srgb&dl=pexels-didsss-3844788.jpg&fm=jpg');
              },
            )),
            Positioned(
              bottom: 20,
              left: 2,
              right: 185,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0)
                    .copyWith(right: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    side: BorderSide(color: Colors.transparent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          color: Colors.grey[100],
                          child: CircleAvatar(
                            radius: 19,
                            backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?cs=srgb&dl=pexels-didsss-3844788.jpg&fm=jpg',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Create a Circle',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.81,
              top: MediaQuery.of(context).size.height * 0.8,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 65,                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[100]!),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 38,)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
