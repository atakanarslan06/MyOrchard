import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NotlarSayfa extends StatefulWidget {
  NotlarSayfa({Key? key}) : super(key: key);

  @override
  State<NotlarSayfa> createState() => _NotlarSayfaState();
}

class _NotlarSayfaState extends State<NotlarSayfa> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Flexible(
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('notlar')
                        .snapshots(),
                    builder: (context, snapshot) {
                      final notlar = snapshot.data?.docs;
                      if (notlar == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (notlar.isEmpty) {
                        return const Center(
                          child: Text('Henüz Not Eklenmedi', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),),
                        );
                      }
                      return ListView.builder(
                        itemCount: notlar.length,
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final not = notlar[index];
                          return Dismissible(
                            key: Key(not.id),
                            background: Container(
                              color: Colors.red.shade400,
                              alignment: Alignment.centerRight,
                              child: const Padding(
                                padding:  EdgeInsets.only(right: 15,),
                                child:  Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                             onDismissed: (direction){
                              FirebaseFirestore.instance.collection('notlar').doc(not.id).delete();
                             },
                            child: Card(
                              color: Colors.lightGreen.shade400,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      not['not'],
                                      style: const TextStyle(color: Colors.brown,
                                      fontWeight: FontWeight.bold, ),
                                    ),
                                    const Divider(),
                                    Text(
                                      DateFormat('dd/MM/yyyy    HH:mm').format(not['createdAt'].toDate(),),
                                      style: TextStyle(color: Colors.brown,
                                        fontWeight: FontWeight.bold,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                _inputFields(),
              ],
            ),
          ),
        ));
  }

  Padding _inputFields() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              cursorColor: Colors.brown,
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Not gir..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('notlar').add(
                {'not': _controller.text, 'createdAt': Timestamp.now()}
              );
              _controller.clear();
            },
            icon: const Icon(Icons.send_rounded),
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
