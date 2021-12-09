import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
int? size;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Square print'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override  
  State<MyHomePage> createState() => _MyHomePageState();
}
Widget box = Container(
  width: 30,
  height: 30,
  decoration: BoxDecoration(
    border: Border.all(width: 2, color: Colors.black, style:BorderStyle.solid),
  )
);
List<Widget>? row = [];
List<List<Widget>>? square =[];
 void _printRow(){
   size =3;
   for(int i = 0; i < size!; i++){
     for(int j = 0; j < size!; j++){
      row!.add(box);
     }
     square! .add(<Widget>[]);
     for(int s = 0; s < size!; s++){
      square![i].add(row![s]);
     }
     row! .clear();
   }
   //setState(() {});
 }
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('square print'),
        leading: const IconButton(
          onPressed:_printRow,
          icon: Icon(Icons.power_outlined),
        )
      ),
      body: Center(
        child: Column(
          children:[
           size != null ? Text( "Square Size$size") :Container(),
           square!.isNotEmpty?
            Expanded(
             child: ListView.builder(
               itemBuilder: (context, index,) => Container(
                 child: Row(children: square![index]),
               ),
               itemCount: square!.length,
             ),
            )
            :Container(),
          ],
        ),
      ),
    );
  }
}
