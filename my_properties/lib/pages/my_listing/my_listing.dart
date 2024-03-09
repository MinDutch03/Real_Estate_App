import 'package:flutter/material.dart';
import 'package:my_properties/constants/constants.dart';

class MyListing extends StatefulWidget {
  @override
  _MyListingState createState() => _MyListingState();
}

class _MyListingState extends State<MyListing> {
  final myListingList = [
    {
      'image': 'assets/house/house_5.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York.',
      'price': '360000'
    },
    {
      'image': 'assets/house/house_2.jpg',
      'name': 'Legends Villa',
      'address': 'My Honest Hub, New York.',
      'price': '980000'
    }
  ];

  deleteDialog(index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        double width = MediaQuery.of(context).size.width;
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Delete this listing?',
                      style: black14BoldTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 1.0,
                                color: blackColor,
                              ),
                              color: whiteColor,
                            ),
                            child: Text(
                              'Cancel',
                              style: black14MediumTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              myListingList.removeAt(index);
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: primaryColor,
                            ),
                            child: Text(
                              'Delete',
                              style: whiteColor14MediumTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'My Listing',
          style: black18BoldTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: (myListingList.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.format_list_bulleted,
                    size: 50.0,
                    color: greyColor,
                  ),
                  heightSpace,
                  Text(
                    'No listing found',
                    style: grey18BoldTextStyle,
                  ),
                ],
              ),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: myListingList.length,
              itemBuilder: (context, index) {
                final item = myListingList[index];
                return Padding(
                  padding: (index == myListingList.length - 1)
                      ? const EdgeInsets.all(fixPadding * 2.0)
                      : const EdgeInsets.fromLTRB(fixPadding * 2.0,
                          fixPadding * 2.0, fixPadding * 2.0, 0.0),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            '${item['image']}',
                            height: 220.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
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
                        InkWell(
                          onTap: () => deleteDialog(index),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              'Delete',
                              style: whiteColor14MediumTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
