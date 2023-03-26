import 'package:flutter/material.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController carColorController = TextEditingController();

  List<String> carTypeList = [
    'uber-x', 'uber-go', 'bike'
  ];

  String? selectedCarType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //const SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('images/1.png'),
              ),

              const Text(
                'Write car details',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),

              TextField(
                style: const TextStyle(color: Colors.black),
                controller: carModelController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Car Model',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: 'car model',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor))),
              ),

              TextField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: carNumberController,
                decoration: InputDecoration(
                    labelText: 'Car Number',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: '000 000 0000',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor))),
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: carColorController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Car Colour',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: 'Red Accent',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor))),
              ),
          const SizedBox(height: 5,),
              DropdownButton(
                  items: carTypeList.map((car) {
                    return  DropdownMenuItem(
                        value: car,
                        child: Text(car,
                        style: const TextStyle(
                          color: Colors.black
                        ),),

                    );

                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCarType = newValue.toString();
                    });
                  },
                  value: selectedCarType,
                hint: const Text('Please choose Car Type',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
                ),),
              ),

              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (e)=> CarInfoScreen()));
                  },
                  child: const Text('Save Now',
                    style: TextStyle(
                        color: Colors.white
                    ) ,)),
            ],
          ),
        ),
      ),
    );
  }
}
