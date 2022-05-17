import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';

class Verifier_Search extends StatefulWidget {
  const Verifier_Search({Key? key}) : super(key: key);

  @override
  State<Verifier_Search> createState() => _Verifier_SearchState();
}

class _Verifier_SearchState extends State<Verifier_Search> {
  List queryResultSet = [];
  List tempSearchStore = [];

  void initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var a =
        FirebaseFirestore.instance.collection('Verifier').get().then((value) {
      value.docs.forEach((element) {
        print(element.data()['category_list']);
      });
    });

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    // if (queryResultSet.length == 0 && value.length == 1) {
    //   SearchService().searchByName(value).then((QuerySnapshot docs) {
    //     for (int i = 0; i < docs.docs.length; ++i) {
    //       queryResultSet.add(docs.docs[i]);
    //     }
    //   });
    // } else {
    //   tempSearchStore = [];
    //   queryResultSet.forEach((element) {
    //     if (element['category_list'].startsWith(capitalizedValue)) {
    //       setState(() {
    //         tempSearchStore.add(element);
    //       });
    //     }
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('Firestore search'),
        ),
        // body: ListView(children: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: TextField(
        //       onChanged: (val) {
        //         initiateSearch(val);
        //         print(val);
        //       },
        //       decoration: InputDecoration(
        //           prefixIcon: IconButton(
        //             color: Colors.black,
        //             icon: Icon(Icons.arrow_back),
        //             iconSize: 20.0,
        //             onPressed: () {
        //               Navigator.of(context).pop();
        //             },
        //           ),
        //           contentPadding: EdgeInsets.only(left: 25.0),
        //           hintText: 'Search by name',
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(4.0))),
        //     ),
        //   ),
        //   SizedBox(height: 10.0),
        //   Text('hello'),
        //   Container(
        //     width: 200,
        //     height: 300,
        //     child: GridView.count(
        //         padding: EdgeInsets.only(left: 10.0, right: 10.0),
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 4.0,
        //         mainAxisSpacing: 4.0,
        //         primary: false,
        //         shrinkWrap: true,
        //         children: tempSearchStore.map((element) {
        //           return buildResultCard(element);
        //         }).toList()),
        //   )
        // ]));

        body: FirestoreSearchScaffold(
          firestoreCollectionName: 'Verifier',

          searchBy: 'category_list',
          scaffoldBody: Center(),
          dataListFromSnapshot: DataModel().dataListFromSnapshot,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DataModel>? dataList = snapshot.data;
              if (dataList!.isEmpty) {
                return const Center(
                  child: Text('No Results Returned'),
                );
              }
              return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    final DataModel data = dataList[index];

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${data.category_list! }',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    );
                  });
            }

            if (snapshot.connectionState == ConnectionState.done) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('No Results Returned'),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

class DataModel {
  final String? category_list;
  DataModel({
    this.category_list,
  });

  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return DataModel(
        category_list: dataMap['category_list'],
      );
    }).toList();
  }
}
