import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM Consultoria'),
        backgroundColor: const Color.fromRGBO(237, 108, 66, 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        top: 32, right: 20, bottom: 32, left: 20),
                    child: Image.asset('images/detalhe_empresa.png')),
                Text(
                  'Sobre a Empresa'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(237, 108, 66, 20)),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae turpis massa sed elementum tempus egestas sed. Tellus in hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Nisl vel pretium lectus quam id leo in. Pretium vulputate sapien nec sagittis. Commodo sed egestas egestas fringilla phasellus. Iaculis urna id volutpat lacus laoreet non. Venenatis cras sed felis eget velit aliquet. Aenean pharetra magna ac placerat vestibulum lectus. Tristique senectus et netus et malesuada fames ac turpis. Nam libero justo laoreet sit amet cursus sit. Nisl nisi scelerisque eu ultrices vitae auctor eu augue ut. Consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo. Viverra nam libero justo laoreet sit. Sit amet mattis vulputate enim nulla aliquet porttitor lacus. Arcu bibendum at varius vel pharetra vel. Mauris augue neque gravida in fermentum. Curabitur gravida arcu ac tortor dignissim convallis aenean et.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
