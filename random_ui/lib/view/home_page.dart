import 'package:flutter/material.dart';
import 'package:random_ui/widget/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> headrsList = [
    "Covered",
    "Partially",
    "Personal",
    "Relevent",
    "Claim"
  ];
  final Map<String, String> calculation = {
    'Total Billed': '22,850.75',
    'Paid Amount': '17,914.25',
    'Denied': '4,936.50',
  };
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black54),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    "Clamis Details",
                    style: myStyle(25, Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1546961329-78bef0414d7c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Policy Number",
                              style: myStyle(15),
                            ),
                            Text(
                              "CA311712841",
                              style: myStyle(25, Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black45),
                      child: const Icon(Icons.calendar_month_rounded),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selected == index
                                        ? Colors.greenAccent
                                        : Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              "${headrsList[index]}",
                              style: myStyle(15, Colors.white),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) => SizedBox(
                            width: 5,
                          ),
                      itemCount: headrsList.length),
                ),
                Spacer(),
                Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: calculation.length,
                      itemBuilder: (context, index) {
                        var keys = calculation.keys.elementAt(index);
                        var values = calculation[keys];
                        return Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(keys, style: myStyle(20)),
                              Text(
                                "\$ ${values.toString()}",
                                style: myStyle(25, Colors.white),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}
