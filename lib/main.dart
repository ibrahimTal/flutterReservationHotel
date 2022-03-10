import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const d_green = Color(0xFF54D3C2);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels Booking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [SearchSection(), HotelSection()],
          ),
        ));
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      )
                    ]),
                height: 50,
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Dakar',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none),
                ),
              )),
              SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: Offset(0, 4))
                ], borderRadius: BorderRadius.all(Radius.circular(25))),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    size: 26,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: d_green),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choisir une date",
                      style:
                          GoogleFonts.nunito(color: Colors.grey, fontSize: 15),
                    ),
                    //SizedBox(height: 8),
                    Text(
                      "12 Dec - 22 Dec",
                      style:
                          GoogleFonts.nunito(color: Colors.black, fontSize: 17),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nombre de chambres",
                      style:
                          GoogleFonts.nunito(color: Colors.grey, fontSize: 15),
                    ),
                    Text(
                      "1 chambre - 2 Adultes",
                      style:
                          GoogleFonts.nunito(color: Colors.black, fontSize: 17),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HotelSection extends StatelessWidget {
  HotelSection({Key? key}) : super(key: key);
  final List hotelList = [
    {
      'title': 'Grand Royl Hotel',
      'place': 'Wembley, London',
      'distance': 2,
      'review': 36,
      'picture': 'images/hotel_1.jpg',
      'price': '180',
    },
    {
      'title': 'Grand Mal Hotel',
      'place': 'wembley, London',
      'distance': 3,
      'review': 13,
      'picture': 'images/hotel_2.jpg',
      'price': '130',
    },
    {
      'title': 'Queen Hotel',
      'place': 'Wembley, London',
      'distance': 4,
      'review': 27,
      'picture': 'images/hotel_3.jpg',
      'price': '200',
    },
    {
      'title': 'Hilton Hotel',
      'place': 'Webley, London',
      'distance': 10,
      'review': 16,
      'picture': 'images/hotel_4.jpg',
      'price': '220',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '500 Hotels Trouvés',
                  style: GoogleFonts.nunito(color: Colors.black, fontSize: 15),
                ),
                Row(children: [
                  Text(
                    'Filtres',
                    style: GoogleFonts.nunito(color: Colors.black, fontSize: 15),
                  ),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.filter_list,
                      color: d_green,
                      size: 25,
                    ),
                  )
                ]),
              ],
            ),
          ),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList()
          )

        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  Size get preferredSize => new Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed: null,
      ),
      title: Text(
        "Explore",
        style: GoogleFonts.nunito(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
      ),
      actions: [
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite_outline_rounded,
              color: Colors.grey[800],
              size: 20,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.place,
              color: Colors.grey[800],
              size: 20,
            ))
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;
  HotelCard(this.hotelData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0,3)
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage(
                  hotelData['picture']
                ),
                fit: BoxFit.cover
              )
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                    right: 0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: CircleBorder()
                      ),
                      onPressed: null,
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: d_green,
                        size: 20,
                      ),
                    )
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    hotelData['title'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800
                  ),
                ),
                Text(
                    "\$" +hotelData['price'],
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['place'],
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: d_green,
                      size: 14.0,
                    ),
                    Text(
                        hotelData['distance'].toString() + " km de la ville",
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
                Text(
                  "Par nuit",
                  style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
            child: Row(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14.0,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14.0,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14.0,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14.0,
                    ),
                    Icon(
                      Icons.star_border,
                      color: d_green,
                      size: 14.0,
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                    hotelData['review'].toString() + ' reviews',
                  style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
