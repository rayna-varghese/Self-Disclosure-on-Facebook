
#3] Relationship between Imaginary Audience and Self-disclosuere by Age

#-----------------------##Age Groups##--------------------
#-------------------------Age12-13 df---------------------
A12_13 <- subset(data, agegroups == 1)
Age12_13 = data.frame(apply(A12_13, 2, function(x) as.numeric(as.character(x))))
blk1 <- lm(scale(SelfDisclosure) ~ scale(gender1) + scale(timespentonFB023), data = Age12_13)
summary(blk1)
blk2 <- lm(scale(SelfDisclosure) ~ scale(gender1) + scale(timespentonFB023) + scale(ImaginaryAudience), data = Age12_13)
summary(blk2)

#-------------------------Age14-15 df---------------------
A14_15 <- subset(data, agegroups == 2)
Age14_15 = data.frame(apply(A14_15, 2, function(x) as.numeric(as.character(x))))
blk3 <- lm(scale(SelfDisclosure) ~ scale(gender1) + scale(timespentonFB023), data = Age14_15)
summary(blk3)
blk4 <- lm(scale(SelfDisclosure) ~ scale(gender1) + scale(timespentonFB023) + scale(ImaginaryAudience), data = Age14_15)
summary(blk4)

#-------------------------Age16-18 df---------------------
A16_18 <- subset(data, agegroups == 3)
Age16_18 = data.frame(apply(A16_18, 2, function(x) as.numeric(as.character(x))))
blk5 <- lm(scale(SelfDisclosure) ~ scale(gender1) + scale(timespentonFB023), data = Age16_18)
summary(blk5)
blk6 <- lm(scale(SelfDisclosure) ~ scale(gender1) + scale(timespentonFB023) + scale(ImaginaryAudience), data = Age16_18)
summary(blk6)

#-------------------------Age19-22 df---------------------
A19_22 <- subset(data, agegroups == 4)
Age19_22 = data.frame(apply(A19_22, 2, function(x) as.numeric(as.character(x))))
blk7 <- lm(scale(SelfDisclosure) ~ scale(gender1) + scale(timespentonFB023), data = Age19_22)
summary(blk7)
blk8 <- lm(scale(SelfDisclosure) ~ scale(gender1) + scale(timespentonFB023) + scale(ImaginaryAudience), data = Age19_22)
summary(blk8)


#-------------------------Latex code----------------------
library(stargazer)
stargazer(blk1,blk2,blk3,blk4,blk5,blk6,blk7,blk8,
          dep.var.labels = c("Self-disclosure (Age Groups)"),
          covariate.labels = c("Gender","Number of friends","Imaginary Audience"),
          column.labels = c("12-13 (block 1)","12-13 (block 2)","14-15 (block 1)","14-15 (block 2)","16-18 (block 1)","16-18 (block 2)","19-22 (block 1)","19-22 (block 2)"),
          #dep.var.labels = "Self-disclosure",
          digits = 2,
          omit.stat = c("adj.rsq", "n", "ser" ),
          omit = "Constant",
          out = "tab3.html")


