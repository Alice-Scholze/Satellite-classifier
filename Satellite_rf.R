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

set.seed(42)

index <- createDataPartition(temp_data$classes, p = 0.80, list = FALSE)
x_train = temp_data[index,]
x_test = temp_data[-index,]

rf <- train(classes~., data = x_train, method = 'rf')
svm <- train(classes~., data = x_train, method = 'svmRadial')
rna <- train(classes~., data = x_train, method = 'nnet')

predict.rf <- predict(rf, x_test)
predict.svm <- predict(svm, x_test)
predict.rna <- predict(rna, x_test)

table(x_test$classes)
# red soil         cotton crop           grey soil      damp grey soil  vegetation stubble very damp grey soil
# 306                 140                 271                 125                 141             301

confusionMatrix(predict.rf, x_test$classes)  # accuracy 0.912
# Random Forest
# Confusion Matrix and Statistics
# 
# Reference
# Prediction            red soil cotton crop grey soil damp grey soil vegetation stubble
# red soil                 301           0         0              2                  8
# cotton crop                1         133         0              1                  0
# grey soil                  3           1       264             14                  0
# damp grey soil             0           1         4             77                  0
# vegetation stubble         1           2         0              1                118
# very damp grey soil        0           3         3             30                 15
# Reference
# Prediction            very damp grey soil
# red soil                              0
# cotton crop                           0
# grey soil                             4
# damp grey soil                       15
# vegetation stubble                    4
# very damp grey soil                 278
# 
# Overall Statistics
# 
# Accuracy : 0.912           
# 95% CI : (0.8951, 0.9269)
# No Information Rate : 0.2383          
# P-Value [Acc > NIR] : < 2.2e-16       
# 
# Kappa : 0.8908          
# 
# Mcnemar's Test P-Value : NA              
# 
# Statistics by Class:
# 
#                      Class: red soil Class: cotton crop Class: grey soil Class: damp grey soil
# Sensitivity                   0.9837             0.9500           0.9742               0.61600
# Specificity                   0.9898             0.9983           0.9783               0.98274
# Pos Pred Value                0.9678             0.9852           0.9231               0.79381
# Neg Pred Value                0.9949             0.9939           0.9930               0.95956
# Prevalence                    0.2383             0.1090           0.2111               0.09735
# Detection Rate                0.2344             0.1036           0.2056               0.05997
# Detection Prevalence          0.2422             0.1051           0.2227               0.07555
# Balanced Accuracy             0.9867             0.9741           0.9762               0.79937
#                      Class: vegetation stubble Class: very damp grey soil
# Sensitivity                            0.83688                     0.9236
# Specificity                            0.99300                     0.9481
# Pos Pred Value                         0.93651                     0.8450
# Neg Pred Value                         0.98014                     0.9759
# Prevalence                             0.10981                     0.2344
# Detection Rate                         0.09190                     0.2165
# Detection Prevalence                   0.09813                     0.2562
# Balanced Accuracy                      0.91494                     0.9359

confusionMatrix(predict.svm, x_test$classes) # accuracy 0.9081
# Support Vector Machines
# Confusion Matrix and Statistics
# 
# Reference
# Prediction            red soil cotton crop grey soil damp grey soil vegetation stubble
# red soil                 301           0         0              1                  3
# cotton crop                2         134         1              3                  0
# grey soil                  3           1       267             19                  0
# damp grey soil             0           1         0             77                  0
# vegetation stubble         0           2         0              2                123
# very damp grey soil        0           2         3             23                 15
# Reference
# Prediction            very damp grey soil
# red soil                              0
# cotton crop                           0
# grey soil                             7
# damp grey soil                       22
# vegetation stubble                    8
# very damp grey soil                 264
# 
# Overall Statistics
# 
# Accuracy : 0.9081         
# 95% CI : (0.891, 0.9233)
# No Information Rate : 0.2383         
# P-Value [Acc > NIR] : < 2.2e-16      
# 
# Kappa : 0.8862         
# 
# Mcnemar's Test P-Value : NA             
# 
# Statistics by Class:
# 
#                      Class: red soil Class: cotton crop Class: grey soil Class: damp grey soil
# Sensitivity                   0.9837             0.9571           0.9852               0.61600
# Specificity                   0.9959             0.9948           0.9704               0.98016
# Pos Pred Value                0.9869             0.9571           0.8990               0.77000
# Neg Pred Value                0.9949             0.9948           0.9959               0.95946
# Prevalence                    0.2383             0.1090           0.2111               0.09735
# Detection Rate                0.2344             0.1044           0.2079               0.05997
# Detection Prevalence          0.2375             0.1090           0.2313               0.07788
# Balanced Accuracy             0.9898             0.9759           0.9778               0.79808
#                      Class: vegetation stubble Class: very damp grey soil
# Sensitivity                            0.87234                     0.8771
# Specificity                            0.98950                     0.9563
# Pos Pred Value                         0.91111                     0.8599
# Neg Pred Value                         0.98433                     0.9621
# Prevalence                             0.10981                     0.2344
# Detection Rate                         0.09579                     0.2056
# Detection Prevalence                   0.10514                     0.2391
# Balanced Accuracy                      0.93092                     0.9167

