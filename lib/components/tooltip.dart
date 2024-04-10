import 'package:flutter/material.dart';

class InfoButtom extends StatelessWidget {
  const InfoButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

    return Tooltip(
      key: tooltipkey,
      triggerMode: TooltipTriggerMode.manual,
      showDuration: const Duration(seconds: 1),
      message:
          'Você pode filtrar pelo nome do servidor público ou por processo de licitação',
      decoration: const BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 1.0),
        shape: BoxShape.rectangle,
      ),
      verticalOffset: -130,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      margin: const EdgeInsets.only(left: 200),
      child: IconButton(
        onPressed: () {
          tooltipkey.currentState?.ensureTooltipVisible();
        },
        icon: const Icon(
          Icons.info,
          color: Color.fromRGBO(30, 48, 80, 1.0),
        ),
        iconSize: 40,
      ),
    );
  }
}
