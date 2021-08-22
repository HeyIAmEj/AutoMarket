Algoritmo "AUTOMARKET"

Var
   //AUTOMARKET

   senhaEstoque : caractere
   carrinho: vetor [1..20, 1..3] de caractere
   quantidadeProdutos : inteiro
   produtos: vetor [1..20, 1..4] de caractere
   nome, sobrenome, cpf, email, dataNascimento, senhaConta : caractere
   saldo : real
Inicio
saldo <- 250.00
   quantidadeProdutos <- 20
   senhaEstoque <- "senha123"

   nome <- "Pedro"
   sobrenome <- "Silva"
   cpf <- "111.000.222-33"
   email <- "pedrosilva123@gmail.com"
   dataNascimento <- "09/08/1997"
   senhaConta <- "pedro123"

   produtos[1,1] <- "Arroz"
   produtos[1,2] <- "0"
   produtos[1,3] <- "3.45"
   produtos[1,4] <- "20"
   produtos[2,1] <- "Feijão"
   produtos[2,2] <- "1"
   produtos[2,3] <- "6.09"
   produtos[2,4] <- "30"
   produtos[3,1] <- "Óleo"
   produtos[3,2] <- "8"
   produtos[3,3] <- "4.99"
   produtos[3,4] <- "20"
   produtos[4,1] <- "Biscoito"
   produtos[4,2] <- "20"
   produtos[4,3] <- "1.50"
   produtos[4,4] <- "30"
   produtos[5,1] <- "Detergente"
   produtos[5,2] <- "4"
   produtos[5,3] <- "8.50"
   produtos[5,4] <- "15"
   produtos[6,1] <- "Sabao em po"
   produtos[6,2] <- "7"
   produtos[6,3] <- "7.50"
   produtos[6,4] <- "15"
   produtos[7,1] <- "Pasta de dente"
   produtos[7,2] <- "25"
   produtos[7,3] <- "10.99"
   produtos[7,4] <- "30"
   produtos[8,1] <- "Macarrao"
   produtos[8,2] <- "15"
   produtos[8,3] <- "3.20"
   produtos[8,4] <- "20"
   produtos[9,1] <- "Coca-Cola 2L"
   produtos[9,2] <- "16"
   produtos[9,3] <- "9.00"
   produtos[9,4] <- "20"
   produtos[10,1] <- "Fanta"
   produtos[10,2] <- "12"
   produtos[10,3] <- "7.50"
   produtos[10,4] <- "15"


   //Procedimento Exibir Menu Principal
procedimento exibirMenuPrincipal
var
   opcao : caractere
   senha : caractere
   busca : caractere
inicio
   enquanto (opcao <> "0") faca
      escreval("-----------------------------")
      escreval("Menu Principal")
      escreval("1- Inicio")
      escreval("2- Buscar")
      escreval("3- Produtos")
      escreval("4- Carrinho")
      escreval("5- Conta")
      escreval("6- Estoque")
      escreval("0- Sair")
      escreval("-----------------------------")
      escreval()
      escreva("Digite o número da opção desejada: ")
      leia(opcao)
      opcao <- minusc(opcao)
      escolha opcao
      caso "1"
         escreval("Opcao Inicio foi escolhida")
      caso "2"
         escreval("Opcao Buscar foi escolhida")
         escreva("Digite o nome do produto: ")
         leia(busca)
         verProdutos("buscar", busca)
         exibirMenuComprar("buscar", busca)
      caso "3"
         escreval("Opcao Produtos foi escolhida")
         verProdutos("todos", "")
         exibirMenuComprar("todos", "")
      caso "4"
         escreval("Opcao Carrinho foi escolhida")
         exibirMenuCarrinho
      caso "5"
         escreval("Opcao Conta foi escolhida")
         exibirMenuConta
      caso "6"
         escreval("Opcao Estoque foi escolhida")
         escreval("Para acessar o estoque digite a senha de administrador!")
         escreva("Senha: ")
         leia(senha)
         se (senha = senhaEstoque) entao
            escreval("Senha correta!")
            exibirMenuEstoque
         senao
            escreval("Senha inválida, tente novamente.")
         fimse
      caso "0"
         escreval("Opcao Sair foi escolhida")
      outrocaso
         escreval("Opção Inválida!")
      fimescolha
   fimenquanto
