import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_properties/constants/constants.dart';
import 'package:my_properties/pages/screens.dart';
import 'package:my_properties/widget/column_builder.dart';
import 'package:page_transition/page_transition.dart';

class Property extends StatefulWidget {
  final String? heroTag, image;

  const Property({Key? key, @required this.heroTag, @required this.image})
      : super(key: key);
  @override
  _PropertyState createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  Set<Marker>? markers;
  bool shortListed = false;
  bool railwayExpand = true,
      airportExpand = false,
      hospitalExpand = false,
      bankExpand = false;

  @override
  void initState() {
    super.initState();
    markers = Set.from([]);
  }

  final photoList = [
    {'image': 'assets/bedroom-1.jpg'},
    {'image': 'assets/bedroom-2.jpg'},
    {'image': 'assets/kitchen.jpg'},
    {'image': 'assets/bathroom-1.png'},
    {'image': 'assets/bathroom-2.jpg'},
    {'image': 'assets/parking.jpg'}
  ];

  final projectAmenitiesList = [
    {'title': 'Garden'},
    {'title': 'Jogging Track'},
    {'title': 'Power Backup'},
    {'title': 'Cpmplete RCC Structure'},
    {'title': 'Designer Door Frames'},
    {'title': 'PVC Concealed wiring'}
  ];

  final railwayStationList = [
    {
      'name': 'Santa Cruise Railway Station',
      'time': '8 min',
      'distance': '2.5 km'
    },
    {
      'name': 'Manhattan Railway Station',
      'time': '14 min',
      'distance': '4.0 km'
    }
  ];

  final airportList = [
    {'name': 'LaGuardia Airport', 'time': '8 min', 'distance': '2.5 km'}
  ];

  final hospitalsList = [
    {'name': 'Presbyterian Hospital', 'time': '8 min', 'distance': '2.5 km'},
    {'name': 'Lenox Hill Hospital', 'time': '14 min', 'distance': '4.0 km'},
    {'name': 'Mount Sinai Hospital', 'time': '20 min', 'distance': '6.0 km'}
  ];

