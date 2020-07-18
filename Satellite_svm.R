install.packages('caret')
install.packages('e1071')
install.packages('mlbench')
install.packages('randomForest')
install.packages("kernlab")
library('mlbench')
library('caret')
library('kernlab')
library('randomForest')

data("Satellite")
temp_data <- Satellite
datas = temp_data[c('x.17', 'x.18', 'x.19', 'x.20', 'classes')]
datas

set.seed(42)

index <- createDataPartition(datas$classes, p = 0.80, list = FALSE)
x_train = datas[index,]
x_test = datas[-index,]

rf <- train(classes~., data = x_train, method = 'rf')
svm <- train(classes~., data = x_train, method = 'svmRadial')
rna <- train(classes~., data = x_train, method = 'nnet')

predict.rf <- predict(rf, x_test)
predict.svm <- predict(svm, x_test)
predict.rna <- predict(rna, x_test)

table(x_test$classes)
# red soil         cotton crop           grey soil      damp grey soil  vegetation stubble very damp grey soil
# 306                 140                 271                 125                 141             301

confusionMatrix(predict.rf, x_test$classes)  # accuracy 0.8349
# Confusion Matrix and Statistics
# 
# Reference
# Prediction            red soil cotton crop grey soil damp grey soil vegetation stubble
# red soil                 297           1         5              1                  8
# cotton crop                0         123         0              0                  4
# grey soil                  4           0       240             23                  0
# damp grey soil             0           1        23             58                  0
# vegetation stubble         5          10         0              1                113
# very damp grey soil        0           5         3             42                 16
# Reference
# Prediction            very damp grey soil
# red soil                              0
# cotton crop                           1
# grey soil                             9
# damp grey soil                       43
# vegetation stubble                    7
# very damp grey soil                 241
# 
# Overall Statistics
# 
# Accuracy : 0.8349          
# 95% CI : (0.8134, 0.8548)
# No Information Rate : 0.2383          
# P-Value [Acc > NIR] : < 2.2e-16       
# 
# Kappa : 0.7958          
# 
# Mcnemar's Test P-Value : NA              
# 
# Statistics by Class:
# 
#                      Class: red soil Class: cotton crop Class: grey soil Class: damp grey soil
# Sensitivity                   0.9706            0.87857           0.8856               0.46400
# Specificity                   0.9847            0.99563           0.9645               0.94219
# Pos Pred Value                0.9519            0.96094           0.8696               0.46400
# Neg Pred Value                0.9907            0.98529           0.9692               0.94219
# Prevalence                    0.2383            0.10903           0.2111               0.09735
# Detection Rate                0.2313            0.09579           0.1869               0.04517
# Detection Prevalence          0.2430            0.09969           0.2150               0.09735
# Balanced Accuracy             0.9776            0.93710           0.9250               0.70310
#                      Class: vegetation stubble Class: very damp grey soil
# Sensitivity                            0.80142                     0.8007
# Specificity                            0.97988                     0.9329
# Pos Pred Value                         0.83088                     0.7850
# Neg Pred Value                         0.97561                     0.9386
# Prevalence                             0.10981                     0.2344
# Detection Rate                         0.08801                     0.1877
# Detection Prevalence                   0.10592                     0.2391
# Balanced Accuracy                      0.89065                     0.8668