fimprocedimento

procedimento exibirOpcoesPagamento(total : real)
var
   opcao : caractere
   contador : inteiro
inicio

   escreval("Opções de Pagamento")
   escreval()
   escreval("1- Saldo (R$", saldo, ")")
   escreval("2- Cartão Master com final 5318.")
   escreval("3- Cartão Visa com final 7344.")
   escreval("4- Voltar")
   escreval()
   escreva("Opção: ")
   leia(opcao)

   escolha opcao
   caso "1"
      se (saldo >= total) entao
         saldo <- saldo - total
         para contador de 1 ate quantidadeProdutos faca
            carrinho[contador,1] <- ""
            carrinho[contador,2] <- ""
            carrinho[contador,3] <- ""
         fimpara
         escreval("Compra Efetuada com Sucesso!")
         escreval("Obrigado!")
         escreval()
      senao
         escreval("Você não tem saldo suficiente! Faça uma recarga!")
      fimse
   caso "2"
      escreval("Compra Negada!")
   caso "3"
      escreval("Compra Aprovada!")
      para contador de 1 ate quantidadeProdutos faca
         carrinho[contador,1] <- ""
         carrinho[contador,2] <- ""
         carrinho[contador,3] <- ""
      fimpara
      escreval("Compra Efetuada com Sucesso!")
      escreval("Obrigado!")
      escreval()
   caso "4"
      escreval("Operação Cancelada!")
   outrocaso
      escreval("Opção Inválida!")
      escreval()
   fimescolha


fimprocedimento

procedimento exibirMenuCarrinho
var
   contador : inteiro
   total : real
   opcao2 : caractere
   quantidadeCarrinhoVazio : inteiro
inicio
   enquanto (opcao2 <> "0") faca
      total <- 0
      quantidadeCarrinhoVazio <- 0
      escreval("-----------------------------")
      escreval("Menu Carrinho")
      escreval("Produto   -   Valor")
      escreval()
      para contador de 1 ate quantidadeProdutos faca
         se (carrinho[contador, 1] <> "") entao
            //TEM ALGUM PRODUTO
            escreval(carrinho[contador, 1], " - ", carrinho[contador, 3])
            total <- total + caracpnum(carrinho[contador, 3])
         senao
            //NAO TEM PRODUTO
            quantidadeCarrinhoVazio <- quantidadeCarrinhoVazio + 1
         fimse
      fimpara
      se (quantidadeCarrinhoVazio = quantidadeProdutos) entao
         escreval("Sem itens no carrinho. Vá comprar produtos.")
         opcao2 <- "0"
      senao
         escreval()
         escreval("Total: ", total)
         escreval("-----------------------------")
         escreval()
         escreval("1- Remover item")
         escreval("2- Finalizar compras")
         escreval("0- Voltar")
         escreval()
         escreva("Opção: ")
         leia(opcao2)
         escolha opcao2
         caso "1"
            //removerItem
            removerItem
            escreval()
         caso "2"
            //finalizarCompra
            exibirOpcoesPagamento(total)
         caso "0"
            //voltar
         outrocaso
            escreval("Opção Inválida, tente novamente.")
         fimescolha
      fimse

   fimenquanto
fimprocedimento
//PROCEDIMENTO PERFIL
procedimento menuPerfil
var
   opcao : caractere
   opcao2: caractere
