import 'package:flutter/material.dart';

class ModalBusca extends StatefulWidget {
  const ModalBusca({super.key});

  @override
  State<ModalBusca> createState() => _ModalBuscaState();
}

class _ModalBuscaState extends State<ModalBusca> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height),
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
              const Padding(padding: EdgeInsets.only(bottom: 30)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(68, 83, 191, 1.0),
                    elevation: 2,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: const Text(
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
