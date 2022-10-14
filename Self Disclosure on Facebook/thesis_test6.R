
#4] Relationship between Imaginary Audience and Self-disclosuere by Age & Gender

#----------------Age Group 1: Age12-13--------------------
# Males #
A1.males <- subset(Age12_13, gender1 == 0)
Males1 <- lm(scale(SelfDisclosure) ~ scale(timespentonFB023) + scale(ImaginaryAudience), data = A1.males)
summary(Males1)

# Females #
A1.females <- subset(Age12_13, gender1 == 1)
Females1 <- lm(scale(SelfDisclosure) ~ scale(timespentonFB023) + scale(ImaginaryAudience), data = A1.females)
summary(Females1)

#----------------Age Group 2: Age14-15--------------------
# Males #
A2.males <- subset(Age14_15, gender1 == 0)
Males2 <- lm(scale(SelfDisclosure) ~ scale(timespentonFB023) + scale(ImaginaryAudience), data = A2.males)
summary(Males2)

# Females #
A2.females <- subset(Age14_15, gender1 == 1)
Females2 <- lm(scale(SelfDisclosure) ~ scale(timespentonFB023) + scale(ImaginaryAudience), data = A2.females)
summary(Females2)

#----------------Age Group 3: Age16-18--------------------
# Males #
A3.males <- subset(Age16_18, gender1 == 0)
Males3 <- lm(scale(SelfDisclosure) ~ scale(timespentonFB023) + scale(ImaginaryAudience), data = A3.males)
summary(Males3)

# Females #
A3.females <- subset(Age16_18, gender1 == 1)
Females3 <- lm(scale(SelfDisclosure) ~ scale(timespentonFB023) + scale(ImaginaryAudience), data = A3.females)
summary(Females3)

#----------------Age Group 4: Age19-22--------------------
# Males #
A4.males <- subset(Age19_22, gender1 == 0)
Males4 <- lm(scale(SelfDisclosure) ~ scale(timespentonFB023) + scale(ImaginaryAudience), data = A4.males)
summary(Males4)

# Females #
A4.females <- subset(Age19_22, gender1 == 1)
Females4 <- lm(scale(SelfDisclosure) ~ scale(timespentonFB023) + scale(ImaginaryAudience), data = A4.females)
summary(Females4)

#-------------------------Latex code----------------------
library(stargazer)
stargazer(Males1,Females1,#Males2,Females2,Males3,Females3,Males4,Females4,
          dep.var.labels = c("Self-disclosure (12-13 age group)"),
          covariate.labels = c("Number of friends","Imaginary Audience"),
          column.labels = c("Males","Females","14-15 Males","14-15 Females",
                            "16-18 Males","16-18 Females","19-22 Males","19-22 Females"),
          digits = 2,
          omit.stat = c("adj.rsq", "n", "ser" ),
          omit = "Constant",
          out = "tab4.html")
 

