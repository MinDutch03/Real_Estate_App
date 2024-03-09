import 'package:flutter/material.dart';
import 'package:my_properties/constants/constants.dart';
import 'package:my_properties/pages/screens.dart';
import 'package:my_properties/widget/column_builder.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool buy = true, rent = false;

  final nearByPropertiesList = [
    {
      'image': 'assets/house/house_1.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '360000',
      'favorite': false,
      'heroTag': 'herotag_1'
    },
    {
      'image': 'assets/house/house_2.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '920000',
      'favorite': false,
      'heroTag': 'herotag_2'
    },
    {
      'image': 'assets/house/house_3.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '490000',
      'favorite': false,
      'heroTag': 'herotag_3'
    },
    {
      'image': 'assets/house/house_5.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '300000',
      'favorite': false,
      'heroTag': 'herotag_4'
    },
    {
      'image': 'assets/house/house_6.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '360000',
      'favorite': false,
      'heroTag': 'herotag_5'
    }
  ];

  final featuredPropertiesList = [
    {
      'image': 'assets/house/house_1.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '360000',
      'favorite': false,
      'heroTag': 'herotag_6'
    },
    {
      'image': 'assets/house/house_2.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '920000',
      'favorite': false,
      'heroTag': 'herotag_7'
    },
    {
      'image': 'assets/house/house_3.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '490000',
      'favorite': false,
      'heroTag': 'herotag_8'
    },
    {
      'image': 'assets/house/house_5.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '300000',
      'favorite': false,
      'heroTag': 'herotag_9'
    },
    {
      'image': 'assets/house/house_6.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '360000',
      'favorite': false,
      'heroTag': 'herotag_10'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 1.0,
        title: Text(
          'MyProperty',
          style: primaryColor18BoldTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: Notifications(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          buyRent(),
          nearbyProperties(),
          featuredProperties(),
        ],
      ),
    );
  }

  buyRent() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: () {
              setState(() {
                buy = true;
                rent = false;
              });
            },
            child: Container(
              width: (width - fixPadding * 6.0) / 2,
              padding: EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: (buy) ? primaryColor : whiteColor,
                border: Border.all(
                  width: 0.7,
                  color: primaryColor,
                ),
              ),
              child: Text(
                'Buy',
                style: (buy)
                    ? whiteColor16BoldTextStyle
                    : primaryColor16BoldTextStyle,
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: () {
              setState(() {
                buy = false;
                rent = true;
              });
            },
            child: Container(
              width: (width - fixPadding * 6.0) / 2,
              padding: EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: (rent) ? primaryColor : whiteColor,
                border: Border.all(
                  width: 0.7,
                  color: primaryColor,
                ),
              ),
              child: Text(
                'Rent',
                style: (rent)
                    ? whiteColor16BoldTextStyle
                    : primaryColor16BoldTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  nearbyProperties() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Nearby Properties',
            style: black18SemiBoldTextStyle,
          ),
        ),
        height20Space,
        Container(
          height: 218.0,
          width: double.infinity,
          child: ListView.builder(
            itemCount: nearByPropertiesList.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = nearByPropertiesList[index];
              return Padding(
                padding: (index != nearByPropertiesList.length - 1)
                    ? const EdgeInsets.only(
                        left: fixPadding * 2.0, top: 4.0, bottom: 4.0)
                    : const EdgeInsets.only(
                        left: fixPadding * 2.0,
                        right: fixPadding * 2.0,
                        top: 4.0,
                        bottom: 4.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(milliseconds: 600),
                        type: PageTransitionType.fade,
                        child: Property(
                          heroTag: '${item['heroTag']}',
                          image: '${item['image']}',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 210.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          color: blackColor.withOpacity(0.25),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: 160.0,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Hero(
                                  tag: '${item['heroTag']}',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10.0),
                                    ),
                                    child: Image.asset(
                                      '${item['image']}',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10.0,
                                  right: 10.0,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15.0),
                                    onTap: () {
                                      if (item['favorite'] == true) {
                                        setState(() {
                                          item['favorite'] = false;
                                        });
                                      } else {
                                        setState(() {
                                          item['favorite'] = true;
                                        });
                                      }

                                      if (item['favorite'] == true) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Added to shortlist')));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Remove from shortlist')));
                                      }
                                    },
                                    child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: whiteColor.withOpacity(0.7),
                                      ),
                                      child: Icon(
                                        (item['favorite'] == true)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 16.0,
                                        color: greyColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(fixPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item['name']}',
                                style: black14SemiBoldTextStyle,
                              ),
                              height5Space,
                              Text(
                                '${item['address']}',
                                style: grey12MediumTextStyle,
                              ),
                              height5Space,
                              Text(
                                '${item['price']}\$',
                                style: black16SemiBoldTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  featuredProperties() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Properties',
            style: black18SemiBoldTextStyle,
          ),
          height20Space,
          ColumnBuilder(
            itemCount: featuredPropertiesList.length,
            itemBuilder: (context, index) {
              final item = featuredPropertiesList[index];
              return Padding(
                padding: EdgeInsets.only(bottom: fixPadding * 2.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(milliseconds: 600),
                        type: PageTransitionType.fade,
                        child: Property(
                          heroTag: '${item['heroTag']}',
                          image: '${item['image']}',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          color: blackColor.withOpacity(0.25),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 220.0,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Hero(
                                tag: '${item['heroTag']}',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10.0),
                                  ),
                                  child: Image.asset(
                                    '${item['image']}',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10.0,
                                right: 10.0,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15.0),
                                  onTap: () {
                                    if (item['favorite'] == true) {
                                      setState(() {
                                        item['favorite'] = false;
                                      });
                                    } else {
                                      setState(() {
                                        item['favorite'] = true;
                                      });
                                    }

                                    if (item['favorite'] == true) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('Added to shortlist')));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Remove from shortlist')));
                                    }
                                  },
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: whiteColor.withOpacity(0.7),
                                    ),
                                    child: Icon(
                                      (item['favorite'] == true)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 16.0,
                                      color: greyColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(fixPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item['name']}',
                                      style: black14SemiBoldTextStyle,
                                    ),
                                    height5Space,
                                    Text(
                                      '${item['address']}',
                                      style: grey12MediumTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    width: 0.7,
                                    color: greyColor.withOpacity(0.5),
                                  ),
                                ),
                                child: Text(
                                  '${item['price']}\$',
                                  style: black16SemiBoldTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
