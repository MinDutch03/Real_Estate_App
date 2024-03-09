import 'package:flutter/material.dart';
import 'package:my_properties/constants/constants.dart';
import 'package:my_properties/pages/screens.dart';
import 'package:page_transition/page_transition.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool matchedPropertyNotification = true,
      newLaunchedPropertyNotification = false,
      propertyNewsNotification = false;

  logoutDialog() {
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
                      'Are you sure want to logout?',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
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
                              'Logout',
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
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: primaryColor18BoldTextStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: AddNewListing(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          aboutUser(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: MyListing(),
                ),
              );
            },
            child: settingTile('My Listing'),
          ),
          aboutSection(),
          height20Space,
          manageNotificationSection(),
          appSection(),
          InkWell(
            onTap: () => logoutDialog(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  fixPadding * 2.0, fixPadding, fixPadding * 2.0, fixPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    size: 24.0,
                    color: Colors.red,
                  ),
                  width5Space,
                  Text(
                    'Logout',
                    style: red16MediumTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  aboutUser() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  image: DecorationImage(
                    image: AssetImage('assets/user/user_5.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              widthSpace,
              Text(
                'Stella French',
                style: black18BoldTextStyle,
              ),
            ],
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: EditProfile(),
                ),
              );
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Icon(
                Icons.edit,
                size: 20.0,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  aboutSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20Space,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'About'.toUpperCase(),
            style: black12RegularTextStyle,
          ),
        ),
        heightSpace,
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: PrivacyPolicy(),
              ),
            );
          },
          child: settingTile('Privacy Policy'),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: TermsOfUse(),
              ),
            );
          },
          child: settingTile('Terms of use'),
        ),
      ],
    );
  }

  manageNotificationSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Manage Notification',
            style: black12RegularTextStyle,
          ),
        ),
        heightSpace,
        InkWell(
          onTap: () {
            setState(() {
              matchedPropertyNotification = !matchedPropertyNotification;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'For Matched Properties',
                      style: black16MediumTextStyle,
                    ),
                    Switch(
                      value: matchedPropertyNotification,
                      onChanged: (value) {
                        setState(() {
                          matchedPropertyNotification = value;
                        });
                      },
                      activeTrackColor: primaryColor.withOpacity(0.4),
                      activeColor: primaryColor,
                    ),
                  ],
                ),
                Container(
                  height: 0.8,
                  width: double.infinity,
                  color: greyColor.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              newLaunchedPropertyNotification =
                  !newLaunchedPropertyNotification;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'For New Launched Properties',
                      style: black16MediumTextStyle,
                    ),
                    Switch(
                      value: newLaunchedPropertyNotification,
                      onChanged: (value) {
                        setState(() {
                          newLaunchedPropertyNotification = value;
                        });
                      },
                      activeTrackColor: primaryColor.withOpacity(0.4),
                      activeColor: primaryColor,
                    ),
                  ],
                ),
                Container(
                  height: 0.8,
                  width: double.infinity,
                  color: greyColor.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              propertyNewsNotification = !propertyNewsNotification;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'For Property News',
                      style: black16MediumTextStyle,
                    ),
                    Switch(
                      value: propertyNewsNotification,
                      onChanged: (value) {
                        setState(() {
                          propertyNewsNotification = value;
                        });
                      },
                      activeTrackColor: primaryColor.withOpacity(0.4),
                      activeColor: primaryColor,
                    ),
                  ],
                ),
                Container(
                  height: 0.8,
                  width: double.infinity,
                  color: greyColor.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  appSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20Space,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'App'.toUpperCase(),
            style: black12RegularTextStyle,
          ),
        ),
        heightSpace,
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: Support(),
              ),
            );
          },
          child: settingTile('Support'),
        ),
        InkWell(
          onTap: () {},
          child: settingTile('Report a Bug'),
        ),
        InkWell(
          onTap: () {},
          child: settingTile('App Version 1.0'),
        ),
      ],
    );
  }

  settingTile(title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: black16MediumTextStyle,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 18.0,
                color: blackColor,
              ),
            ],
          ),
          heightSpace,
          Container(
            height: 0.8,
            width: double.infinity,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
