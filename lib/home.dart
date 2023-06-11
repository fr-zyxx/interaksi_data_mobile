import 'package:flutter/material.dart';
import 'package:tugas_mobile_api/controller.dart';
import 'package:tugas_mobile_api/model/Json.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get API"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List<Test>>(
        future: getTests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final List<Test> testList = snapshot.data!;
            return ListView.builder(
              itemCount: testList.length,
              itemBuilder: (context, index) {
                Test testData = testList[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("userId    : ${testData.userId}"),
                                Text("id            : ${testData.id}"),
                                Text(
                                  "${testData.title}",
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                                Text("completed : ${testData.completed}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Gagal memuat data");
          } else {
            return Text("Tidak ada data");
          }
        },
      ),
    );
  }
}
