
# 5] Interaction of block 1

library(interactions)
library(ggplot2)

block1_inter <- lm(SelfDisclosure ~  ImaginaryAudience + gender1 * timespentonFB023 + AGE, data = df)
summary(block1_inter)

interact_plot(block1_inter, pred = AGE, modx = gender1, interval = TRUE,
              int.width = 0.95, colors="Qual1", legend.main="Gender", x.label ="Age", y.label="Self-disclosure")  + theme_classic()

# for test4 : Males selfdisclose more than females

block1_inter <- lm(SelfDisclosure ~  ImaginaryAudience + gender1 * AGE + timespentonFB023, data = df)
summary(block1_inter)
interact_plot(block1_inter, pred = AGE, 
              modx = gender1,
              interval = TRUE,int.width = 0.95, 
              colors="Qual1",legend.main="Gender", 
              x.label ="Age", y.label="Predicted Self-disclosure") + theme_classic() 


block1_inter <- lm(SelfDisclosure ~  ImaginaryAudience + gender1 * timespentonFB023 + AGE, data = df)
summary(block1_inter)
interact_plot(block1_inter, pred = timespentonFB023, 
              modx = gender1,
              interval = TRUE,int.width = 0.95, 
              colors="Qual1",legend.main="Gender", 
              x.label ="Number of Friends", y.label="Predicted Self-disclosure") + theme_classic()


block1_inter <- lm(SelfDisclosure ~  ImaginaryAudience * gender1 + AGE + timespentonFB023, data = df)
summary(block1_inter)
interact_plot(block1_inter, pred = ImaginaryAudience, 
              modx = gender1,
              interval = TRUE,int.width = 0.90, 
              colors="Qual1",legend.main="Gender", 
              x.label ="ImaginaryAudience", y.label="Predicted Self-disclosure") + theme_classic()


##### test5  #####

### 12-13
inter_12_13 <- lm(SelfDisclosure ~  ImaginaryAudience * gender1 + timespentonFB023, data = Age12_13)
summary(inter_12_13)

interact_plot(inter_12_13, pred = ImaginaryAudience, 
              modx = gender1,
              interval = TRUE,int.width = 0.95, 
              colors="Qual1",legend.main="Gender", 
              x.label ="ImaginaryAudience", y.label="Predicted Self-disclosure") + theme_classic()



### 19-22
inter_19_22 <- lm(SelfDisclosure ~  ImaginaryAudience * gender1 + timespentonFB023, data = Age16_18)
summary(inter_19_22)

interact_plot(inter_19_22, pred = ImaginaryAudience, 
              modx = gender1,
              interval = TRUE,int.width = 0.95, 
              colors="Qual1",legend.main="Gender", 
              x.label ="ImaginaryAudience", y.label="Predicted Self-disclosure") + theme_classic()




#********* Summary table *********#

# required data of components for summary
data_for_summary <- df[, c("AGE", "timespentonFB023", "ImaginaryAudience",
                      "PersonalFable", "Narcissism", "SelfDisclosure" )]

##### no. of friends
mean(df$timespentonFB023,na.rm = TRUE)
summary(df$timespentonFB023)

#### age
mean(df$AGE,na.rm = TRUE)
summary(df$AGE)

#### Imaginary audience
df$ImaginaryAudience

#### personal fable
df$PersonalFable
#### narcissism
df$Narcissism

#-------------------------Latex code----------------------
library(stargazer)
stargazer(data_for_summary,
          covariate.labels = c("Age","Number of Friends","Imaginary Audience","Personal Fable","Narcissism","Self-Disclosure"),
          column.labels = c("Observations","Mean","St. Dev.","Min.","Percentile(25)","Percenticw(75)","Max"),
          digits = 2,
          out = "summary.html")

