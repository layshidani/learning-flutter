import 'package:flutter/material.dart';

import 'package:atm_consulting/clients_page.dart';
import 'package:atm_consulting/contact_page.dart';
import 'package:atm_consulting/service_page.dart';
import 'package:atm_consulting/company_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _openCompany() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CompanyPage()));
  }

  void _openClients() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ClientsPage()));
  }

  void _openContact() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ContactPage()));
  }

  void _openServices() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ServicePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM Consultoria'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Image.asset('images/logo.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _openCompany,
                    child: Image.asset('images/menu_empresa.png'),
                  ),
                  GestureDetector(
                    onTap: _openServices,
                    child: Image.asset('images/menu_servico.png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _openClients,
                    child: Image.asset('images/menu_cliente.png'),
                  ),
                  GestureDetector(
                    onTap: _openContact,
                    child: Image.asset('images/menu_contato.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
