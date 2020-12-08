import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageBMI()
      // MyHomePage(
      //   title: "DSC",
      // )
//=================================================================
//       Scaffold(
//         appBar: AppBar(
//           title: Text('NCCUxDSC Flutter Example'),
//         ),
//         body:
// ========================================================
        //StatelessExample(), //stateless widget example (Row)
 //==========================================================row example
 //        Row(
 //          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //水平的擺
 //          crossAxisAlignment: CrossAxisAlignment.start,  //垂直的擺
 //          children: <Widget>[
 //            Text('How', style:TextStyle(fontSize:30)),
 //            Text('are', style:TextStyle(fontSize:30)),
 //            Text('you',style:TextStyle(fontSize:30)),
 //            Icon(Icons.face,color: Colors.indigo)
 //          ],
 //        )
//===========================================================Container=======
//         Container(
//           color: Colors.amber, //設定顏色  沒有子元素的時候會盡量放大
//           //child: Text('Example'), //有子元素的時候 會盡量跟子元素一樣大
//           //height: 200,
//           //width:300,
//           //alignment: Alignment.centerLeft, //設定對齊方法
//           //margin: EdgeInsets.all(50),//margin 外擴
//           //padding: EdgeInsets.all(50),//padding 內縮
//         )
//=============================================================================
         //),
      );
    }
  }

// default statefulWidget counter example
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title; //固定
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {//額外建構一個對應的state的類別去定義UI 其中泛型的地方必須放對應的statefulwidget
  int _counter = 0;
  void _incrementCounter() {  //宣告function 裡面去call setStage()的 function
    // 這個setStage會執行count++
    setState(() { //寫在stage裡的function 可以視為他會重新去執行build 函式會去重新繪製介面
      _counter++; //簡單來說就是，通知Flutter 狀態改變了， build 根據新狀態建立新的 Widget
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),//透過widget的這個屬性去讀取定義在MyHomePage這個類別裡的屬性
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',  //必須用setstage才可以去刷新
              style: Theme.of(context).textTheme.headline4, //數字越小字體越大
            ),
            //HomeContent(),//可以再包一個其他的StatefulWidget
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( //scaffold 裡面定義的buttion
        onPressed:
        //     (){   //這樣做只能視為在build內做資料的存取並沒有和顯示在UI上的值去做綁定。
        //   _counter++;
        //   print(_counter);
        // },
        _incrementCounter, //呼叫_incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//stateful widget example
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}
class _HomeContentState extends State<HomeContent> {
  int c=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('$c'),
          FlatButton(onPressed: (){
            setState(() {
              c ++;
            });
          }, child:Text('click'))
        ],
      ),
    );
  }
}

//stateless widget example
class StatelessExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
         body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('How',style:TextStyle(fontSize:30)),
            Text('are',style:TextStyle(fontSize:30)),
            Text('you',style:TextStyle(fontSize:30)),
            Icon(Icons.face,color: Colors.indigo)
          ],
        )
    );
  }
}

//BMI stateful widget example
class HomePageBMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}
class _BMIState extends State<HomePageBMI> {
  var _height = TextEditingController();  //可以讓使用著輸入的時候不斷的更新裡面的屬性e.g text
  var _weight = TextEditingController();
  String BMIvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI計算機"),
      ),
      body:Column(
        children:[
        TextField( //讓使用者可以輸入文字的輸入框元件
          controller: _height,  //輸入框的編輯器
          keyboardType: TextInputType.number,//鍵盤類型
          decoration: InputDecoration(   //放提示字元
            hintText: ' 身高(cm)'
          ),
        ),
          TextField(
            controller: _weight,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(   //放提示字元
              hintText: ' 體重(kg)'
            )
          ),
           Text(BMIvalue?? ''),
           RaisedButton(onPressed: (){    //放一個可以被按的button //OnPressed() 被按後要做甚麼事
            print(_height.text); //for debug
            print(_weight.text);
            var h = double.parse(_height.text)/100.0;
            var w = double.parse(_weight.text);
            var bmi = w/(h*h);
            setState(() {
              BMIvalue = '你的BMI = $bmi';  //dart的寫法
            });
          },
               child:Text('計算')
          )
        ]
      )
    );
  }
}

//stateful widget example
class StatefulWidgetPage extends StatefulWidget {
  @override
  _StatefulWidgetPageState createState() => _StatefulWidgetPageState();
}
class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