  final banksList = [
    {'name': 'Kotak Mahindra Bank', 'time': '5 min', 'distance': '1.5 km'}
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: Material(
        elevation: 3.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          height: 70.0,
          width: double.infinity,
          color: whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                          image: AssetImage('assets/user/user_7.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    widthSpace,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Smith',
                          style: black18BoldTextStyle,
                        ),
                        Text(
                          'Owner',
                          style: grey14MediumTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(5.0),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: ChatScreen(name: 'John Smith'),
                    ),
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.fromLTRB(fixPadding, 5.0, fixPadding, 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: primaryColor,
                  ),
                  child: Text(
                    'Contact',
                    style: whiteColor14SemiBoldTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 358.0,
                pinned: true,
                forceElevated: true,
                automaticallyImplyLeading: false,
                backgroundColor: primaryColor,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      (shortListed) ? Icons.favorite : Icons.favorite_border,
                      color: whiteColor,
                    ),
                    onPressed: () {
                      setState(() {
                        shortListed = !shortListed;
                      });

                      if (shortListed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added to shortlist')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Remove from shortlist')));
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: whiteColor,
                    ),
                    onPressed: () {},
                  ),
                ],
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.heroTag!,
                    child: Container(
                      width: width,
                      height: 358.0,
                      color: whiteColor,
                      child: Container(
                        width: width,
                        height: 358.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(widget.image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              aboutProperty(),
              facilityRow(),
              description(),
              photos(),
              location(),
              projectAmenities(),
              height20Space,
              railwayStation(),
              height20Space,
              airport(),
              height20Space,
              hospital(),
              height20Space,
              bank(),
              height20Space,
            ],
          ),
        ),
      ),
    );
  }

  aboutProperty() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sky View House',
            style: black18BoldTextStyle,
          ),
          height20Space,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Opera Street, New York',
                      style: grey14MediumTextStyle,
                    ),
                    height5Space,
                    Text(
                      '5000ft2',
                      style: black14SemiBoldTextStyle,
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
                  '360000\$',
                  style: black16SemiBoldTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  facilityRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          facilityTile('6', 'Bedrooms'),
          facilityTile('4', 'Bathrooms'),
          facilityTile('2', 'Kitchens'),
          facilityTile('3', 'Parkings'),
        ],
      ),
    );
  }

  facilityTile(heading, subHeading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          heading,
          style: black22BoldTextStyle,
        ),
        height5Space,
        Text(
          subHeading,
          style: black14RegularTextStyle,
        ),
      ],
    );
  }

  description() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies mi id faucibus odio lobortis vitae, ante malesuada mauris. Nulla quis orci, libero turpis morbi diam. Non placerat est consectetur hendrerit sem fringilla leo. Urna posuere aliquet justo, vitae at pharetra. Euismod sagittis malesuada mattis commodo faucibus purus convallis.',
            style: black12RegularTextStyle,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  photos() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Photos',
            style: black18BoldTextStyle,
          ),
        ),
        heightSpace,
        Container(
          width: double.infinity,
          height: 158.0,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: photoList.length,
            itemBuilder: (context, index) {
              final item = photoList[index];
              return Padding(
                padding: (index != photoList.length - 1)
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
                        child: FullScreenImage(
                          imagePath: item['image'],
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: item['image']!,
                    child: Container(
                      width: 120.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            color: blackColor.withOpacity(0.25),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(item['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  location() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  color: Colors.grey[300]!,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GoogleMap(
                markers: markers!,
                onMapCreated: (GoogleMapController controller) {
                  Marker m = Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(51.361005, -0.1746394));
                  setState(() {
                    markers!.add(m);
                  });
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(51.361005, -0.1746394), zoom: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  projectAmenities() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Amenities',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          ColumnBuilder(
            itemCount: projectAmenitiesList.length,
            itemBuilder: (context, index) {
              final item = projectAmenitiesList[index];
              return Padding(
                padding: (index != 0)
                    ? const EdgeInsets.only(top: fixPadding)
                    : EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 16.0,
                      width: 16.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: primaryColor,
                      ),
                      child: Icon(
                        Icons.check,
                        size: 14.0,
                        color: whiteColor,
                      ),
                    ),
                    widthSpace,
                    Text(
                      item['title']!,
                      style: black14RegularTextStyle,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  railwayStation() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Railway Station (${railwayStationList.length})',
                style: black14BoldTextStyle,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    railwayExpand = !railwayExpand;
                  });
                },
                child: Icon(
                  (railwayExpand) ? Icons.expand_less : Icons.expand_more,
                  color: primaryColor,
                  size: 24.0,
                ),
              ),
            ],
          ),
          (railwayExpand)
              ? ColumnBuilder(
                  itemCount: railwayStationList.length,
                  itemBuilder: (context, index) {
                    final item = railwayStationList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              item['name']!,
                              style: grey14RegularTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: fixPadding),
                            child: Text(
                              '${item['time']} | ${item['distance']}',
                              style: grey14RegularTextStyle,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Container(
                  width: 0.0,
                  height: 0.0,
                ),
        ],
      ),
    );
  }

  airport() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Airport (${airportList.length})',
                style: black14BoldTextStyle,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    airportExpand = !airportExpand;
                  });
                },
                child: Icon(
                  (airportExpand) ? Icons.expand_less : Icons.expand_more,
                  color: primaryColor,
                  size: 24.0,
                ),
              ),
            ],
          ),
          (airportExpand)
              ? ColumnBuilder(
                  itemCount: airportList.length,
                  itemBuilder: (context, index) {
                    final item = airportList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              item['name']!,
                              style: grey14RegularTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: fixPadding),
                            child: Text(
                              '${item['time']} | ${item['distance']}',
                              style: grey14RegularTextStyle,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Container(
                  width: 0.0,
                  height: 0.0,
                ),
        ],
      ),
    );
  }

  hospital() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hospitals (${hospitalsList.length})',
                style: black14BoldTextStyle,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    hospitalExpand = !hospitalExpand;
                  });
                },
                child: Icon(
                  (hospitalExpand) ? Icons.expand_less : Icons.expand_more,
                  color: primaryColor,
                  size: 24.0,
                ),
              ),
            ],
          ),
          (hospitalExpand)
              ? ColumnBuilder(
                  itemCount: hospitalsList.length,
                  itemBuilder: (context, index) {
                    final item = hospitalsList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              item['name']!,
                              style: grey14RegularTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: fixPadding),
                            child: Text(
                              '${item['time']} | ${item['distance']}',
                              style: grey14RegularTextStyle,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Container(
                  width: 0.0,
                  height: 0.0,
                ),
        ],
      ),
    );
  }

  bank() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Banks (${banksList.length})',
                style: black14BoldTextStyle,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    bankExpand = !bankExpand;
                  });
                },
                child: Icon(
                  (bankExpand) ? Icons.expand_less : Icons.expand_more,
                  color: primaryColor,
                  size: 24.0,
                ),
              ),
            ],
          ),
          (bankExpand)
              ? ColumnBuilder(
                  itemCount: banksList.length,
                  itemBuilder: (context, index) {
                    final item = banksList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              item['name']!,
                              style: grey14RegularTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: fixPadding),
                            child: Text(
                              '${item['time']} | ${item['distance']}',
                              style: grey14RegularTextStyle,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Container(
                  width: 0.0,
                  height: 0.0,
                ),
        ],
      ),
    );
  }
}
