import 'package:flutter/material.dart';
import 'package:my_properties/constants/constants.dart';

class AddNewListing extends StatefulWidget {
  @override
  _AddNewListingState createState() => _AddNewListingState();
}

class _AddNewListingState extends State<AddNewListing> {
  bool buy = true, rent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Add New Listing',
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
      bottomNavigationBar: Material(
        elevation: 2.0,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 50.0,
            width: double.infinity,
            color: primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Add Listing',
              style: whiteColor18BoldTextStyle,
            ),
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          height20Space,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => _selectOptionBottomSheet(),
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      width: 1.0,
                      color: primaryColor,
                    ),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    size: 24.0,
                    color: blackColor,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameField(),
                addressField(),
                squareFeetField(),
                bathroomField(),
                bedroomField(),
                kitchenField(),
                priceField(),
                buyRent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  nameField() {
    return Container(
      padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
      child: Theme(
        data: ThemeData(
          primaryColor: greyColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
        ),
        child: TextField(
          keyboardType: TextInputType.text,
          style: black14MediumTextStyle,
          decoration: InputDecoration(
            labelText: 'Title',
            labelStyle: grey14MediumTextStyle,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(color: greyColor, width: 0.7),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }

  addressField() {
    return Container(
      padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
      child: Theme(
        data: ThemeData(
          primaryColor: greyColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
        ),
        child: TextField(
          keyboardType: TextInputType.text,
          style: black14MediumTextStyle,
          decoration: InputDecoration(
            labelText: 'Address',
            labelStyle: grey14MediumTextStyle,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(color: greyColor, width: 0.7),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }

  squareFeetField() {
    return Container(
      padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
      child: Theme(
        data: ThemeData(
          primaryColor: greyColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          style: black14MediumTextStyle,
          decoration: InputDecoration(
            labelText: 'Square feet',
            labelStyle: grey14MediumTextStyle,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(color: greyColor, width: 0.7),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }

  bathroomField() {
    return Container(
      padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
      child: Theme(
        data: ThemeData(
          primaryColor: greyColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          style: black14MediumTextStyle,
          decoration: InputDecoration(
            labelText: 'No. of bathrooms',
            labelStyle: grey14MediumTextStyle,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(color: greyColor, width: 0.7),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }

  bedroomField() {
    return Container(
      padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
      child: Theme(
        data: ThemeData(
          primaryColor: greyColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          style: black14MediumTextStyle,
          decoration: InputDecoration(
            labelText: 'No. of bedrooms',
            labelStyle: grey14MediumTextStyle,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(color: greyColor, width: 0.7),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }

  kitchenField() {
    return Container(
      padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
      child: Theme(
        data: ThemeData(
          primaryColor: greyColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          style: black14MediumTextStyle,
          decoration: InputDecoration(
            labelText: 'No. of kitchen',
            labelStyle: grey14MediumTextStyle,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(color: greyColor, width: 0.7),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }

  priceField() {
    return Container(
      padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
      child: Theme(
        data: ThemeData(
          primaryColor: greyColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          style: black14MediumTextStyle,
          decoration: InputDecoration(
            labelText: 'Price(in USD)',
            labelStyle: grey14MediumTextStyle,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(color: greyColor, width: 0.7),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }

  buyRent() {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: fixPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                buy = true;
                rent = false;
              });
            },
            child: Container(
              width: (width - fixPadding * 6.0) / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 1.0,
                        color: primaryColor,
                      ),
                    ),
                    child: Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: (buy) ? primaryColor : whiteColor,
                      ),
                    ),
                  ),
                  widthSpace,
                  Text(
                    'Buy',
                    style: black14MediumTextStyle,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                buy = false;
                rent = true;
              });
            },
            child: Container(
              width: (width - fixPadding * 6.0) / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 1.0,
                        color: primaryColor,
                      ),
                    ),
                    child: Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: (rent) ? primaryColor : whiteColor,
                      ),
                    ),
                  ),
                  widthSpace,
                  Text(
                    'Rent',
                    style: black14MediumTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Sheet for Select Options (Camera or Gallery) Start Here
  void _selectOptionBottomSheet() {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: whiteColor,
            child: Wrap(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.all(fixPadding),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Choose Option',
                            textAlign: TextAlign.center,
                            style: black18BoldTextStyle,
                          ),
                        ),
                        heightSpace,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: fixPadding),
                          width: width,
                          height: 1.0,
                          color: greyColor.withOpacity(0.5),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Camera', style: black16MediumTextStyle),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.photo_album,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Upload from Gallery',
                                  style: black16MediumTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
  // Bottom Sheet for Select Options (Camera or Gallery) Ends Here
}