inicio
   escreval("1- Ver Perfil")
   escreval("2- Alterar Perfil")
   escreval("0- Voltar")
   escreva("Opção: ")
   leia(opcao)
   escolha opcao
   caso "1"
      escreval()
      escreval("Nome: ", nome)
      escreval("Sobrenome: ", sobrenome)
      escreval("Data de Nascimento: ", dataNascimento)
      escreval("CPF: ", cpf)
      escreval("Email: ", email)
      escreval("Senha: ", senhaConta)
      escreval()
   caso "2"
      escreval("Alterar dados de Perfil")
      escreval()
      escreval("1- Nome")
      escreval("2- Sobrenome")
      escreval("3- Data de Nascimento")
      escreval("4- CPF")
      escreval("5- Email")
      escreval("6- Senha")
      escreva("Opção: ")
      leia(opcao2)

      escolha opcao2
      caso "1"
         escreva("Digite o novo nome: ")
         leia(nome)
         escreval("Alterado com sucesso!")
      caso "2"
         escreva("Digite o novo Sobrenome: ")
         leia(sobrenome)
         escreval("Alterado com sucesso!")
      caso "3"
         escreva("Digite a nova Data de Nascimento: ")
         leia(dataNascimento)
         escreval("Alterado com sucesso!")
      caso "4"
         escreva("Digite o novo CPF: ")
         leia(cpf)
         escreval("Alterado com sucesso!")
      caso "5"
         escreva("Digite o novo Email: ")
         leia(email)
         escreval("Alterado com sucesso!")
      caso "6"
         escreva("Digite a nova senha: ")
         leia(senhaConta)
         escreval("Alterado com sucesso!")
      outrocaso
         escreval("Opção Inválida.")
      fimescolha
   caso "0"
      //volta
   outrocaso
      escreval("Opção Inválida. Tente novamente.")
   fimescolha
fimprocedimento

//PROCEDIMENTO EXIBIR MENU PAGAMENTOS

procedimento menuPagamentos
var
   opcao : caractere
   numcartao, cvv , vencimento : inteiro
   opcao2 : caractere
inicio
   escreval("1- Ver Saldo")
   escreval("2- Adicionar Saldo")
   escreval("3- Ver Cartões Cadastrados")
   escreval("4- Adicionar novo Cartão")
   escreval("5- Remover Cartão Cadastrado")
   escreval("0- Voltar")
   escreva("Opção: ")
   leia(opcao)
   escolha opcao
   caso "1"
      //ver saldo
      escreval("Saldo: R$", saldo:1:2)
      escreval()
   caso "2"
      //adicionar saldo, simulação add saldo na loja
      escreval("Para adicionar saldo vá até a loja e solicite a um funcionário.")
      escreval()
   caso "3"
      //ver cartoes
      escreval("Cartões Cadastrados: ")
      escreval()
      escreval("Cartão Master com final **** **** **** 5318.")
      escreval("Cartão Visa com final **** **** **** 7344.")
      escreval()
   caso "4"
      //adicionar cartao
      escreva("Para adicionar cartões Visa,Master,Hiper digite o número do cartão: ")
      leia(numcartao)
      escreva("Digite o vencimento(MM/AAAA): ")
      leia(vencimento)
      escreva("Digite o CVV que fica atrás do seu cartão:")
      leia(cvv)
      escreval("Cartão adicionado com sucesso! Agora você já pode realizar suas compras!")
      escreval()
   caso "5"
      //remover cartao
      escreval("Deseja remover o cartão Master com final **** **** **** 5318?")
      escreval("1- Sim")
      escreval("2- Não")
      escreva("Opção: ")
      leia(opcao2)
      se (opcao2 = "1") entao
         escreval("Cartão Removido com Sucesso.")
      senao
         se (opcao2 = "2") entao
            escreval("Operação Cancelada.")
         senao
            escreval("Opção Inválida!")
         fimse
      fimse
   caso "0"
      //volta
   outrocaso
      escreval("Opção Inválida. Tente novamente.")
   fimescolha
fimprocedimento


//PROCEDIMENTO EXIBIR MENU CONTA
procedimento exibirMenuConta
var
   opcao : caractere
inicio
   enquanto (opcao <> "0") faca
      escreval("-----------------------------")
      escreval("Menu Conta")
      escreval("Olá, ",nome, " ", sobrenome,"!")
      escreval()
      escreval("1- Perfil")
      escreval("2- Pagamentos")
      escreval("0- Voltar")
      escreval()
      escreva("Opção: ")
      leia(opcao)

      escolha opcao
      caso "1"
         //perfil
         menuPerfil
      caso "2"
         //pagamentos
         menuPagamentos
      caso "0"
         //volta
      outrocaso
         escreval("Opção Inválida. Tente novamente.")
      fimescolha
   fimenquanto
fimprocedimento

//PROCEDIMENTO REMOVER ITEM DO CARRINHO

