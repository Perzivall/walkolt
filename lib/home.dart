import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dart_snmp/dart_snmp.dart';
import 'package:dart_snmp/src/models/varbind.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {

    funcionX()async{
      var target = InternetAddress('10.40.251.2');
      var session = await Snmp.createSession(target, community: "alfanetinternet");


      String oidValue = '1.3.6.1.4.1.3902.1012.3.28.1.1.2';

      var message = await session.getNext(Oid.fromString(oidValue));
      print(message.pdu.varbinds[0].value);

      // while(oidValue.substring(31, 32) == '2'){
      //   var message = await session.get(Oid.fromString(oidValue));
      //   print(message.pdu.varbinds.length);
      //   oidValue = message.pdu.varbinds[0].oid.identifier.toString();
      // }

    }

    funcionX();
    return Scaffold(
      appBar: AppBar(),
      body: Container()
    );
  }
}
