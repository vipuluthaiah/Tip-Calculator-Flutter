import 'package:flutter/material.dart';
import 'hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tipPercentage = 0;

  int _personCounter = 1;

  double _billAmount = 0.0;

  Color _purple = HexColor("#6908D6");


        Container  _getImage2() {

return  Container(
  alignment: Alignment.bottomCenter,
width: 60,
height: 60,
decoration: BoxDecoration(
  color: Colors.transparent,
  borderRadius: BorderRadiusDirectional.all(Radius.circular(100.0)),
  border: Border.all(color: Colors.greenAccent,width: 10.0),
  image: DecorationImage(image: NetworkImage("https://avatars0.githubusercontent.com/u/45168922?s=400&u=dd272d2fb6bc6e005b29dd0877bcd3c539b60aa8&v=4"),
  fit: BoxFit.cover
  ),
),
);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Total Bill Per Person",
                        style:
                            TextStyle(
                              fontSize: 21,
                               fontWeight: FontWeight.bold,
                               color: _purple
                               ),
                      ),
                    ),
                    Text("\₹ ${ calculateTotalPerPersoncentage(_billAmount, _personCounter, _tipPercentage)}",
                    style: TextStyle(
                      fontSize: 40,
                      color: _purple,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: _purple,
                    ),
                    decoration: InputDecoration(
                        prefixText: "Enter Bill Amount :  ",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Split",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.topRight,
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1)
                                  ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: _purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0
                                      ),
                                ),
                              ),
                            ),
                          ),

                          Text(
                            "$_personCounter",
                            style: TextStyle(
                              color: _purple,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                               _personCounter++;
                              });
                            },
                            child: Container(
                              alignment: Alignment.topRight,
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: _purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Tip",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\₹ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                          style: TextStyle(
                            color: _purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),

//slider
                  Column(
                    children: <Widget>[
                      Text(
                        "$_tipPercentage %",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: _purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                          activeColor: _purple,
                          divisions: 10,
                          min: 0,
                          max: 100,
                          inactiveColor: Colors.grey,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercentage = value.round();
                            });
                          })
                        
                    ],
                    
                  ),
                
                ],
                
              ),
              
            ),
        

Stack(
  fit: StackFit.passthrough,
  children: <Widget>[

                Padding(
                
              padding: const EdgeInsets.all(22.0),
              child: Container(
                
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: _purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                
                child: Center(
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "Created By ",
                          style:
                              TextStyle(
                                fontSize: 25,
                                 fontWeight: FontWeight.bold,
                                 color: _purple
                                 ),
                        ),
                        
                      ),

                      Text("Vipul Uthaiah",
                      style: TextStyle(
                        fontSize: 16,
                        color: _purple,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Spacer(),
    _getImage2(),

Spacer(),
                    ],
                  ),
                ),
              ),
            ),


  ],
)



          ],
          
        ),
      
      ),
    
    );
  }

calculateTotalPerPersoncentage(double billAmount,int splitBy,int tipPercentage){

var totalPerPerson=(calculateTotalTip(billAmount, splitBy, tipPercentage) 
+ billAmount) / splitBy ;

return totalPerPerson.toStringAsFixed(2);

}

calculateTotalTip(double billAmount,int splitBy,int tipPercentage){

double totalTip=0.0;

if (billAmount<0 || billAmount.toString().isEmpty || billAmount==null) {
  
}else{
  totalTip =(billAmount * tipPercentage) /100;
}
return totalTip;
}

}
