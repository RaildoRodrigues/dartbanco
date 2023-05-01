import 'package:dartbanco/conta.dart';
import 'dart:io';

List<Conta> contas = [];

void main() {
  menuBanco();
}

menuBanco() {
  while (true) {
    print('-------------------------------------------');
    print('Bem vindo ao Banco Teste, o que deseja fazer?');
    print(
        'Digite o numero da conta ou C: Criar Conta, L: Listar contas, S: Sair');
    var opcao = stdin.readLineSync() as String;
    switch (opcao.toUpperCase()) {
      case 'C':
        stdout.write('Digite o nome do cliente: ');
        var novoCliente = stdin.readLineSync();
        criarConta(novoCliente as String);
        print('Conta criada com sucesso');
        listarContas();
        break;
      case 'L':
        listarContas();
        break;
      case 'S':
        print("saindo...");
        return;
      default:
        try {
          int conta = int.parse(opcao);
          menuConta(contas[conta]);
        } catch (e) {
          print('digite uma opcao valida');
        }

        break;
    }
  }
}

menuConta(Conta conta) {
  while (true) {
    print('-------------------------------------------');
    print('Você esta acessando a conta ${conta.cliente} o que seseha fazer?');
    stdout.write('S: sacar, D: Depositar, E: Extrato, V: Voltar => ');
    String opcao = stdin.readLineSync() as String;
    switch (opcao.toUpperCase()) {
      case 'S':
        stdout.write('Digite o valor do saque: ');
        var valor = stdin.readLineSync() as String;
        try {
          double valorSaque = double.parse(valor);
          conta.sacar(valorSaque);
        } catch (e) {
          print('valor invalido');
        }
        break;
      case 'D':
        stdout.write('Digite o valor do deposito: ');
        var valor = stdin.readLineSync() as String;
        try {
          double valorDeposito = double.parse(valor);
          conta.depositar(valorDeposito);
        } catch (e) {
          print('valor invalido');
        }
        break;
      case 'E':
        conta.verExtrato();
        break;
      case 'V':
        return;
      default:
        print('Opcao invalida');
        break;
    }
  }
}

void criarConta(String nomeCliente) {
  Conta novaConta = Conta(nomeCliente);
  contas.add(novaConta);
  print('Nova conta criada');
  print(novaConta);
}

void listarContas() {
  print('-------------------------------------------');
  for (var conta in contas) {
    print(conta);
  }
}
