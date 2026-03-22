import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _ProdutoName = "";
  double _ProdutoQuantidade = 20.0;
  String? _Entrega = "";
  String _Regiao = "Norte";
  bool _Termos = false;
  String _result = "";

  void _exibirDados() {
    setState(() {
      _result = "O produto selecionado foi: $_ProdutoName, mais a quantidade de produtos escolhido foi $_ProdutoQuantidade.O pedido será entregue via $_Entrega. Já a região de entrega sera $_Regiao.O cliente aceita o envio de promoções: $_Termos";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Preencha com o nome do Produto:"),
               TextField(
                decoration: const InputDecoration(
                  labelText: 'Digite o nome',
                
                ),
                onChanged: (valor){
                  setState(() {
                    _ProdutoName = valor;
                  });
                },

               ),

               Text(
                'Defina a quantidade $_ProdutoQuantidade'
               ),
            
               Slider(value: _ProdutoQuantidade, 
                    min: 0,
                    max: 100,
                    
                    onChanged: (valor) {
                      setState(() {
                        _ProdutoQuantidade = valor;
                      });
                    }
               ),


              Text("Escolha o tipo de entrega:"),


              Column(

                children: [
                  RadioListTile<String>(
                    title: Text("Carreto"),
                    value: 'Carreto',
                    groupValue: _Entrega,
                    onChanged: (val) => setState(() => _Entrega = val),
                  ),

                

                  RadioListTile<String>(
                    title: Text("Retirada"),
                    value: 'Retirada',
                    groupValue: _Entrega,
                    onChanged: (val) => setState(() => _Entrega = val),
                  ),
                
              
              
              RadioListTile<String>(
                    title: Text("Correio"),
                    value: 'Correio',
                    groupValue: _Entrega,
                    onChanged: ( val) => setState(() => _Entrega = val),
                  ),
               
              
               ]
              ),
              Text("Escolha a região:"),

               DropdownButton<String>(
                value: _Regiao,
                onChanged: (String? newValue) {
                  setState(() => _Regiao = newValue!);
                },
                items: <String>['Norte', 'Nordeste', 'Centro-Oeste', 'Sudeste', 'Sul']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                       })
                    .toList(),
              ),
       
            Text("Deseja receber promoções via e-mail?"),

          
          
              CheckboxListTile(
                title: Text("Sim, eu desejo receber promoções via e-mail", style: TextStyle(fontSize: 12), textAlign: TextAlign.center,),
                
                value: _Termos,
                onChanged: (bool? value) {
                  setState(() => _Termos = value!);
                  },

              ),


                  
            
             
           ElevatedButton(
                onPressed: _exibirDados, 
                child: const Text('Cadastrar')
              ),

              Text(
                _result
              )
             
                   ],
          ),
      ),
    );
     
  }
}
