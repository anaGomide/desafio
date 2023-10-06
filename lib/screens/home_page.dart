import 'package:desafio/screens/widgets/about.dart';
import 'package:desafio/screens/widgets/card.dart';
import 'package:flutter/material.dart';

enum AuthMode { signup, login }

class UserProfilePage extends StatefulWidget {
  static const routeName = '/home-page';

  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showEditButton = true;
  List<Edificio> edificios = [
    Edificio(
      nome: 'Edifício A',
      usuario: '@teste',
      subtitulo: 'Prédio principal',
    ),
    Edificio(
      nome: 'Edifício B',
      usuario: '@Usuario',
      subtitulo: 'Edifício secundário',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        // Atualize a visibilidade do botão com base na aba ativa
        showEditButton =
            _tabController.index == 0; // Apenas na aba "Atividades"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.blue, // Cor do banner
              child: Stack(
                children: <Widget>[
                  // Imagem do banner
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/banner.png', // Caminho para a imagem no pubspec.yaml
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: const Offset(
                          0, 45), // Alinha o meio com o final do banner
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment
                              .end, // Alinha na parte inferior
                          children: [
                            Container(
                              width: 90, // O dobro do raio do CircleAvatar
                              height: 90, // O dobro do raio do CircleAvatar
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    45), // Metade da largura/altura
                                border: Border.all(
                                  color: Colors.white, // Cor da borda branca
                                  width: 4, // Largura da borda
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    43), // Metade da largura/altura - 2px da borda
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: showEditButton,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
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
                                child: const Text(
                                  'Editar Perfil',
                                  style: TextStyle(
                                    color: Color(0xFF202020),
                                    fontSize: 20,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    height: 0.07,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Nome de usuário com o ícone de verificação
                  Row(
                    children: <Widget>[
                      Text(
                        'Cidade ADM de MG',
                        style: TextStyle(
                          fontSize: 22.60,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1C1E),
                        ),
                      ),
                      Icon(
                        Icons.verified,
                        color: Colors.orange,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Subtítulo
                  Text(
                    'Perfil Oficial da Cidade Administrativa de MG',
                    style: TextStyle(
                      fontSize: 15.59,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Ícone de localização
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Color(0xFF909094),
                        size: 16,
                      ),
                      Text(
                        'Cidade Administrativa',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF909094),
                        ),
                      ),
                      SizedBox(width: 16), // Espaço entre os dois
                      Icon(
                        Icons.calendar_today,
                        color: Color(0xFF909094),
                        size: 16,
                      ),
                      Text(
                        'Entrou em jan/23',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF909094),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Abas de navegação
            DefaultTabController(
              length: 3,
              child: Column(
                children: <Widget>[
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    tabs: const <Widget>[
                      Tab(text: 'Atividades'),
                      Tab(text: 'Sobre'),
                      Tab(text: 'Avisos e Comunicados'),
                    ],
                  ),
                  Container(
                    height: 400, // Altura do conteúdo da aba
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        // Conteúdo da aba 'Atividades'
                        SingleChildScrollView(
                            child: Column(
                          children: [
                            ActivityCard(
                              title: 'Cidade ADM de MG',
                              subtitle: '@cidadeadm',
                              data: '12 dias',
                              content:
                                  'Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.',
                              messageCount: '0',
                            ),
                            ActivityCard(
                              title: 'Cidade ADM de MG',
                              subtitle: '@cidadeadm',
                              data: '12 dias',
                              content:
                                  'Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.',
                              messageCount: '0',
                            ),
                            ActivityCard(
                              title: 'Cidade ADM de MG',
                              subtitle: '@cidadeadm',
                              data: '10 Mai',
                              content:
                                  'Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.',
                              messageCount: '0',
                            ),
                          ],
                        )),

                        // Conteúdo da aba 'Sobre'
                        ListView(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: AboutSection(
                                onEditPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/edit_about_page');
                                },
                                edificios: edificios,
                                enderecoEmail: 'exemplo@gmail.com',
                                horarioAtendimento: 'segunda das 9h as 8h',
                                localizacao: 'cnb 10',
                                numeroWhatsApp: '(61)99999-9999',
                                // Passe os valores relevantes para a página "Sobre" aqui
                              ),
                            ),
                          ],
                        ),
                        // Conteúdo da aba 'Avisos e Comunicados'
                        const Center(
                          child: Text('Conteúdo da aba "Avisos e Comunicados"'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
