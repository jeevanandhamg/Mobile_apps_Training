import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
   const CurrencyConverterMaterialPage({super.key});
 @override
  State<StatefulWidget> createState() {
    return _CurrencyConverterMaterialPage();
  }
}

class _CurrencyConverterMaterialPage extends State<CurrencyConverterMaterialPage> {
  
  double result = 0;
     TextEditingController textEditingController  = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  covert() {
    print(double.parse(textEditingController.text)*81);
                setState(() {
                  result = double.parse(textEditingController.text)*81;
                });
    }
@override
  Widget build(BuildContext context) {
     
    return  Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Currency converter",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [ Text(result.toStringAsFixed(2),
           style: const TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
           ),
           ),
           Container(
             padding: const EdgeInsets.all(8.0),
             margin: const EdgeInsets.only(top: 10.0),
             child:  TextField(
              controller: textEditingController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: "Please enter the amountin USD",
                hintStyle: TextStyle(
                  color:Colors.white,
                ),
                prefixIcon: Icon(Icons.monetization_on_outlined,
                color: Colors.white,),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                  color: Colors.white,
                  width: 4.0,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignOutside
                  ),
           
                  ),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                  color: Colors.white,
                  
                  ),)
              ),
              cursorColor: Colors.white,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              signed: false),
              // textAlign: TextAlign.center,
             ),
           ),

           Container(
            padding: const EdgeInsets.all(8.0),
            //  margin: const EdgeInsets.only(top: 2.0),
             child: TextButton(onPressed:  covert,
             style:  ButtonStyle(
              elevation: const MaterialStatePropertyAll(07),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              minimumSize: const MaterialStatePropertyAll(Size(double.infinity,50)),
              padding: const MaterialStatePropertyAll(EdgeInsets.all(10.0)),
              shadowColor: const MaterialStatePropertyAll(Colors.white),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.black)
              ),
              
              )
              ), 
             child: const Text("click",
             style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              
             ),
             ),
             ),
           )
           ]
          ),
        ),
      );
    
  }
  
 }