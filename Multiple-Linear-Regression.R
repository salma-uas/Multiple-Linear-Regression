  
  """ The data set cereals contains nutritional information for 77 breakfast ce
reals. We are interested in estimating the nutritional rating given some of
the other variables, i.e. we are going to study a multiple linear regression
 model with rating as response variable and some of the other variables as
 explanatory variables.
"""

cereals=read.csv(file="C:/Users/omme-/Desktop/DM_Excersize/Ex_5/cereals.dat",
sep="")

library(rgl)
attach(cereals)
plot(SUGARS,RATING)
plot(FIBER,RATING)
plot3d(SUGARS,FIBER,RATING)
  
model=lm(RATING~SUGARS)
summary(model)
  
model=lm(RATING~FIBER)
plot(FIBER,RATING)
summary(model)
abline(model)

model=lm(RATING~SUGARS+FIBER)
summary(model)
  
  """ we are still going to study the cereals data set. This time predictor variable 
will be a categorical variable. In the regression modeling, we can use
categorical variables as inputs through the use of indicator variables 
(so-called dummy variables). We are  still going to use rating as response
variable.As explanatory variable, consider the variable shelf. This 
variable indicates which supermarket shelf the particular cereal was 
located on (shelf 1, 2 or 3).
"""

plot(RATING,SHELF)

dim(cereals)
shelf1=seq(0,0,length.out=77)
shelf2=seq(0,0,length.out=77)

shelf1[SHELF==1]=1
shelf1[SHELF==2]=0
shelf1[SHELF==3]=0

shelf2[SHELF==1]=0
shelf2[SHELF==2]=1
shelf2[SHELF==3]=0

model=lm(RATING~SUGARS+FIBER+shelf1+shelf2)
summary(model)

  """ The price of the cars, Price, in the data set Cars93 in the library MASS
is going to be the dependent variable in this multiple regression analysis.
One way to compare different multiple regression models is to use the so
called information criteria: AIC (Akaikes Information Criterion) or SBC
(Schwarz-Bayes Information Criterion).  Also use Mallows Cp criterion to choose be
tween different multiple regression models.
"""

library(MASS)
attach(Cars93)
names(Cars93)

sss=lm(Price~RPM +Horsepower+ Weight+ Passengers+ MPG.city+MPG.highway)
summary(sss)
names(sss)
extractAIC(sss)
fitted.values(sss)
Price

#BIC value calculate
n=nrow(Cars93)
extractAIC(sss,k=log(n))

summa=summary(lm(Price~RPM))
sig=summa$sigma
extractAIC(sss,scale=sig*sig)[2]

---------------------------------------
--------------Q4-----------------------
""" The price of the cars, Price, in the data set Cars93 is still going to be
 the dependent variable in this multiple regression analysis. Use the three
 variable selection methods such as backward elimination, forward and stepwise
 selection to find explanatory variables for the regression model.

"""
  
#Backward selection
myback=step(lm(Price~RPM+EngineSize+MPG.city+MPG.highway+Cylinders+
                 Horsepower+Weight+Passengers))

#Stepwise selection
mystep=step(lm(Price~RPM+EngineSize+MPG.city+MPG.highway+Cylinders+
                 Horsepower+Weight+Passengers),direction="both")

#forward selection
mymatrix=data.frame(RPM,EngineSize,MPG.city,MPG.highway,Cylinders,
                    Horsepower,Weight,Passengers)

nullmodel=lm(Price~1,data=mymatrix)
myfor=step(nullmodel,scope=formula(mymatrix),direction="both")

  
  
  
  