procedimento removerItem
var
   opcao : caractere
   opcao2 : caractere
   contador : inteiro
   existeProduto : logico
inicio
   escreva("Digite o nome do produto para remover: ")
   leia(opcao)
   para contador de 1 ate quantidadeProdutos faca
      se (carrinho[contador, 1] = opcao) entao
         // NOME DO PRODUTO EXISTE NO CARRINHO E PODE REMOVER
         existeProduto <- verdadeiro
         interrompa
      senao
         existeProduto <- falso
      fimse
   fimpara
   se (existeProduto = falso) entao
      escreval("Produto não está no carrinho.")
   senao
      escreval()
      escreval("Remover item:")
      escreval(carrinho[contador, 1], " - ", carrinho[contador, 3])
      escreval()
      escreval("1- Sim")
      escreval("2- Não")
      escreva("Opcão: ")
      leia(opcao2)

      escolha opcao2
      caso "1"
         escreval("Operação Confirmada.")
         carrinho[contador, 1] <- ""
         carrinho[contador, 2] <- ""
         carrinho[contador, 3] <- ""
         escreval("Removido com sucesso!")
         escreval()
      caso "2"
         escreval("Operação Cancelada.")
      outrocaso
         escreval("Opção Inválida, tente novamente.")
      fimescolha
   fimse
fimprocedimento

procedimento adicionarCarrinho(contadorProduto : inteiro)
var
   posicaoProduto: inteiro
   contador : inteiro
inicio
   posicaoProduto <- contadorProduto

   para contador de 1 ate quantidadeProdutos faca
      se (carrinho[contador, 1] = "") entao
         //VAZIO E PODE ADICIONAR NESSA POSICAO DO CONTADOR
         interrompa
      senao
         //EM USO, E NAO PODE ADICONAR

      fimse
   fimpara

   //ADICIONA NO CARRINHO
   carrinho[contador, 1] <- produtos[posicaoProduto, 1]
   carrinho[contador, 2] <- "1"
   carrinho[contador, 3] <- produtos[posicaoProduto, 3]

   produtos[posicaoProduto, 2] <- numpcarac(caracpnum(produtos[posicaoProduto, 2]) - 1)
   escreval("Adicionado com sucesso!")
   escreval()
fimprocedimento

procedimento exibirMenuComprar(raiz, nomeProduto : caractere)
var
   opcao : inteiro
   opcao2: caractere
   contador : inteiro
inicio
   se (raiz = "todos") entao
      escreva("Digite o código do produto para comprar: ")
      leia(opcao)
   senao
      para contador de 1 ate quantidadeProdutos faca
         se (produtos[contador, 1] = nomeProduto) entao
            opcao <- contador
            interrompa
         fimse
      fimpara
   fimse
   escreval()
   se (produtos[opcao, 2] = "0") entao
      escreval("O produto está fora de estoque!")
   senao
      escreval("Deseja comprar: ")
      escreval(produtos[opcao, 1], " - ", produtos[opcao,3])
      escreval()
      escreval("1- Sim")
      escreval("2- Não")
      escreva("Opção: ")
      leia(opcao2)

      escolha opcao2
      caso "1"
         escreval("Operação Confirmada.")
         adicionarCarrinho(opcao)
         escreval()
      caso "2"
         escreval("Operação Cancelada.")
      outrocaso
         escreval("Opção Inválida, tente novamente.")
      fimescolha
   fimse
fimprocedimento

procedimento verificarSituacao
var
   contador : inteiro
   quantidadeProdutoAtual : inteiro
   percentual : real
inicio
   para contador de 1 ate quantidadeProdutos faca
      se (produtos[contador, 1] <> "") entao
         percentual <- (caracpnum(produtos[contador, 2])/caracpnum(produtos[contador, 4]))*100
         se (percentual = 0) entao
            escreval("[URGENTE] O produto ", maiusc(produtos[contador, 1]), " está em FALTA. (", percentual:1:0,"%)")
         senao
            se (percentual > 0) e (percentual <= 15) entao
               escreval("[URGENTE] O produto ", maiusc(produtos[contador, 1]), " está entrando EM URGÊNCIA. (", percentual:1:0,"%)")
            senao
               se (percentual > 15) e (percentual <= 35) entao
                  escreval("[ATENÇÃO] O produto ", maiusc(produtos[contador, 1]), " precisa REABASTECER. (", percentual:1:0,"%)")
               senao
                  se (percentual > 35) e (percentual <= 50) entao
                     escreval("[ATENÇÃO] O produto ", maiusc(produtos[contador, 1]), " pode REABASTECER. (", percentual:1:0,"%)")
                  fimse
               fimse
            fimse
         fimse
      fimse
   fimpara
