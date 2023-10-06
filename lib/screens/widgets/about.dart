import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final String horarioAtendimento;
  final List<Edificio> edificios;
  final String localizacao;
  final String numeroWhatsApp;
  final String enderecoEmail;

  final VoidCallback onEditPressed;

  AboutSection({
    required this.horarioAtendimento,
    required this.edificios,
    required this.localizacao,
    required this.numeroWhatsApp,
    required this.enderecoEmail,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: onEditPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF4E97FE)),
              borderRadius: BorderRadius.circular(48),
            ),
          ),
          child: const Text(
            "Editar seção sobre",
            style: TextStyle(
              color: Color(0xFF202020),
              fontSize: 20,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              height: 0.07,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Horário de Atendimento",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(horarioAtendimento),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edifícios",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              for (var edificio in edificios)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        // backgroundImage:
                        //     AssetImage("assets/images/${edificio.nome}.png"),
                        radius: 20,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                edificio.nome,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.verified,
                                color: Colors.purple,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                edificio.usuario,
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            edificio.subtitulo,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Localização",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.purple,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(localizacao),
                ],
              ),
              const SizedBox(height: 16),
              // Aqui você pode adicionar um mapa ou outra informação de localização
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Contato",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.purple,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(numeroWhatsApp),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                    color: Colors.purple,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(enderecoEmail),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Edificio {
  final String nome;
  final String usuario;
  final String subtitulo;

  Edificio({
    required this.nome,
    required this.usuario,
    required this.subtitulo,
  });
}
