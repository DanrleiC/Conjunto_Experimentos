import 'package:flutter/material.dart';

class CheckBoxListPage extends StatefulWidget {
  const CheckBoxListPage({super.key});
  @override
  State<CheckBoxListPage> createState() => _CheckBoxListPageState();
}

class _CheckBoxListPageState extends State<CheckBoxListPage> {
  bool isSelected = false;
  List<bool?> boolCard = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckBox List :D'),
      ),
      body:  ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) => scaffoldCard(index),
      ),
    );
  }

  Widget scaffoldCard(int index){
    for (var i = 0; i < cards.length; i++) {
      if(cards.length != boolCard.length){
        boolCard.add(false);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Row(
              children: [
                createCheckBox(index),
                Text(cards[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget createCheckBox(int index){
    if (isSelected) {
      return Checkbox(
        checkColor: Colors.black,
        activeColor: Colors.white,
        value: boolCard[index], 
        onChanged: (e) {
          setState(() {
            boolCard[index] = e;
          });
        }
      );
    }else{
      return Container();
    }
  }

  List<String> cards = [
    'Batata',
    'Feijoada',
    'Mandioquinha'
  ];

}