algoritmo "SistemaMercado"
var
   nomes: vetor [1..50] de caractere
   precos: vetor [1..50] de real
   quantidades: vetor [1..50] de inteiro
   nome: caractere
   preco: real
   quantidade, totalprodutos, opcao: inteiro

procedimento mostramenu()
inicio
   limpatela
   escreval ("=========================================== ")
   escreval ("             SUPERMERCADO TOPE              ")
   escreval ("=========================================== ")
   escreval ("1 - CADASTRAR ")
   escreval ("2 - LISTAR ")
   escreval ("3 - BUSCAR ")
   escreval ("4 - ALTERAR QUANTIDADE ")
   escreval ("5 - MAIS CARO ")
   escreval ("6 - VALOR DO ESTOQUE ")
   escreval ("7 - VALOR DO ESTOQUE DO PRODUTO X ")
   escreval ("8 - SAIR ")
   escreval ("=========================================== ")
fimprocedimento

procedimento cadastrar()
var
   r: caractere
   i: inteiro
   tem: logico

inicio
   repita
      tem <- falso

      se (totalprodutos >= 50) entao
         escreval ("LIMITE DE PRODUTOS ATINGIDO! ")
      senao
         totalprodutos <- totalprodutos + 1
         limpatela
         escreval ("=========================================== ")
         escreval ("             SUPERMERCADO TOPE              ")
         escreval ("            CADASTRO DE PRODUTOS            ")
         escreval ("=========================================== ")
         escreva ("NOME DO PRODUTO: ")
         leia (nome)

         repita
            tem <- falso

            para i <- 1 ate totalprodutos - 1 faca
               se (nomes[i] = nome) entao
                  tem <- verdadeiro
               fimse
            fimpara

            se (tem = verdadeiro) entao
               escreval("Produto já cadastrado!")
               leia(nome)
            fimse
         ate (tem = falso)

         nomes[totalprodutos] <- nome

         escreva ("PREÇO DO PRODUTO: ")
         leia (preco)

         precos[totalprodutos] <- preco

         escreva ("QUANTIDADE DO PRODUTO: ")
         leia (quantidade)

         quantidades[totalprodutos] <- quantidade

         escreval ()
         escreval ()

         escreval ("Deseja cadastrar mais um produto? [S/N]")
         leia (r)
         r <- maiusc(r)

         enquanto (r <> "S") e (r <> "N") faca
            escreval ("Resposta inválida! Deseja cadastrar mais um produto? [S/N] ")
            leia (r)
            r <- maiusc(r)
         fimenquanto

      ate (r = "N")
   fimse
fimprocedimento

procedimento listar()
var
   i: inteiro
   vazio: caractere

inicio
   limpatela
   escreval ("=========================================== ")
   escreval ("             SUPERMERCADO TOPE              ")
   escreval ("                 LISTAGEM                   ")
   escreval ("=========================================== ")

   para i <- 1 ate totalprodutos faca
      escreval ("PRODUTO", i, ": ")
      escreval ("NOME: ", nomes[i])
      escreval ("PREÇO: ", precos[i]:4:2)
      escreval ("QUANTIDADE:", quantidades[i])
      escreval ()
   fimpara

   escreval ()

   escreval ("Para voltar ao menu pressione ENTER... ")
   leia (vazio)
fimprocedimento

procedimento buscar()
var
   i: inteiro
   nomebusca: caractere
   resp: caractere
   tem: logico

inicio
   repita
      tem <- falso
      limpatela
      escreval ("=========================================== ")
      escreval ("             SUPERMERCADO TOPE              ")
      escreval ("                  BUSCA                     ")
      escreval ("=========================================== ")
      escreval ("         ESCREVA O NOME DO PRODUTO          ")
      leia (nomebusca)
      escreval ()

      para i <- 1 ate totalprodutos faca
         se (nomes[i] = nomebusca) entao
            tem <- verdadeiro
            escreval ("NOME: ", nomes[i])
            escreval ("PREÇO: ", precos[i]:4:2)
            escreval ("QUANTIDADE:", quantidades[i])
            escreval ()
         fimse
      fimpara

      se (tem = falso) entao
         escreval ("Nenhum produto foi encontrado. ")
      fimse

      escreval ()
      escreval ()
      escreval ("Você deseja fazer mais uma busca? [S/N] ")
      leia (resp)
      resp <- maiusc(resp)

      enquanto (resp <> "S") e (resp <> "N") faca
         escreval ("Resposta Inválida! Digite novamente: [S/N] ")
         leia (resp)
         resp <- maiusc(resp)
      fimenquanto
   ate (resp = "N")
fimprocedimento

procedimento alterarquantidade()
var
   i, q: inteiro
   nomebusca, re, respo: caractere
   tem: logico

