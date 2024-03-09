import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_properties/constants/constants.dart';

class ChatScreen extends StatefulWidget {
  final String? name;

  const ChatScreen({Key? key, @required this.name}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final msgController = TextEditingController();
  DateTime now = DateTime.now();
  ScrollController _scrollController = new ScrollController();
  String? amPm;
  final chatData = [
    {
      'role': 'me',
      'msg': 'When i come to see this property?',
      'time': '9:40 AM',
      'read': 'unread'
    },
    {'role': 'sender', 'msg': 'Hello', 'time': '9:36 AM', 'read': 'read'},
    {'role': 'me', 'msg': 'Hello', 'time': '9:35 AM', 'read': 'read'},
  ];

  @override
  void initState() {
    super.initState();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.elasticOut);
    } else {
      Timer(Duration(milliseconds: 400), () => _scrollToBottom());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 1.0,
        title: Text(
          widget.name!,
          style: black18BoldTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.expand_more,
              color: blackColor,
            ),
            onPressed: () => _propertyDetailBottomSheet(),
          ),
        ],
      ),
      body: SafeArea(
        child: (chatData.length == 0)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat,
                      color: greyColor,
                      size: 70.0,
                    ),
                    heightSpace,
                    Text(
                      'No Messages',
                      style: grey20MediumTextStyle,
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: chatData.length,
                      physics: BouncingScrollPhysics(),
                      reverse: true,
                      itemBuilder: (context, index) {
                        final item = chatData[index];
                        return Container(
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: (item['role'] == 'sender')
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: <Widget>[
                              Wrap(
                                children: <Widget>[
                                  Padding(
                                    padding: (item['role'] == 'sender')
                                        ? EdgeInsets.only(right: 100.0)
                                        : EdgeInsets.only(left: 100.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          (item['role'] == 'sender')
                                              ? CrossAxisAlignment.start
                                              : CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(fixPadding),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: fixPadding),
                                          decoration: BoxDecoration(
                                            borderRadius: (item['role'] ==
                                                    'sender')
                                                ? BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(5.0),
                                                    topRight:
                                                        Radius.circular(5.0),
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(5.0),
                                                  )
                                                : BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(5.0),
                                                    topRight:
                                                        Radius.circular(5.0),
                                                    bottomLeft:
                                                        Radius.circular(5.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                  ),
                                            color: (item['role'] == 'sender')
                                                ? Colors.grey[300]
                                                : primaryColor,
                                          ),
                                          child: Text(
                                            item['msg']!,
                                            style: (item['role'] == 'sender')
                                                ? black14RegularTextStyle
                                                : whiteColor14RegularTextStyle,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                (item['role'] == 'sender')
                                                    ? MainAxisAlignment.start
                                                    : MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              (item['role'] == 'sender')
                                                  ? Container()
                                                  : Icon(
                                                      (item['read'] == 'read')
                                                          ? Icons.done_all
                                                          : Icons.check,
                                                      color: Colors.blueAccent,
                                                      size: 14.0,
                                                    ),
                                              SizedBox(
                                                width: 7.0,
                                              ),
                                              Text(
                                                item['time']!,
                                                style: grey14MediumTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: width,
                    height: 70.0,
                    padding: EdgeInsets.all(fixPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: primaryColor,
                            ),
                            child: TextField(
                              controller: msgController,
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white,
                              ),
                              cursorColor: whiteColor,
                              decoration: InputDecoration(
                                hintText: 'Type a Message',
                                hintStyle: whiteColor14RegularTextStyle,
                                contentPadding: EdgeInsets.only(left: 10.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        InkWell(
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: () {
                            if (msgController.text != '') {
                              if (now.hour > 11) {
                                amPm = 'PM';
                              } else {
                                amPm = 'AM';
                              }
                              setState(() {
                                chatData.insert(0, {
                                  'role': 'me',
                                  'msg': msgController.text,
                                  'time': (now.hour > 12)
                                      ? '${now.hour - 12}:${now.minute} $amPm'
                                      : '${now.hour}:${now.minute} $amPm',
                                  'read': 'unread'
                                });
                                msgController.text = '';
                                _scrollController.animateTo(
                                  0.0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                              });
                            }
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: greyColor.withOpacity(0.40),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.send,
                              color: primaryColor,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // Bottom Sheet for Property Detail Start Here
  void _propertyDetailBottomSheet() {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: whiteColor,
            width: width,
            child: Wrap(
              children: <Widget>[
                Container(
                  width: width,
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 160.0,
                        width: 130.0,
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
                            image: AssetImage('assets/house/house_6.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      widthSpace,
                      Container(
                        height: 160.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sky View House',
                                  style: black18BoldTextStyle,
                                ),
                                height5Space,
                                Text(
                                  'Opera Street, New York',
                                  style: grey14MediumTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '360000\$',
                                  style: black18BoldTextStyle,
                                ),
                                heightSpace,
                                InkWell(
                                  borderRadius: BorderRadius.circular(5.0),
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        fixPadding, 5.0, fixPadding, 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: primaryColor,
                                    ),
                                    child: Text(
                                      'View more',
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
                )
              ],
            ),
          );
        });
  }
  // Bottom Sheet for Property Detail Ends Here
}
