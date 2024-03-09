import 'package:flutter/material.dart';
import 'package:my_properties/constants/constants.dart';
import 'package:my_properties/widget/column_builder.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: blackColor,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            searchTextField(),
            recentSearches(),
            featuredProperties(),
          ],
        ),
      ),
    );
  }

  searchTextField() {
    return Container(
      height: 40.0,
      margin: EdgeInsets.all(fixPadding * 2.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        style: black14MediumTextStyle,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Search for properties',
          hintStyle: grey14MediumTextStyle,
          contentPadding: EdgeInsets.only(bottom: 7.0),
          prefixIcon: Icon(
            Icons.search,
            color: greyColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  recentSearches() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your recent searches',
            style: black16SemiBoldTextStyle,
          ),
          heightSpace,
          recentSearchesTile('4 Bhk Bunglow'),
          heightSpace,
          recentSearchesTile('2 Bhk Bunglow'),
        ],
      ),
    );
  }

  recentSearchesTile(title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.history,
          size: 24.0,
          color: greyColor,
        ),
        width5Space,
        Expanded(
          child: Text(
            title,
            style: black14RegularTextStyle,
          ),
        ),
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
                  onTap: () {},
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
                              ClipRRect(
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