inicio
   repita
      tem <- falso
      limpatela
      escreval ("=========================================== ")
      escreval ("             SUPERMERCADO TOPE              ")
      escreval ("             ALTERAR QUANTIDADE             ")
      escreval ("=========================================== ")
      escreval ("         ESCREVA O NOME DO PRODUTO          ")
      leia (nomebusca)
      escreval ()

      para i <- 1 ate totalprodutos faca
         se (nomes[i] = nomebusca) entao
            tem <- verdadeiro
            escreval ()

            escreval ("NOME: ", nomes[i])
            escreval ("PREÇO: ", precos[i]:4:2)
            escreval ("QUANTIDADE:", quantidades[i])
            escreval ()

            se (tem = verdadeiro) entao
               escreval ("Esse é o produto que você quer mudar a quantidade? [S/N]")
               leia (re)
               re <- maiusc(re)
            fimse

            enquanto (re <> "N") e (re <> "S") faca
               escreval ("Resposta Inválida! Digite novamente: [S/N] ")
               leia (re)
            fimenquanto

            se (re = "S") entao
               escreval ("Qual a nova quantidade do produto? ")
               leia (q)
               quantidades[i] <- q
               escreval ()
               escreval ("QUANTIDADE ALTERADA COM SUCESSO! ")
            fimse
         fimse
      fimpara

      se (tem = falso) entao
         escreval ("Nenhum produto foi encontrado. ")
      fimse

      escreval ()
      escreval ()
      escreval ("Você deseja alterar a quantidade de mais um produto? [S/N]")
      leia (respo)
      respo <- maiusc(respo)

      enquanto (respo <> "S") e (respo <> "N") faca
         escreval ("Resposta Inválida! Digite novamente: [S/N] ")
         leia (respo)
         respo <- maiusc(respo)
      fimenquanto
   ate (respo = "N")
fimprocedimento

procedimento maiscaro()
var
   i, posi: inteiro
   mscaro: real
   vazio: caractere

inicio
   se (totalprodutos = 0) entao
      escreval ("Nenhum produto foi cadastrado. ")
   senao
      mscaro <- precos[1]
      posi <- 1

      para i <- 2 ate totalprodutos faca
         se (precos[i] > mscaro) entao
            mscaro <- precos[i]
            posi <- i
         fimse
      fimpara

      limpatela
      escreval ("=========================================== ")
      escreval ("             SUPERMERCADO TOPE              ")
      escreval ("             PRODUTO MAIS CARO              ")
      escreval ("=========================================== ")
      escreval ("O PRODUTO MAIS CARO CUSTA R$ ", mscaro:4:2)
      escreval ("O PRODUTO MAIS CARO É ", nomes[posi])
      escreval ()

      escreval ("Pressione ENTER para voltar ao menu... ")
      leia (vazio)
   fimse
fimprocedimento

procedimento precoestoque()
var
   i: inteiro
   total: real
   vazio: caractere
inicio
   total <- 0

   para i <- 1 ate totalprodutos faca
      total <- total + (precos[i] * quantidades[i])
   fimpara

   limpatela
   escreval ("=========================================== ")
   escreval ("             SUPERMERCADO TOPE              ")
   escreval ("              VALOR DO ESTOQUE              ")
   escreval ("=========================================== ")
   escreval ("O VALOR TOTAL DO ESTOQUE Ë R$ ", total:4:2)
   escreval ()

   escreval ("Pressione ENTER para voltar ao menu... ")
   leia (vazio)
fimprocedimento

procedimento precoestoqueum()
var
   i: inteiro
   nomebusca, r: caractere
   tem: logico
   totalx: real

inicio
   repita
      tem <- falso
      totalx <- 0
      limpatela
      escreval ("=========================================== ")
      escreval ("             SUPERMERCADO TOPE              ")
      escreval ("         VALOR DO ESTOQUE PRODUTO X         ")
      escreval ("=========================================== ")
      escreva ("Digite o nome do produto: ")
      leia (nomebusca)
      escreval ()
      para i <- 1 ate totalprodutos faca
         se (nomes[i] = nomebusca) entao
            tem <- verdadeiro
            totalx <- totalx + (precos[i] * quantidades[i])
            escreval ("NOME: ", nomes[i])
            escreval ("PREÇO: ", precos[i]:4:2)
            escreval ("QUANTIDADE:", quantidades[i])
            escreval ("PREÇO DO ESTOQUE: ", totalx:4:2)
         fimse
      fimpara

      se (tem = falso) entao
         escreval ("Nenhum produto foi encontrado. ")
      fimse

      escreval ()
      escreval ("Você deseja ver o valor do estoque de outro produto? [S/N] ")
      leia (r)
      r <- maiusc(r)
      enquanto (r <> "N") e (r <> "S") faca
         escreval ("Resposta Inválida! Digite novamente: [S/N] ")
         leia (r)
         r <- maiusc(r)
      fimenquanto
   ate (r = "N")
fimprocedimento

procedimento saida()
inicio
   limpatela
   escreval ("=========================================== ")
   escreval ("             SUPERMERCADO TOPE              ")
   escreval ("=========================================== ")
   escreval ()
   escreval ("O MELHOR MERCADO ")
   escreval ()
   escreval ("Saindo... ")
fimprocedimento

inicio
   totalprodutos <- 0

   enquanto (opcao <> 8) faca
      mostramenu()
      leia (opcao)

      enquanto (opcao < 1) ou (opcao > 8) faca
         escreval ("Opção Inválida! Digite novamente: [1 a 8] ")
         leia (opcao)
      fimenquanto

      escolha (opcao)

      caso 1
         cadastrar()
      caso 2
         listar()
      caso 3
         buscar()
      caso 4
         alterarquantidade()
      caso 5
         maiscaro()
      caso 6
         precoestoque()
      caso 7
         precoestoqueum()
      caso 8
         saida()
      fimescolha
   fimenquanto
fimalgoritmo