fimprocedimento

procedimento reporProdutos
var
   opcao : caractere
   contador : inteiro
   diferenca : inteiro
   precoTotal1 : real
   precoTotal2 : real
   percentual : real
inicio
   escreval()
   escreval("-----------------------------")
   escreval("MENU DE COMPRAS DO ESTOQUE")
   escreval("-----------------------------")
   escreval("1- Verificar Estoques em ATENÇÃO")
   escreval("2- Solicitar Orçamento de produtos em ATENÇÃO")
   escreval("3- Realizar Reestoque de produtos em ATENÇÃO")
   escreval("0- Voltar")
   escreval()
   escreva("Opção: ")
   leia(opcao)
   escolha opcao
   caso "1"
      verificarSituacao
      reporProdutos
   caso "2"
      escreval("Um email foi enviado para os fornecedores solicitando valores atuais dos produtos.")
      escreval("Aguarde o retorno de cada fornecedor em breve.")
      reporProdutos
   caso "3"
      escreval("NOME | QUANTIDADE ATUAL | QUANTIDADE ADICIONAL | PREÇO UNITÁRIO | PREÇO TOTAL")
      escreval()
      para contador de 1 ate quantidadeProdutos faca
         se (produtos[contador, 1] <> "") entao
            diferenca <- caracpnum(produtos[contador, 4]) - caracpnum(produtos[contador, 2])
            precoTotal1 <- (caracpnum(produtos[contador, 3]) * diferenca)
            percentual <- (caracpnum(produtos[contador, 2])/caracpnum(produtos[contador, 4]))*100
            se (percentual = 0) entao
               produtos[contador, 2] <- produtos[contador, 4]
            senao
               se (percentual > 0) e (percentual <= 15) entao
                  produtos[contador, 2] <- produtos[contador, 4]
               senao
                  se (percentual > 15) e (percentual <= 35) entao
                     produtos[contador, 2] <- produtos[contador, 4]
                  senao
                     se (percentual > 35) e (percentual <= 50) entao
                        produtos[contador, 2] <- produtos[contador, 4]
                     fimse
                  fimse
               fimse
            fimse
            precoTotal2 <- precoTotal2 + precoTotal1
         fimse
      fimpara
      //escreval("Preço Total: ", precoTotal2)
      //escreval()
   caso "0"
      //voltar
      escreval()
   outrocaso
      escreval("Opção Inválida! Tente novamente!")
   fimescolha
fimprocedimento

procedimento exibirMenuEstoque
var
   opcao : caractere
inicio
   enquanto (opcao <> "0") faca
      escreval("-----------------------------")
      escreval("PRODUTOS EM ATENÇÃO DE ESTOQUE")
      escreval("-----------------------------")
      verificarSituacao
      escreval("-----------------------------")
      escreval("Menu Estoque")
      escreval("1- Adicionar Produto")
      escreval("2- Ver Produto")
      escreval("3- Alterar Produto")
      escreval("4- Remover Produto")
      escreval("5- Reestoque de Produto")
      escreval("0- Voltar para o Menu Principal")
      escreval("-----------------------------")
      escreval()
      escreva("Digite o número da opção desejada: ")
      leia(opcao)
      opcao <- minusc(opcao)
      escolha opcao
      caso "1"
         //ADICIONAR PRODUTO
         adicionarProduto
      caso "2"
         //VER OU BUSCAR PRODUTOS
         exibirMenuVerProdutos
      caso "3"
         alterarProduto
      caso "4"
         removerProduto
      caso "5"
         reporProdutos
      caso "0"
         escreval("Opção Voltar foi escolhida")
      outrocaso
         escreval("Opção Inválida!")
      fimescolha
   fimenquanto
