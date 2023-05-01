class Conta {
  static int _numeroDeContas = 0;
  final String cliente;
  int numeroDaConta = 0;
  double _saldo = 0;
  List<String> extrato = [];


  Conta(this.cliente){
    _numeroDeContas++;
    numeroDaConta = _numeroDeContas;
    _saldo = 0;
  }

  String toReal(double value){
    return 'R\$ ${value.toStringAsFixed(2)}';
  }

  void verSaldo(){
    print('Seu saldo é de ${toReal(_saldo)} reais');
  }

  void depositar(double valor){
    _saldo += valor;
    print('Voce depositou ${toReal(valor)} na sua conta');
    adicionarLinhaExtrato('D + $valor -> $_saldo');
    verSaldo();
  }

  void sacar(double valor){
    if(valor > _saldo){
      print('Você nao tem saldo suficiente para sacar ${toReal(valor)} reais');
    }
    else{
      _saldo -= valor;
      print('Você sacou ${toReal(valor)}');
      adicionarLinhaExtrato('S - $valor -> $_saldo');
    }
    verSaldo();
  }

  void adicionarLinhaExtrato(String linha){
    extrato.add(linha.padLeft(20, '#'));
  }

  void verExtrato(){
    print('##################################');
    for(String linha in extrato){
      print(linha);
    }
  }

  @override
  String toString(){
    String numeroDaContaFormatado = numeroDaConta.toString().padLeft(4,'0');
    return 'Conta Nº $numeroDaContaFormatado do Cliente: $cliente';
  }
  
}
