import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController filmeController = TextEditingController();
  String filme = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse('0xFF00C17F')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text(
                'Cadastre seu Projeto:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 50,
                    child: Text(
                      'Titulo:',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                      width: 300,
                      height: 50,
                      child: TextField(
                        controller: filmeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          disabledBorder: OutlineInputBorder(),
                        ),
                        textAlignVertical: TextAlignVertical.top,
                      )
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            filmeController.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1), // Deixa o botão quadrado
                          ),
                          backgroundColor: Colors.blue, // Cor de fundo azul
                        ),
                        child: const Text(
                          'Limpar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            filme = filmeController.text;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1), // Deixa o botão quadrado
                          ),
                          backgroundColor: Colors.blue, // Cor de fundo azul
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Text(
                filme,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16
                ),
              ),
              const Image(
                image: AssetImage('assets/images/projeto.png'),
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}