confusionMatrix(predict.rna, x_test$classes) # accuracy 0.6121
# Neural Network
# Confusion Matrix and Statistics
# 
# Reference
# Prediction            red soil cotton crop grey soil damp grey soil vegetation stubble
# red soil                 298           0         5              1                  7
# cotton crop                7         130         1              0                 40
# grey soil                  1           0       264            108                  8
# damp grey soil             0           0         0              0                  0
# vegetation stubble         0          10         1             14                 86
# very damp grey soil        0           0         0              2                  0
# Reference
# Prediction            very damp grey soil
# red soil                              0
# cotton crop                           0
# grey soil                           253
# damp grey soil                        0
# vegetation stubble                   40
# very damp grey soil                   8
# 
# Overall Statistics
# 
# Accuracy : 0.6121          
# 95% CI : (0.5849, 0.6389)
# No Information Rate : 0.2383          
# P-Value [Acc > NIR] : < 2.2e-16       
# 
# Kappa : 0.5201          
# 
# Mcnemar's Test P-Value : NA              
# 
# Statistics by Class:
# 
#                      Class: red soil Class: cotton crop Class: grey soil Class: damp grey soil
# Sensitivity                   0.9739             0.9286           0.9742               0.00000
# Specificity                   0.9867             0.9580           0.6347               1.00000
# Pos Pred Value                0.9582             0.7303           0.4164                   NaN
# Neg Pred Value                0.9918             0.9910           0.9892               0.90265
# Prevalence                    0.2383             0.1090           0.2111               0.09735
# Detection Rate                0.2321             0.1012           0.2056               0.00000
# Detection Prevalence          0.2422             0.1386           0.4938               0.00000
# Balanced Accuracy             0.9803             0.9433           0.8045               0.50000
#                      Class: vegetation stubble Class: very damp grey soil
# Sensitivity                            0.60993                   0.026578
# Specificity                            0.94313                   0.997965
# Pos Pred Value                         0.56954                   0.800000
# Neg Pred Value                         0.95146                   0.770016
# Prevalence                             0.10981                   0.234424
# Detection Rate                         0.06698                   0.006231
# Detection Prevalence                   0.11760                   0.007788
# Balanced Accuracy                      0.77653                   0.512272

# Better accuracy: 0.912 -- Random Forest
print(rf)

# Random Forest 
# 
# 5151 samples
# 36 predictor
# 6 classes: 'red soil', 'cotton crop', 'grey soil', 'damp grey soil', 'vegetation stubble', 'very damp grey soil' 
# 
# No pre-processing
# Resampling: Bootstrapped (25 reps) 
# Summary of sample sizes: 5151, 5151, 5151, 5151, 5151, 5151, ... 
# Resampling results across tuning parameters:
#   
#   mtry  Accuracy   Kappa    
# 2    0.9070347  0.8846635
# 19    0.9055030  0.8828484
# 36    0.8965951  0.8718391
# 
# Accuracy was used to select the optimal model using the largest value.
# The final value used for the model was mtry = 2.

final <- randomForest(classes~., data = temp_data, type = classification, mtry = 2)
final_predict.rf <- predict(final, temp_data)
confusionMatrix(final_predict.rf, temp_data$classes) 

# Confusion Matrix and Statistics
# 
# Reference
# Prediction            red soil cotton crop grey soil damp grey soil vegetation stubble
# red soil                1533           0         0              0                  0
# cotton crop                0         703         0              0                  0
# grey soil                  0           0      1358              0                  0
# damp grey soil             0           0         0            626                  0
# vegetation stubble         0           0         0              0                707
# very damp grey soil        0           0         0              0                  0
# Reference
# Prediction            very damp grey soil
# red soil                              0
# cotton crop                           0
# grey soil                             0
# damp grey soil                        0
# vegetation stubble                    0
# very damp grey soil                1508
# 
# Overall Statistics
# 
# Accuracy : 1          
# 95% CI : (0.9994, 1)
# No Information Rate : 0.2382     
# P-Value [Acc > NIR] : < 2.2e-16  
# 
# Kappa : 1          
# 
# Mcnemar's Test P-Value : NA         
# 
# Statistics by Class:
# 
#                      Class: red soil Class: cotton crop Class: grey soil Class: damp grey soil
# Sensitivity                   1.0000             1.0000            1.000               1.00000
# Specificity                   1.0000             1.0000            1.000               1.00000
# Pos Pred Value                1.0000             1.0000            1.000               1.00000
# Neg Pred Value                1.0000             1.0000            1.000               1.00000
# Prevalence                    0.2382             0.1092            0.211               0.09728
# Detection Rate                0.2382             0.1092            0.211               0.09728
# Detection Prevalence          0.2382             0.1092            0.211               0.09728
# Balanced Accuracy             1.0000             1.0000            1.000               1.00000
#                      Class: vegetation stubble Class: very damp grey soil
# Sensitivity                             1.0000                     1.0000
# Specificity                             1.0000                     1.0000
# Pos Pred Value                          1.0000                     1.0000
# Neg Pred Value                          1.0000                     1.0000
# Prevalence                              0.1099                     0.2343
# Detection Rate                          0.1099                     0.2343
# Detection Prevalence                    0.1099                     0.2343
# Balanced Accuracy                       1.0000                     1.0000

## save
saveRDS(final, 'satellitea_rf.rds')

# Para realizar as classificações foi utilizada a base de dados Satellite. Essa base foi 
# distribuida em proporção 80/20 por cada classe para dados de treino e teste.
# Foram realizadas três classificações iniciais utilizando diferentes classificadores, que resultam
# no seguinte:
# - Random Forest: 0.912 de acuracia
# - Support Vector Machines: 0.9081 de acuracia
# - Neural Network: 0.6121 de acuracia
# Com relação a acuracia, o algoritmo que mostrou o melhor resultado foi o Random Forest.
# Como o Random Forest mostrou melhor rsultado para acuracia, foi realizado um treino com o 
# mesmo, utilizando toda a base de dados e o valor de mtry do modelo anteriormente treinado.
# Aplicando este modelo para toda a base foi obtido uma acuracia de 100%, o que mostra que o modelo esta
# possivelmente overfitado.
