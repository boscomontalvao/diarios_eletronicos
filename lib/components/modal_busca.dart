import 'package:flutter/material.dart';

class ModalBusca extends StatefulWidget {
  const ModalBusca({super.key});

  @override
  State<ModalBusca> createState() => _ModalBuscaState();
}

class _ModalBuscaState extends State<ModalBusca> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.8,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Busque por um servidor ou processo de licitação",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(68, 83, 191, 1.0),
                    elevation: 2,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: Text(
                  'Buscar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