fimprocedimento

//PROCEDIMENTO ADICIONAR PRODUTO AO BANCO DE DADOS
procedimento adicionarProduto
var
   nome : caractere
   quantidade : caractere
   valor : caractere
   contador : inteiro
   posicaoSemProdutos : inteiro
   opcao2 : caractere
   existeNoBD : logico
inicio
   escreva("Digite o nome do produto para ser adicionado: ")
   leia(nome)
   escreva("Digite a quantidade de ",nome," para ser adicionado: ")
   leia(quantidade)
   escreva("Digite o valor de ",nome," para ser adicionado: ")
   leia(valor)

   para contador de 1 ate quantidadeProdutos faca
      se (produtos[contador, 1] = nome) entao
         escreval("O produto já está cadastrado no BD.")
         existeNoBD <- verdadeiro
         interrompa
      senao
         existeNoBD <- falso
         se (produtos[contador, 1] = "") entao
            posicaoSemProdutos <- contador
            interrompa
         fimse
      fimse
   fimpara

   se (existeNoBD = falso) entao
      escreval("Você irá adicionar: ")
      escreval(quantidade, "x de ", nome, " por R$", valor, " cada.")
      escreval("1- Sim")
      escreval("2- Não")
      escreva("Opção desejada: ")
      leia(opcao2)
      escolha opcao2
      caso "1"
         escreval("Operação confirmada.")
         produtos[posicaoSemProdutos, 1] <- nome
         produtos[posicaoSemProdutos, 2] <- quantidade
         produtos[posicaoSemProdutos, 3] <- valor
         escreval(quantidade, "x de ", nome, " por R$", valor, " adicionado com sucesso.")
         escreval()
      caso "2"
         escreval("Operação cancelada.")
         escreval()
      outrocaso
         escreval("Opção inválida, tente novamente.")
         escreval()
      fimescolha
   fimse
fimprocedimento

//PROCEDIMENTO VER PRODUTO DO BANCO DE DADOS
procedimento exibirMenuVerProdutos
var
   opcao : caractere
   nomeParaBuscar : caractere
inicio
   enquanto (opcao <> "0") faca
      escreval("-----------------------------")
      escreval("Menu Produtos")
      escreval("1- Buscar produto")
      escreval("2- Ver todos os produtos")
      escreval("0- Voltar")
      escreval("-----------------------------")
      escreval()
      escreva("Digite o número da opção desejada: ")
      leia(opcao)
      opcao <- minusc(opcao)
      escolha opcao
      caso "1"
         escreval("Opção Buscar Produto selecionada.")
         escreva("Digite o nome do Produto: ")
         leia(nomeParaBuscar)
         verProdutos("buscar", nomeParaBuscar)
      caso "2"
         escreval("Opção Ver Todos selecionada.")
         verProdutos("todos", "")
      caso "0"
         escreval("Opção Voltar selecionada.")
      outrocaso
         escreval("Opção Inválida.")
      fimescolha
   fimenquanto
fimprocedimento


//PROCEDIMENTO VER PRODUTO DO BANCO DE DADOS
procedimento verProdutos(tipoVer, nomeProduto : caractere)
var
   opcao : caractere
   contador : inteiro
   posicaoEncontrada : inteiro
inicio
   se (tipoVer = "buscar") entao
      //buscar um
      contador <- 0
      se (nomeProduto = "") entao
         escreval("Erro interno. Procedimento sem argumento necessário.")
      senao
         para contador de 1 ate quantidadeProdutos faca
            se (produtos[contador, 1] = nomeProduto) entao
               posicaoEncontrada <- contador
               interrompa
            fimse
         fimpara

         escreval("Produto encontrado!")
         escreval()
         escreval(contador, ") ", produtos[contador, 1]," - ", produtos[contador, 2], " - R$",produtos[contador, 3])
         escreval()
      fimse
   senao
      //ver todos
      contador <- 0
      para contador de 1 ate quantidadeProdutos faca
         se (produtos[contador, 1] <> "") entao
            se (produtos[contador, 2] = "0") entao
               escreval(contador, ") ", produtos[contador, 1]," - ", produtos[contador, 2], " - R$",produtos[contador, 3], " - PRODUTO ESGOTADO!")
            senao
               escreval(contador, ") ", produtos[contador, 1]," - ", produtos[contador, 2], " - R$",produtos[contador, 3])
            fimse
         senao
            interrompa
         fimse
      fimpara
   fimse
