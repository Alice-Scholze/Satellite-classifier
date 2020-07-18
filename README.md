# Pesquisa com dados de satélite

## Descrição
O banco de dados consiste nos valores multi-espectrais de pixels em vizinhanças 3x3 em uma imagem de satélite, e na classificação associada ao pixel central em cada vizinhança. O objetivo é prever esta classificação, dados os valores multi-espectrais. <br>
Um quadro de imagens do Satélite Landsat com MSS (Multispectral Scanner System) consiste em quatro imagens digitais da mesma cena em diferentes bandas espectrais. Duas delas estão na região visível (correspondendo aproximadamente às regiões verde e vermelha do espectro visível) e duas no infravermelho (próximo). Cada pixel é uma palavra binária de 8 bits, com 0 correspondendo a preto e 255 a branco. A resolução espacial de um pixel é de cerca de 80m x 80m. Cada imagem contém 2340 x 3380 desses pixels. O banco de dados é uma subárea (minúscula) de uma cena, consistindo de 82 x 100 pixels. Cada linha de dados corresponde a uma vizinhança quadrada de pixels 3x3 completamente contida dentro da subárea 82x100. Cada linha contém os valores de pixel nas quatro bandas espectrais (convertidas em ASCII) de cada um dos 9 pixels na vizinhança de 3x3 e um número indicando o rótulo de classificação do pixel central. <br>
As classes são: solo vermelho, colheita de algodão, solo cinza, solo cinza úmido, restolho de vegetação, solo cinza muito úmido. <br>
Os dados estão em ordem aleatória e certas linhas de dados foram removidas, portanto você não pode reconstruir a imagem original desse conjunto de dados. Em cada linha de dados, os quatro valores espectrais para o pixel superior esquerdo são dados primeiro, seguidos pelos quatro valores espectrais para o pixel superior central e, em seguida, para o pixel superior direito, e assim por diante, com os pixels lidos em sequência, da esquerda para a direita e de cima para baixo. Assim, os quatro valores espectrais para o pixel central são dados pelos atributos 17, 18, 19 e 20. Se você quiser, pode usar apenas esses quatro atributos, ignorando os outros. Isso evita o problema que surge quando uma vizinhança 3x3 atravessa um limite. <br>
O banco de dados se encontra no pacote mlbench e é completo (não possui dados faltantes). <br><br>
Tarefas: <br>
- Treine modelos RandomForest, SVM e RNA para predição destes dados.
- Escolha o melhor modelo com base em suas matrizes de confusão.
- Treine o modelo final com todos os dados e faça a predição na base completa.
- Analise o resultado.
- Salve este modelo final

## Resultados obtidos
Haviam duas possibilidades de caminho para seguir:
- [utilizar apenas os pixeis principais (atributos 17, 18, 19, e 20)](Satellite_svm.R)
- [treinar os modelos com todas as colunas](Satellite_rf.R)
Para averiguar os resultados de ambas as formas, foi realizado o treinamento das duas formas.

### Treinamento utilizando os pixeis principais
Para realizar as classificações foi utilizada a base de dados Satellite.
Optou-se por utilizar apenas os pixeis centrais da base para evitar o problema de uma vizinha 3x3 atravessar 
o limite. Essa base foi distribuida em proporção 80/20 por cada classe para dados de treino e teste.
Foram realizadas três classificações iniciais utilizando diferentes classificadores, que resultam
no seguinte:
- Random Forest: 0.8349 de acuracia
- Support Vector Machines: 0.8567 de acuracia
- Neural Network: 0.7064 de acuracia
<br>
Com relação a acuracia, o algoritmo que mostrou o melhor resultado foi o Support Vector.
Como o SVM mostrou melhor resultado para acuracia, foi realizado um treino com o 
mesmo, utilizando toda a base de dados e os valores de sigma (0.8159919) e C (1) iguais ao
modelo criado anteriormente.
Aplicando este modelo para toda a base foi obtido uma acuracia de 0.867, trazendo um pequeno 
aumento em relação ao anterior com 80% da base de dados.

### Treinamento utilizando todos os dados
Para realizar as classificações foi utilizada a base de dados Satellite. Essa base foi 
distribuida em proporção 80/20 por cada classe para dados de treino e teste.
Foram realizadas três classificações iniciais utilizando diferentes classificadores, que resultam
no seguinte:
- Random Forest: 0.912 de acuracia
- Support Vector Machines: 0.9081 de acuracia
- Neural Network: 0.6121 de acuracia
<br>
Com relação a acuracia, o algoritmo que mostrou o melhor resultado foi o Random Forest.
Como o Random Forest mostrou melhor resultado para acuracia, foi realizado um treino com o 
mesmo, utilizando toda a base de dados e o valor de mtry do modelo anteriormente treinado.
Aplicando este modelo para toda a base foi obtido uma acuracia de 100%, o que mostra que o modelo esta
possivelmente overfitado.
