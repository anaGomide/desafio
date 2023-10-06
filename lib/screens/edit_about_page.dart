import 'package:flutter/material.dart';

class EditAboutPage extends StatefulWidget {
  static const routeName = '/edit_about_page';

  const EditAboutPage({super.key});
  @override
  EditAboutPageState createState() => EditAboutPageState();
}

class EditAboutPageState extends State<EditAboutPage> {
  List<String> daysOfWeek = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
    'Domingo',
  ];

  List<String> selectedOpeningHours = List.filled(7, '09:00');
  List<String> selectedClosingHours = List.filled(7, '18:00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar sobre"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Horário de Atendimento",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: daysOfWeek.length,
              itemBuilder: (context, index) {
                final day = daysOfWeek[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFC7C6CA)),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Center(
                            child: Text(
                              day,
                              style: const TextStyle(
                                fontSize: 16, // Tamanho da fonte personalizado
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                child: DropdownButtonFormField<String>(
                                  icon: Icon(Icons.expand_more),
                                  isExpanded: true,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(4),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC7C6CA),
                                      ),
                                    ),
                                  ),
                                  value: selectedOpeningHours[index],
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedOpeningHours[index] = newValue!;
                                    });
                                  },
                                  items: _buildDropdownItems(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Visibility(
                              visible: selectedOpeningHours[index] != 'Fechado',
                              child: const Text(
                                  "às"), // Adicione a palavra "às" aqui
                            ),
                            Visibility(
                              visible: selectedOpeningHours[index] != 'Fechado',
                              child: const SizedBox(width: 10),
                            ),
                            Expanded(
                              child: _buildClosingHoursDropdown(index),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Edifícios",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Adicionar ação para adicionar edifício aqui
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFF4E97FE)),
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                    child: Text(
                      "Adicionar",
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        height: 0.07,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.check, color: Colors.white),
              ),
              title: Text("Nome do Edifício"),
              subtitle: Text("Subtítulo do Edifício"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Adicionar ação para editar nome do edifício aqui
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    final List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i <= 23; i++) {
      final hour = i.toString().padLeft(2, '0');
      items.add(DropdownMenuItem(
        value: '$hour:00',
        child: Text('$hour:00'),
      ));
    }
    items.add(DropdownMenuItem(
      value: 'Fechado',
      child: Text('Fechado'),
    ));
    return items;
  }

  Widget _buildClosingHoursDropdown(int index) {
    if (selectedOpeningHours[index] == 'Fechado') {
      // Se a abertura estiver definida como 'Fechado', retorne um widget vazio.
      return SizedBox();
    } else {
      return Container(
        height: 40,
        child: DropdownButtonFormField<String>(
          icon: Icon(Icons.expand_more),
          isExpanded: true,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(4),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFC7C6CA),
              ),
            ),
          ),
          value: selectedClosingHours[index],
          onChanged: (newValue) {
            setState(() {
              selectedClosingHours[index] = newValue!;
            });
          },
          items: _buildDropdownItems(),
        ),
      );
    }
  }
}
