
#1] H1: Imaginary Audience is positively associated with self disclosure

library(foreign)
data <- read.spss("Marina - Dataset2017 compleet FINAL min outliers.sav", to.data.frame=TRUE)
#library(Hmisc)

#--------------------columns as factors-------------------
df = data.frame(apply(data, 2, function(x) as.numeric(as.character(x))))

#---------------------------------------------------------
plot(df$SelfDisclosure, df$ImaginaryAudience)
abline(df$SelfDisclosure, df$ImaginaryAudience)
blk1 <- lm(SelfDisclosure ~ ImaginaryAudience, data = df)
coef(blk1)
summary(blk1)
typeof(df$SelfDisclosure)

#-------------------------block1--------------------------
block1 <- lm(scale(SelfDisclosure) ~ scale(AGE) + scale(gender1) + scale(timespentonFB023), data = df)
summary(block1)
#confint(block1)
#boxplot(SelfDisclosure ~ gender1, data = df)


#-------------------------block2--------------------------
block2 <- lm(scale(SelfDisclosure) ~ scale(AGE) + scale(gender1) + scale(timespentonFB023) + scale(ImaginaryAudience), data = df)
summary(block2)
#cor(df$SelfDisclosure, df$ImaginaryAudience, use = "complete.obs") #complete.obs for handling NA values

#-------------------------block3--------------------------
block3 <- lm(scale(SelfDisclosure) ~ scale(AGE) + scale(gender1) + scale(timespentonFB023) + scale(Narcissism), data = df)
summary(block3)

#-------------------------block4--------------------------
block4 <- lm(scale(SelfDisclosure) ~ scale(AGE) + scale(gender1) + scale(timespentonFB023) + scale(Narcissism) + scale(ImaginaryAudience) , data = df)
summary(block4)

#-------------------------block5--------------------------
block5 <- lm(scale(ImaginaryAudience) ~ scale(AGE) + scale(gender1) + scale(timespentonFB023) + scale(Narcissism), data = df)
summary(block5)


#-----if we want to update existing mode(but usually doesnt work)--------
#block3 <- update(block1, .~. , +ImaginaryAudience)
#summary(block3)

#-------------------------Latex code----------------------
library(stargazer)
stargazer(block1, block2, block3, block4,
          covariate.labels = c("Age","Gender","Number of friends",
                               "Imaginary Audience", "Narcissism"),
          column.labels = c("Model 1", "Model 2", "Model 3", "Model 4"),
          dep.var.labels = "Self-disclosure",
          digits = 2,
          omit.stat = c("adj.rsq", "n", "ser"),
          omit = "Constant",
          #column.sep.width = "10pt",
          #font.size = "Large",
          out = "tab1.html")

library(stargazer)
stargazer(block3, block5, block4,
          covariate.labels = c("Age","Gender","Number of friends","Narcissism", "Imaginary Audience"),
          column.labels = c("Stage 1", "Stage 2", "Stage 3"),
          dep.var.labels = c("Self-disclosure","Imaginary Audience", "Self-disclosure"),
          digits = 2,
          omit.stat = c("adj.rsq", "n", "ser"),
          omit = "Constant",
          #column.sep.width = "10pt",
          #font.size = "Large",
          out = "tab5.html")

############# sobel test
library(bda)
mediation.test(df$ImaginaryAudience, df$Narcissism, df$SelfDisclosure)