fimprocedimento


//PROCEDIMENTO ALTERAR PRODUTO DO BANCO DE DADOS
procedimento alterarProduto
var
   opcao : caractere
   nomeProduto : caractere
   contador : inteiro
   posicaoEncontrada : inteiro
   novoNomeProduto, novoQuantidadeProduto, novoValorProduto : caractere
   opcao2 : caractere
inicio
   escreva("Digite o nome do produto: ")
   leia(nomeProduto)

   para contador de 1 ate quantidadeProdutos faca
      se (produtos[contador, 1] = nomeProduto) entao
         posicaoEncontrada <- contador
         interrompa
      fimse
   fimpara

   se (posicaoEncontrada = 0) entao
      //nao foi encontrado
      escreval("Produto não encontrado. Tente novamente.")
      escreval()
   senao
      //foi encontrado
      escreva("Digite o novo nome: ")
      leia(novoNomeProduto)
      escreva("Digite a nova quantidade de ",novoNomeProduto, ": ")
      leia(novoQuantidadeProduto)
      escreva("Digite o novo valor de ",novoNomeProduto, ": ")
      leia(novoValorProduto)

      escreval("Alterações: ")
      escreval()
      escreval("Antigo Nome: ", produtos[posicaoEncontrada, 1])
      escreval("Novo Nome: ", novoNomeProduto)
      escreval("Antiga Quantidade: ", produtos[posicaoEncontrada, 2])
      escreval("Nova Quantidade: ", novoQuantidadeProduto)
      escreval("Antigo Valor: ", produtos[posicaoEncontrada, 3])
      escreval("Novo Valor: ", novoValorProduto)
      escreval()
      escreval("Confirmar alterações:")
      escreval("1- Sim")
      escreval("2- Não")
      escreva("Opção: ")
      leia(opcao2)

      escolha opcao2
      caso "1"
         escreval("Operação Confirmada.")
         produtos[posicaoEncontrada, 1] <- novoNomeProduto
         produtos[posicaoEncontrada, 2] <- novoQuantidadeProduto
         produtos[posicaoEncontrada, 3] <- novoValorProduto
         escreval("Alterado com sucesso!")
         escreval()
      caso "2"
         escreval("Operação Cancelada.")
      outrocaso
         escreval("Opção Inválida, tente novamente.")
      fimescolha
   fimse
fimprocedimento

//PROCEDIMENTO REMOVER PRODUTO DO BANCO DE DADOS
procedimento removerProduto
var
   opcao : caractere
   nomeProduto : caractere
   contador : inteiro
   posicaoEncontrada : inteiro
   opcao2 : caractere
inicio
   escreva("Digite o nome do produto: ")
   leia(nomeProduto)

   para contador de 1 ate quantidadeProdutos faca
      se (produtos[contador, 1] = nomeProduto) entao
         posicaoEncontrada <- contador
         interrompa
      fimse
   fimpara

   se (posicaoEncontrada = 0) entao
      //nao foi encontrado
      escreval("Produto não encontrado. Tente novamente.")
      escreval()
   senao
      //foi encontrado
      escreval("Remover: ")
      escreval()
      escreval("Produto: ", produtos[posicaoEncontrada, 1])
      escreval()
      escreval("Atenção, os dados do ", produtos[posicaoEncontrada, 1]," serão apagados.")
      escreval("Confirmar remoção:")
      escreval("1- Sim")
      escreval("2- Não")
      escreva("Opção: ")
      leia(opcao2)

      escolha opcao2
      caso "1"
         escreval("Operação Confirmada.")
         produtos[posicaoEncontrada, 2] <- "0"
         escreval("Removido com sucesso!")
         escreval()
      caso "2"
         escreval("Operação Cancelada.")
      outrocaso
         escreval("Opção Inválida, tente novamente.")
      fimescolha
   fimse
fimprocedimento


exibirMenuPrincipal

Fimalgoritmo