confusionMatrix(predict.svm, x_test$classes) # accuracy 0.8567
# Confusion Matrix and Statistics
# 
# Reference
# Prediction            red soil cotton crop grey soil damp grey soil vegetation stubble
# red soil                 300           1         2              2                  8
# cotton crop                0         118         0              0                  2
# grey soil                  3           0       260             26                  0
# damp grey soil             0           1         8             62                  1
# vegetation stubble         3          16         0              1                111
# very damp grey soil        0           4         1             34                 19
# Reference
# Prediction            very damp grey soil
# red soil                              0
# cotton crop                           0
# grey soil                            11
# damp grey soil                       38
# vegetation stubble                    3
# very damp grey soil                 249
# 
# Overall Statistics
# 
# Accuracy : 0.8567          
# 95% CI : (0.8363, 0.8754)
# No Information Rate : 0.2383          
# P-Value [Acc > NIR] : < 2.2e-16       
# 
# Kappa : 0.8223          
# 
# Mcnemar's Test P-Value : NA              
# 
# Statistics by Class:
# 
#                      Class: red soil Class: cotton crop Class: grey soil Class: damp grey soil
# Sensitivity                   0.9804            0.84286           0.9594               0.49600
# Specificity                   0.9867            0.99825           0.9605               0.95858
# Pos Pred Value                0.9585            0.98333           0.8667               0.56364
# Neg Pred Value                0.9938            0.98110           0.9888               0.94634
# Prevalence                    0.2383            0.10903           0.2111               0.09735
# Detection Rate                0.2336            0.09190           0.2025               0.04829
# Detection Prevalence          0.2438            0.09346           0.2336               0.08567
# Balanced Accuracy             0.9835            0.92055           0.9600               0.72729
#                      Class: vegetation stubble Class: very damp grey soil
# Sensitivity                            0.78723                     0.8272
# Specificity                            0.97988                     0.9410
# Pos Pred Value                         0.82836                     0.8111
# Neg Pred Value                         0.97391                     0.9468
# Prevalence                             0.10981                     0.2344
# Detection Rate                         0.08645                     0.1939
# Detection Prevalence                   0.10436                     0.2391
# Balanced Accuracy                      0.88356                     0.8841

confusionMatrix(predict.rna, x_test$classes) # accuracy 0.7064
# Confusion Matrix and Statistics
# 
# Reference
# Prediction            red soil cotton crop grey soil damp grey soil vegetation stubble
# red soil                 276           2         0              1                 39
# cotton crop                0         116         0              0                  2
# grey soil                  1           0       253             60                  1
# damp grey soil             0           0         0              0                  0
# vegetation stubble        10           5         0              0                 32
# very damp grey soil       19          17        18             64                 67
# Reference
# Prediction            very damp grey soil
# red soil                              2
# cotton crop                           0
# grey soil                            55
# damp grey soil                        0
# vegetation stubble                   14
# very damp grey soil                 230
# 
# Overall Statistics
# 
# Accuracy : 0.7064          
# 95% CI : (0.6806, 0.7312)
# No Information Rate : 0.2383          
# P-Value [Acc > NIR] : < 2.2e-16       
# 
# Kappa : 0.6278          
# 
# Mcnemar's Test P-Value : NA              
# 
# Statistics by Class:
# 
#                      Class: red soil Class: cotton crop Class: grey soil Class: damp grey soil
# Sensitivity                   0.9020            0.82857           0.9336               0.00000
# Specificity                   0.9550            0.99825           0.8845               1.00000
# Pos Pred Value                0.8625            0.98305           0.6838                   NaN
# Neg Pred Value                0.9689            0.97942           0.9803               0.90265
# Prevalence                    0.2383            0.10903           0.2111               0.09735
# Detection Rate                0.2150            0.09034           0.1970               0.00000
# Detection Prevalence          0.2492            0.09190           0.2882               0.00000
# Balanced Accuracy             0.9285            0.91341           0.9090               0.50000
#                      Class: vegetation stubble Class: very damp grey soil
# Sensitivity                            0.22695                     0.7641
# Specificity                            0.97463                     0.8118
# Pos Pred Value                         0.52459                     0.5542
# Neg Pred Value                         0.91087                     0.9183
# Prevalence                             0.10981                     0.2344
# Detection Rate                         0.02492                     0.1791
# Detection Prevalence                   0.04751                     0.3232
# Balanced Accuracy                      0.60079                     0.7880

# Better accuracy: 0.8567 -- SVM
print(svm)

