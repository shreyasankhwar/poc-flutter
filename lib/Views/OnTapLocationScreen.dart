import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'AppStyle.dart';
import 'CustomExpandabletile.dart';

// import 'Views/AppColors.dart';
// import 'Views/AppStyle.dart';
// import 'Views/CustomExpandabletile.dart';


class OnTapLocationScreen extends StatefulWidget {
  const OnTapLocationScreen({Key? key, required this.locations}) : super(key: key);


  final List<dynamic>? locations;

  @override
  State<OnTapLocationScreen> createState() => _OnTapLocationScreenState();
}

class _OnTapLocationScreenState extends State<OnTapLocationScreen> {
  bool doExpanded = false;
  bool expand2=false;
  bool expand3=false;
  bool expand4=false;
  bool expand5=false;

  List<dynamic> country = [
    {
      "key": "India",
      "state": [  {
        "name": "Punjab",
        "local": [{
          "Lname": "chandigarh",
          "projectId": 0,
        },
          {
            "Lname": "Bathinda",
            "projectId": 0,
          },
          {
            "Lname": "Ludhiana",
            "projectId": 0,
          }],
      },
        {
          "name": "Haryana",
          "local": [{
            "Lname": "Rohtak",
            "projectId": 0,
          },
            {
              "Lname": "Panipath",
              "projectId": 0,
            },
            {
              "Lname": "Kurukshetra",
              "projectId": 0,
            }],
        }],
    },
    {
      "key": "America",
      "state": [ {
        "name": "Texs",
        "local": [{
          "Lname": "Houston",
          "projectId": 0,
        },
          {
            "Lname": "Plano",
            "projectId": 0,
          },
          {
            "Lname": "Sherman",
            "projectId": 0,
          }],
      },
        {
          "name": "Tokiyo",
          "local": [{
            "Lname": "Ginza",
            "projectId": 0,
          },
            {
              "Lname": "Roppongi",
              "projectId": 0,
            },
          ],
        },
        {
          "name": "Rio",
          "local": [{
            "Lname": "Lapa",
            "projectId": 0,
          },
            {
              "Lname": "Leblon",
              "projectId": 0,
            },
            {
              "Lname": "Santa Teresa",
              "projectId": 0,
            }],
        }],
    },];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back,color: Colors.black,)),
        title: Center(
          child: Text(
            'Item Location'.toUpperCase(),style: const TextStyle(color: Colors.black,fontSize: 16),
            //style: AppStyles.toolbarTitleStyle,
          ),
        ),
      ),
      bottomNavigationBar:Material(
        color: AppColors.COLOR_PRIMARY_ACCENT,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            // widget.onApplyFilter(currentState, false);
          },
          child: Container(
            height:45,
            child: const Center(
              child: Text(
                  'SAVE & CONTINUE',style: TextStyle(color: Colors.white,fontSize: 16)
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
              padding: const EdgeInsets.only(left: 12, right: 16, top: 12, bottom: 12),
              child: Text(
                "ITEM LOCATION > >".toUpperCase(),style: const TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'Lato'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: widget.locations?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.5, color: Colors.grey.shade300),
                          ),
                        ),
                        child: customExpansiontile(
                          onExpansionChanged: (expanded) {
                            doExpanded=expanded;
                            if (doExpanded==false){
                              expand2=false;
                              expand3=false;
                              expand4=false;
                            }
                            setState(() {});
                          },
                          trailing: SizedBox.shrink(),
                          //leading: doExpanded==true? const Icon(CupertinoIcons.minus_circle_fill, size: 29,  color: AppColors.addIcon):const Icon(Icons.add_circle, size: 29,  color: AppColors.addIcon),
                          title: Text(  widget.locations?[index]['Lname'],
                              style: AppStyles.LablesValueOfAddItemForm
                          ),
                          collapsedTextColor: Colors.black,
                         children:[expansionTile()] ,
                        ),
                      );
                    })
            ),
          ],
        ),
      ),
    );
  }
  expansionTile() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(
          top: BorderSide(width: .5, color: Colors.grey.shade300),
        ),
      ),
      child:const Text('shreya'
      )
    );
  }
}
