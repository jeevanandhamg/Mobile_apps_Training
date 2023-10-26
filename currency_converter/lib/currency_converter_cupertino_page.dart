

import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {

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
      
    return  CupertinoPageScaffold(
      backgroundColor:  CupertinoColors.white,
     navigationBar: const CupertinoNavigationBar(
      backgroundColor: CupertinoColors.white,
      middle: Text("Currency Converter"),
     ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [ Text(result.toStringAsFixed(2),
           style: const TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.black,
           ),
           ),
           Container(
             padding: const EdgeInsets.all(8.0),
             margin: const EdgeInsets.only(top: 10.0),
             child:  CupertinoTextField(
              controller: textEditingController,
              style: const TextStyle(
                color: CupertinoColors.black,
              ),
              decoration:  BoxDecoration(
                color: CupertinoColors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(5)
              ),
              placeholder: "please enter the amount in USD",
              prefix: const Icon(CupertinoIcons.money_dollar),
             
              cursorColor:CupertinoColors.black,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              signed: false),
              // textAlign: TextAlign.center,
             ),
           ),

           Container(
            padding: const EdgeInsets.all(8.0),
            //  margin: const EdgeInsets.only(top: 2.0),
             child: CupertinoButton(onPressed:  covert,
            color: CupertinoColors.white,
             child: const Text("click",
             style: TextStyle(
              backgroundColor: CupertinoColors.black,
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