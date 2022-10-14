
#2] H2: Males tend to self-disclose more than that of females

#-------------------------block4--------------------------
block4 <- lm(ImaginaryAudience ~ gender1, data = df)
summary(block4)
cor(df$ImaginaryAudience, df$gender1, use = "complete.obs")
mean(block4$Imaginar)

#-----------------------##block2##------------------------
#-------------------------boys df-------------------------
boys <- subset(df, gender1 == 0)
mod1 <- lm(scale(SelfDisclosure) ~ scale(AGE) + scale(timespentonFB023) + scale(ImaginaryAudience), data = boys)
summary(mod1)
confint(mod1)
confint(mod2)
# plot CI

#------------------------girls df-------------------------
girls <- subset(df, gender1 == 1)
mod2 <- lm(scale(SelfDisclosure) ~ scale(AGE) + scale(timespentonFB023) + scale(ImaginaryAudience), data = girls)
summary(mod2)
mean(girls$ImaginaryAudience,na.rm = TRUE)
mod2$coefficients
mod2$fitted.values

#-------------------------Latex code----------------------
library(stargazer)
stargazer(mod1,mod2,
          covariate.labels = c("Age","Number of friends","Imaginary Audience"),
          column.labels = c("Males","Females"),
          dep.var.labels = "Self-disclosure",
          digits = 2,
          omit.stat = c("adj.rsq", "n", "ser" ),
          omit = "Constant",
          out = "tab2.html")