# Support Vector Machines with Radial Basis Function Kernel 
# 
# 5151 samples
# 4 predictor
# 6 classes: 'red soil', 'cotton crop', 'grey soil', 'damp grey soil', 'vegetation stubble', 'very damp grey soil' 
# 
# No pre-processing
# Resampling: Bootstrapped (25 reps) 
# Summary of sample sizes: 5151, 5151, 5151, 5151, 5151, 5151, ... 
# Resampling results across tuning parameters:
#   
#   C     Accuracy   Kappa    
# 0.25  0.8545930  0.8195944
# 0.50  0.8568325  0.8224287
# 1.00  0.8585973  0.8246842
# 
# Tuning parameter 'sigma' was held constant at a value of 0.8159919
# Accuracy was used to select the optimal model using the largest value.
# The final values used for the model were sigma = 0.8159919 and C = 1.

final_model <- ksvm(type = 'C-svc', classes~., data = datas, kernel = 'rbfdot', C = 1.0, kpar = list(sigma = 0.8159919))
final_predict.svm <- predict(final_model, datas)
confusionMatrix(final_predict.svm, datas$classes)

# Confusion Matrix and Statistics
# 
# Reference
# Prediction            red soil cotton crop grey soil damp grey soil vegetation stubble
# red soil                1499           2        10              6                 48
# cotton crop                2         636         0              1                  9
# grey soil                 19           0      1303            159                  3
# damp grey soil             0           6        40            310                  4
# vegetation stubble        12          49         0              4                571
# very damp grey soil        1          10         5            146                 72
# Reference
# Prediction            very damp grey soil
# red soil                              0
# cotton crop                           2
# grey soil                            48
# damp grey soil                      169
# vegetation stubble                   29
# very damp grey soil                1260
# 
# Overall Statistics
# 
# Accuracy : 0.867           
# 95% CI : (0.8584, 0.8752)
# No Information Rate : 0.2382          
# P-Value [Acc > NIR] : < 2.2e-16       
# 
# Kappa : 0.8352          
# 
# Mcnemar's Test P-Value : NA              
# 
# Statistics by Class:
# 
#                      Class: red soil Class: cotton crop Class: grey soil Class: damp grey soil
# Sensitivity                   0.9778            0.90469           0.9595               0.49521
# Specificity                   0.9865            0.99756           0.9549               0.96230
# Pos Pred Value                0.9578            0.97846           0.8505               0.58601
# Neg Pred Value                0.9930            0.98842           0.9888               0.94650
# Prevalence                    0.2382            0.10925           0.2110               0.09728
# Detection Rate                0.2329            0.09883           0.2025               0.04817
# Detection Prevalence          0.2432            0.10101           0.2381               0.08221
# Balanced Accuracy             0.9822            0.95113           0.9572               0.72875
#                      Class: vegetation stubble Class: very damp grey soil
# Sensitivity                            0.80764                     0.8355
# Specificity                            0.98359                     0.9525
# Pos Pred Value                         0.85865                     0.8434
# Neg Pred Value                         0.97643                     0.9498
# Prevalence                             0.10987                     0.2343
# Detection Rate                         0.08873                     0.1958
# Detection Prevalence                   0.10334                     0.2322
# Balanced Accuracy                      0.89561                     0.8940

## save
saveRDS(final_model, 'satellite_svm.rds')

# Para realizar as classificações foi utilizada a base de dados Satellite.
# Optou-se por utilizar apenas os pixeis centrais da base para evitar o problema de uma vizinha 3x3 atravessar 
# o limite. Essa base foi distribuida em proporção 80/20 por cada classe para dados de treino e teste.
# Foram realizadas três classificações iniciais utilizando diferentes classificadores, que resultam
# no seguinte:
# - Random Forest: 0.8349 de acuracia
# - Support Vector Machines: 0.8567 de acuracia
# - Neural Network: 0.7064 de acuracia
# Com relação a acuracia, o algoritmo que mostrou o melhor resultado foi o Support Vector.
# Como o SVM mostrou melhor resultado para acuracia, foi realizado um treino com o 
# mesmo, utilizando toda a base de dados e os valores de sigma (0.8159919) e C (1) iguais ao
# modelo criado anteriormente.
# Aplicando este modelo para toda a base foi obtido uma acuracia de 0.867, trazendo um pequeno 
# aumento em relação ao anterior com 80% da base de dados.
