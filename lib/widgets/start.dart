import 'package:flutter/material.dart';
import 'package:untitled/widgets/cards.dart';

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class Tasks {
  String title;
  String author;

  Tasks({
    required this.title,
    required this.author,
  });
}

class _StartPageState extends State<StartPage> {
  List AllQuotes = [
    Tasks(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    Tasks(author: "Ali 7assan", title: "العقل السليم في البعد عن الحريم 😂"),
    Tasks(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    Tasks(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
    Tasks(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    Tasks(author: "Ali 7assan", title: "العقل السليم في البعد عن الحريم 😂"),
    Tasks(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    Tasks(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];

  delete(Tasks item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  addnewtask() {
    setState(() {
      AllQuotes.add(
          Tasks(title: myController.text, author: myController2.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(22),
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: myController,
                            maxLength: 20,
                            decoration: InputDecoration(
                              hintText: "ADD NEW quote",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: myController2,
                            maxLength: 20,
                            decoration: InputDecoration(
                              hintText: "ADD author",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                              onPressed: () {
                                addnewtask();

                                Navigator.pop(context);
                              },
                              child: Text(
                                "ADD",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              )),
                        ),
                      ],
                    ),
                  );
                },
                isScrollControlled: true);
          },
          backgroundColor: Color.fromRGBO(58, 66, 86, 1),
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1),
          title: Text(
            "Best Quotes",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...AllQuotes.map((item) => Cards(
                    item: item,
                    delete: delete,
                  )).toList()
            ],
          ),
        ),
      ),
    );
  }
}
