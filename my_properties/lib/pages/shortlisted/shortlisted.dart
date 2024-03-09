import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_properties/constants/constants.dart';

class Shortlisted extends StatefulWidget {
  @override
  _ShortlistedState createState() => _ShortlistedState();
}

class _ShortlistedState extends State<Shortlisted> {
  final shortlistedList = [
    {
      'image': 'assets/house/house_1.jpg',
      'name': 'Sky View House',
      'address': 'Opera Street, New York',
      'price': '360000'
    },
    {
      'image': 'assets/house/house_2.jpg',
      'name': 'Vraj House',
      'address': 'Yogi Street, New York',
      'price': '920000'
    }
  ];

  removeItem(context, index) {}
  void doNothing(BuildContext context) {}
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
          'Shortlisted',
          style: primaryColor18BoldTextStyle,
        ),
      ),
      body: (shortlistedList.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 50.0,
                    color: greyColor,
                  ),
                  heightSpace,
                  Text(
                    'No item in shortlist',
                    style: grey18BoldTextStyle,
                  ),
                ],
              ),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: shortlistedList.length,
              itemBuilder: (context, index) {
                final item = shortlistedList[index];
                return Slidable(
                  key: ValueKey(index),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.16,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            shortlistedList.removeAt(index);
                          });

                          // Then show a snackbar.
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Property Removed from Shortlisted'),
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: fixPadding * 2.0,
                            bottom: (index == shortlistedList.length - 1)
                                ? fixPadding * 2.0
                                : 0.0,
                          ),
                          width: MediaQuery.of(context).size.width * 0.16,
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.delete,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // actionPane: SlidableDrawerActionPane(),
                  // actionExtentRatio: 0.25,
                  // secondaryActions: <Widget>[
                  //   Container(
                  // margin: EdgeInsets.only(
                  //   top: fixPadding * 2.0,
                  //   bottom: (index == shortlistedList.length - 1)
                  //       ? fixPadding * 2.0
                  //       : 0.0,
                  // ),
                  //     child: IconSlideAction(
                  //       caption: 'Delete',
                  //       color: Colors.red,
                  //       icon: Icons.delete,
                  // onTap: () {
                  //   setState(() {
                  //     shortlistedList.removeAt(index);
                  //   });

                  //   // Then show a snackbar.
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     content: Text('Property Removed from Shortlisted'),
                  //   ));
                  // },
                  //     ),
                  //   ),
                  // ],
                  child: Padding(
                    padding: (index == shortlistedList.length - 1)
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
                              item['image']!,
                              height: 220.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(fixPadding * 2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name']!,
                                        style: black14SemiBoldTextStyle,
                                      ),
                                      height5Space,
                                      Text(
                                        item['address']!,
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
    );
  }
}
