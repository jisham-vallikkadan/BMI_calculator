import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Bmicalculator extends StatefulWidget {
  const Bmicalculator({Key? key}) : super(key: key);

  @override
  State<Bmicalculator> createState() => _BmicalculatorState();
}

class _BmicalculatorState extends State<Bmicalculator> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _heightcontoer = TextEditingController();
  TextEditingController _weightcontroler = TextEditingController();
  // double result=0 ;

  // double result=0;

  double? result;

  void bmiclaculate() {
    double BMI;
    // double result;
    double weight;
    double height;
    weight = double.parse(_weightcontroler.text);
    height = double.parse(_heightcontoer.text) / 100;
    BMI = weight / (height * height);
    result = BMI;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(
            child: Text(
              'BMI CALCULATOR',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.height,
                          color: Colors.black38,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Height';
                              }
                              return null;
                            },
                            controller: _heightcontoer,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero),
                              labelText: 'Height',
                              labelStyle: TextStyle(color: Colors.black),

                              // border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.line_weight,
                          color: Colors.black38,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Weight';
                              }
                              return null;
                            },
                            controller: _weightcontroler,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              // border: InputBorder.none,
                              labelText: 'Weight',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[400],
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            bmiclaculate();
                            if(_weightcontroler.text.isEmpty){
                              result=0;
                            }
                          }
                        });
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    result == null
                        ? 'enter value'
                        : '${result?.toStringAsFixed(3)}',

                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
