import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Views/AppColors.dart';
import 'Views/AppStyle.dart';
import 'Views/CustomExpandabletile.dart';
import 'Views/OnTapLocationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool doExpanded = false;
  bool expand2 = false;
  bool expand3 = false;
  bool expand4 = false;
  bool expand5 = false;
  List<dynamic>? headData = [];
  List<dynamic>? allData = [];
  List<dynamic>? expandState1 = [];
  List<dynamic>? expandState2=[];
  List<dynamic>? expandState3=[];
  String parentId='';

  Map<String, dynamic> data = {
    "data": [
      {"locationName": "India", "LocId": "1234", "ParentLocId": "","type":"cat"},
      {"locationName": "punjab", "LocId": "111", "ParentLocId": "1234","type":""},
      {"locationName": "haryana", "LocId": "222", "ParentLocId": "1234","type":""},
      {"locationName": "Chandigarh", "LocId": "1111", "ParentLocId": "111","type":""},
      {"locationName": "Bathinda", "LocId": "1112", "ParentLocId": "111","type":""},
      {"locationName": "Ludhiana", "LocId": "1113", "ParentLocId": "111","type":""},
      {"locationName": "Rohtak", "LocId": "2221", "ParentLocId": "222","type":""},
      {"locationName": "panipat", "LocId": "2222", "ParentLocId": "222","type":""},
      {"locationName": "America", "LocId": "987", "ParentLocId": "","type":"cat"},
      {"locationName": "Texs", "LocId": "999", "ParentLocId": "987","type":""},
      {"locationName": "Huston", "LocId": "991", "ParentLocId": "999","type":""},
      {"locationName": "Plano", "LocId": "992", "ParentLocId": "999","type":""},

      {"locationName": "building 1", "LocId": "1", "ParentLocId": "1111","type":""},
      {"locationName": "building 2", "LocId": "2", "ParentLocId": "1112","type":""},
      {"locationName": "building 3", "LocId": "3", "ParentLocId": "1113","type":""},
      {"locationName": "building 4", "LocId": "4", "ParentLocId": "2221","type":""},
      {"locationName": "building 5", "LocId": "5", "ParentLocId": "2222","type":""},
      {"locationName": "building 5", "LocId": "6", "ParentLocId": "991","type":""},
      {"locationName": "building 5", "LocId": "7", "ParentLocId": "992","type":""},
    ]
  };

  @override
  void initState() {
    returnmapp();
  }
  returnmapp(){
    data.values.first.forEach((e){
          allData?.add(e);
      if(e['type']=='cat') {
        headData?.add(e);
      }
    });
  }

  // List<dynamic> country = [
  //   {
  //     "key": "India",
  //     "state": [ {
  //       "name": "Punjab",
  //       "local": [{
  //         "Lname": "chandigarh",
  //         "projectId": 0,
  //       },
  //         {
  //           "Lname": "Bathinda",
  //           "projectId": 0,
  //         },
  //         {
  //           "Lname": "Ludhiana",
  //           "projectId": 0,
  //         }],
  //     },
  //       {
  //         "name": "Haryana",
  //         "local": [{
  //           "Lname": "Rohtak",
  //           "projectId": 0,
  //         },
  //           {
  //             "Lname": "Panipath",
  //             "projectId": 0,
  //           },
  //           {
  //             "Lname": "Kurukshetra",
  //             "projectId": 0,
  //           }],
  //       }],
  //   },
  //   {
  //     "key": "America",
  //     "state": [ {
  //       "name": "Texs",
  //       "local": [{
  //         "Lname": "Houston",
  //         "projectId": 0,
  //       },
  //         {
  //           "Lname": "Plano",
  //           "projectId": 0,
  //         },
  //         {
  //           "Lname": "Sherman",
  //           "projectId": 0,
  //         }],
  //     },
  //       {
  //         "name": "Tokiyo",
  //         "local": [{
  //           "Lname": "Ginza",
  //           "projectId": 0,
  //         },
  //           {
  //             "Lname": "Roppongi",
  //             "projectId": 0,
  //           },
  //         ],
  //       },
  //       {
  //         "name": "Rio",
  //         "local": [{
  //           "Lname": "Lapa",
  //           "projectId": 0,
  //         },
  //           {
  //             "Lname": "Leblon",
  //             "projectId": 0,
  //           },
  //           {
  //             "Lname": "Santa Teresa",
  //             "projectId": 0,
  //           }],
  //       }],
  //   },];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Item Location'.toUpperCase(),
            style: const TextStyle(color: Colors.black, fontSize: 16),
            //style: AppStyles.toolbarTitleStyle,
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: AppColors.COLOR_PRIMARY_ACCENT,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            // widget.onApplyFilter(currentState, false);
          },
          child: const SizedBox(
            height: 45,
            child: Center(
              child: Text('SAVE & CONTINUE',
                  style: TextStyle(color: Colors.white, fontSize: 16)
                  //style: AppStyles.APPLY_BUTTON
                  ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              color: AppColors.HIGHLIGHT_COLOR,
              padding: const EdgeInsets.only(
                  left: 12, right: 16, top: 12, bottom: 12),
              child: Text(
                "ITEM LOCATION > ${widget.title} >".toUpperCase(),
                style: const TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'Lato'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: headData?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.5, color: Colors.grey.shade300),
                          ),
                        ),
                        child: customExpansiontile(
                          onExpansionChanged: (expanded) {
                            if(expanded==true){
                              expandState1?.add(headData?[index]['LocId']);
                            }else{
                              expandState1?.remove(headData?[index]['LocId']);
                                expandState2?.remove(headData?[index]['ParentId']);
                                expandState3=[];
                            }
                            setState(() {});
                          },
                          trailing: const SizedBox.shrink(),
                          leading: (expandState1!.contains(headData?[index]['LocId']))
                              ? const Icon(CupertinoIcons.minus_circle_fill,
                                  size: 29, color: AppColors.addIcon)
                              : const Icon(Icons.add_circle,
                                  size: 29, color: AppColors.addIcon),
                          title: Text(headData?[index]['locationName'],
                              style: AppStyles.LablesValueOfAddItemForm),
                          collapsedTextColor: Colors.black,
                          children: expansionTile(headData?[index]['LocId']),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }

  expansionTile(String parentId) {
    List<dynamic> list=[];
    allData?.forEach((element) {
      if(element['ParentLocId']== parentId){
        list.add(element);
      }
    });
      return list.map<Widget>((e) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border(
                    top: BorderSide(width: .5, color: Colors.grey.shade300),
                  ),
                ),
                child: customExpansiontile(
                    onExpansionChanged: (isActive) {
                      if (isActive == true) {
                        expandState2?.add(e['LocId']);
                      }else{
                        expandState2?.remove(e['LocId']);
                        expandState3?.remove(e['ParentLocId']);
                      }
                      setState(() {});
                    },
                    tilePadding: const EdgeInsets.only(left: 40),
                    trailing: const SizedBox.shrink(),
                    leading:(expandState2!.contains(e['LocId']))
                        ? const Icon(CupertinoIcons.minus_circle_fill,
                            size: 29, color: AppColors.addIcon)
                        : const Icon(Icons.add_circle,
                            size: 29, color: AppColors.addIcon),
                    title: Text(e['locationName'],
                        style: AppStyles.LablesValueOfAddItemForm),
                    collapsedTextColor: Colors.black,
                    children: expansionTile2(e['LocId'])
                ),
              ))
          .toList();
  }

  expansionTile2(String p) {
    List<dynamic> list=[];
    allData?.forEach((element) {
      if(element['ParentLocId']== p){
        list.add(element);
      }
    });
    return list.map<Widget>((e) => Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border(
                  top: BorderSide(width: 1.5, color: Colors.grey.shade300),
                ),
              ),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: customExpansiontile(
                onExpansionChanged: (isActive) {
                  if (isActive == true) {
                    expandState3?.add(e['LocId']);
                  }else{
                    expandState3?.remove(e['LocId']);
                  }
                  setState(() {});
                },
                 tilePadding: const EdgeInsets.only(left: 60),
               // contentPadding: const EdgeInsets.only(left: 50),
                trailing: const SizedBox.shrink(),
                // leading: const SizedBox(),
                leading: expandState3?.contains(e['LocId'])==true? const Icon(CupertinoIcons.minus_circle_fill, size: 29,  color: AppColors.addIcon):const Icon(Icons.add_circle, size: 29,  color: AppColors.addIcon),
                title: Text(e['locationName'], style: AppStyles.LablesValueOfAddItemForm),
              children: expansionTile3(e['LocId']),
              ),
            ))
        .toList();
  }

  expansionTile3(String parentId) {
    List<dynamic> list=[];
    allData?.forEach((element) {
      if(element['ParentLocId']== parentId){
        list.add(element);
      }
    });
    return list.map((e) => Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(
          top: BorderSide(width: 1.5, color: Colors.grey.shade300),
        ),
      ),
      //padding: EdgeInsets.symmetric(horizontal: 15),
      child: customExpansiontile(
        onExpansionChanged: (isActive) {
          if (isActive == true) {
            expandState3?.add(e['LocId']);
          }else{
            expandState3?.remove(e['LocId']);
          }
          setState(() {});
        },
        tilePadding: const EdgeInsets.only(left: 80),
        // contentPadding: const EdgeInsets.only(left: 50),
        trailing: const SizedBox.shrink(),
        // leading: const SizedBox(),
        leading: expandState3?.contains(e['LocId'])==true? const Icon(CupertinoIcons.minus_circle_fill, size: 29,  color: AppColors.addIcon):const Icon(Icons.add_circle, size: 29,  color: AppColors.addIcon),
        title: Text(e['locationName'], style: AppStyles.LablesValueOfAddItemForm),
        children: expansionTile3(e['LocId']),
      ),
    ))
        .toList();
  }

}
