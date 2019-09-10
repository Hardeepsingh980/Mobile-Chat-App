import 'package:flutter/material.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'DeeChat',

      home: HomePage(),

      theme: ThemeData(

        brightness: Brightness.dark,
        primaryColor: Colors.lightGreen,

      ),
      
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('DeeChat'),
        centerTitle: true,


      ),

      body: ChatScreen(),
      
    );
  }
}


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  TextEditingController msgCon = TextEditingController();

  List<ChatMsg> _messages = <ChatMsg> [];



  void _handleSubmit(String text) {

    msgCon.clear();

    ChatMsg msg = ChatMsg(text: text,);

    setState(() {
     _messages.insert(0, msg); 
    });


  }



  Widget _textComposer() {

    return IconTheme(

          data: IconThemeData(

            color: Theme.of(context).primaryColor

          ),

          child: Container(


        margin: EdgeInsets.symmetric(horizontal: 8.0),

        child: Row(
          children: <Widget>[

            Flexible(
              child: TextField(

                decoration: InputDecoration.collapsed(

                  hintText: 'Enter The Message...'
                  

                ),

                controller: msgCon,

                // onSubmitted: _handleSubmit(),

              ),
            ),
          
            Container(

              margin:  EdgeInsets.symmetric(horizontal: 4.0),

              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  _handleSubmit(msgCon.text);
                },
                ),

            ),

          ],
        ),


      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(

        children: <Widget>[

          Flexible(

            child: ListView.builder(

              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index ) => _messages[index] ,
              itemCount: _messages.length,

            ),

          ),

          Divider(height: 1.0,),

          Container(

            decoration: BoxDecoration(

              color: Theme.of(context).cardColor,


            ),

            child: _textComposer(),

          ),

        ],

      ),


      
    );
  }
}


class ChatMsg extends StatelessWidget {

  String text;

  ChatMsg({this.text});




  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 10.0),

      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[

         Container(

           margin: EdgeInsets.only(right: 16.0),

           child: CircleAvatar(

             child: Icon(Icons.account_circle),

           ),

         ),

         Column(

           crossAxisAlignment: CrossAxisAlignment.start,

           children: <Widget>[

             Text('Hardeep', style: Theme.of(context).textTheme.subtitle,),

             Container(

               margin: EdgeInsets.only(top: 5.0),

               child: Text(text, style: Theme.of(context).textTheme.title,),

             ),

           ],

         ),

        ],),
      
    );
  }
}