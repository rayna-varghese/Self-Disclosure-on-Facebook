library(foreign)
data <- read.spss("Marina - Dataset2017 compleet FINAL min outliers.sav", to.data.frame=TRUE)
library(Hmisc)
#stack(attr(data, 'labels'))

#data.var <- attr(data, 'variable.labels')

#head(data.var)8
# *language translation not required
#--------------------response values---------------------

data <- data.frame(lapply(data, function(x) {
  gsub("sterk mee oneens", "strongly disagree", x)
}))
data <- data.frame(lapply(data, function(y) {
  gsub("een beetje mee oneens", "disagree a bit", y)
}))
data <- data.frame(lapply(data, function(z) {
  gsub("neutraal", "neutral", z)
}))
data <- data.frame(lapply(data, function(w) {
  gsub("een beetje mee eens", "kind of agree", w)
}))
data <- data.frame(lapply(data, function(t) {
  gsub("sterk mee eens", "strongly agree", t)
}))

#--------------------response values-IA-------------------

data <- data.frame(lapply(data, function(q) {
  gsub("ik vertel hier niets over", "I'm not telling you about this", q)
}))
data <- data.frame(lapply(data, function(e) {
  gsub("ik vertel hier een beetje over", "I tell you a little bit about this", e)
}))
data <- data.frame(lapply(data, function(r) {
  gsub("ik vertel hier een matige hoeveelheid over", "I tell a moderate amount about this", r)
}))
data <- data.frame(lapply(data, function(u) {
  gsub("ik vertel hier veel over", "I tell a lot about this", u)
}))
data <- data.frame(lapply(data, function(i) {
  gsub("ik vertel hier alles over", "I tell you all about this", i)
}))

#--------------------response values-IA9-----------------

data <- data.frame(lapply(data, function(o) {
  gsub("altijd", "always", o)
}))
data <- data.frame(lapply(data, function(a) {
  gsub("nooit", "never", a)
}))
data <- data.frame(lapply(data, function(s) {
  gsub("soms", "sometimes", s)
}))
data <- data.frame(lapply(data, function(d) {
  gsub("vaak", "often", d)
}))
data <- data.frame(lapply(data, function(f) {
  gsub("zelden", "rarely", f)
}))
data <- data.frame(lapply(data, function(g) {
  gsub("waar", "true", g)
}))

#--------------------response values-selfesteem----------

data <- data.frame(lapply(data, function(h) {
  gsub("helemaal mee eens", "totally agree", h)
}))
data <- data.frame(lapply(data, function(l) {
  gsub("helemaal niet mee eens", "disagree at all", l)
}))

#---run 2nd
data <- data.frame(lapply(data, function(j) {
  gsub("niet mee eens", "do not agree with", j)
}))
data <- data.frame(lapply(data, function(k) {
  gsub("mee eens", "agree", k)
}))


#--------------------nummer------------------------------

names(data)[1] <- "number"
label(data$number) <- "last four digits of your telephone number"

#--------------------dagboek-----------------------------

names(data)[2] <- "diary"
label(data$diary) <- "keep a diary or not"

library(plyr)
data$diary <- revalue(data$diary, c("nee"="no"))
data$diary <- revalue(data$diary, c("ja"="yes"))

#--------------------AGE---------------------------------

label(data$AGE) <- "How old are you?"

#--------------------gender------------------------------

data$gender <- revalue(data$gender, c("man" ="male"))
data$gender <- revalue(data$gender, c("vrouw" ="female"))
label(data$gender) <- "gender,female=0"

#--------------------demographic 013 level---------------

names(data)[5] <- "demographic013level"
unique(data$demographic013level)
label(data$demographic013level) <- "mavo/havo/vwo"

#--------------------timespentonFB021--------------------

label(data$timespentonFB021) <- "How much time have you spent on active Facebook usage today?"

#--------------------timespentonFB022--------------------

label(data$timespentonFB022) <- "How many times have you logged into Facebook today?"

#--------------------timespentonFB023--------------------

label(data$timespentonFB023) <- "How many friends do you have on Facebook?"

#--------------------timespentonFB024--------------------

label(data$timespentonFB024) <- "How long have you had your Facebook page?"

#--------------------timespentonFB025--------------------

label(data$timespentonFB025) <- "How much time did you spend on Facebook chat today?"

#--------------------FBcustomization031------------------

label(data$FBcustomization031) <- "Updated your status"

#--------------------FBcustomization032------------------

label(data$FBcustomization032) <- "Posts (photos, videos, links) placed on your Facebook page"

#--------------------FBcustomization033------------------

label(data$FBcustomization033) <- "Responded to posts from friends"

#--------------------FBcustomization034------------------

label(data$FBcustomization034) <- "Written on friends' Facebook page"

#--------------------FBcustomization035------------------

label(data$FBcustomization035) <- "Clicked on a link posted by a friend"
  
#--------------------FBcustomization036------------------

label(data$FBcustomization036) <- "Shared posts that others have posted"

#--------------------FBcustomization037------------------

label(data$FBcustomization037) <- "Certain groups or pages 'liked'"

#--------------------FBcustomization038------------------

label(data$FBcustomization038) <- "'Checked in' at a specific location"

#--------------------FBcustomization039------------------

label(data$FBcustomization039) <- "Friends / family added / removed"

#--------------------FBcustomization0310-----------------

label(data$FBcustomization0310) <- "New photo albums made"

#--------------------FBcustomization0311-----------------

label(data$FBcustomization0311) <- "Your profile picture changed"
  
#--------------------FBcustomization0312-----------------

label(data$FBcustomization0312) <- "Your personal information has changed"
  
#--------------------FBcustomization0313-----------------

label(data$FBcustomization0313) <- "Looked at the profile page of someone you are not friends with on Facebook"
  
#--------------------FBcustomization0314-----------------

label(data$FBcustomization0314) <- "Got in touch with a stranger via Facebook"

#--------------------behavioralrehearsal041--------------

label(data$behavioralrehearsal041) <- "I compare my Facebook page with my friends' Facebook page."
#data$behavioralrehearsal041 <- revalue(data$behavioralrehearsal041, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal041 <- revalue(data$behavioralrehearsal041, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal041 <- revalue(data$behavioralrehearsal041, c("neutraal" = "neutral"))
#data$behavioralrehearsal041 <- revalue(data$behavioralrehearsal041, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal041 <- revalue(data$behavioralrehearsal041, c("sterk mee eens" = "strongly agree"))

#--------------------behavioralrehearsal042--------------

label(data$behavioralrehearsal042) <- "I think about what's popular on Facebook when I update my Facebook page"
#data$behavioralrehearsal042 <- revalue(data$behavioralrehearsal042, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal042 <- revalue(data$behavioralrehearsal042, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal042 <- revalue(data$behavioralrehearsal042, c("neutraal" = "neutral"))
#data$behavioralrehearsal042 <- revalue(data$behavioralrehearsal042, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal042 <- revalue(data$behavioralrehearsal042, c("sterk mee eens" = "strongly agree"))

#--------------------behavioralrehearsal043--------------

label(data$behavioralrehearsal043) <- "I think about 'liking' things (groups, comments) based on what other people 'like' on Facebook."
#data$behavioralrehearsal043 <- revalue(data$behavioralrehearsal043, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal043 <- revalue(data$behavioralrehearsal043, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal043 <- revalue(data$behavioralrehearsal043, c("neutraal" = "neutral"))
#data$behavioralrehearsal043 <- revalue(data$behavioralrehearsal043, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal043 <- revalue(data$behavioralrehearsal043, c("sterk mee eens" = "strongly agree"))

#--------------------behavioralrehearsal044--------------

label(data$behavioralrehearsal044) <- "I often think of things I can add to my Facebook page when I'm not on Facebook"
#data$behavioralrehearsal044 <- revalue(data$behavioralrehearsal044, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal044 <- revalue(data$behavioralrehearsal044, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal044 <- revalue(data$behavioralrehearsal044, c("neutraal" = "neutral"))
#data$behavioralrehearsal044 <- revalue(data$behavioralrehearsal044, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal044 <- revalue(data$behavioralrehearsal044, c("sterk mee eens" = "strongly agree"))


#--------------------behavioralrehearsal045--------------

label(data$behavioralrehearsal045) <- "I think of becoming 'friends' on Facebook with new acquaintances when I first meet them"
#data$behavioralrehearsal045 <- revalue(data$behavioralrehearsal045, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal045 <- revalue(data$behavioralrehearsal045, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal045 <- revalue(data$behavioralrehearsal045, c("neutraal" = "neutral"))
#data$behavioralrehearsal045 <- revalue(data$behavioralrehearsal045, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal045 <- revalue(data$behavioralrehearsal045, c("sterk mee eens" = "strongly agree"))

#--------------------behavioralrehearsal046--------------

label(data$behavioralrehearsal046) <- "If something happens I think about how I can share it on Facebook"
#data$behavioralrehearsal046 <- revalue(data$behavioralrehearsal046, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal046 <- revalue(data$behavioralrehearsal046, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal046 <- revalue(data$behavioralrehearsal046, c("neutraal" = "neutral"))
#data$behavioralrehearsal046 <- revalue(data$behavioralrehearsal046, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal046 <- revalue(data$behavioralrehearsal046, c("sterk mee eens" = "strongly agree"))

#--------------------behavioralrehearsal047--------------

label(data$behavioralrehearsal047) <- "I only take photos at events so that I can share them on my Facebook page"
#data$behavioralrehearsal047 <- revalue(data$behavioralrehearsal047, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal047 <- revalue(data$behavioralrehearsal047, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal047 <- revalue(data$behavioralrehearsal047, c("neutraal" = "neutral"))
#data$behavioralrehearsal047 <- revalue(data$behavioralrehearsal047, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal047 <- revalue(data$behavioralrehearsal047, c("sterk mee eens" = "strongly agree"))

#--------------------behavioralrehearsal048--------------

label(data$behavioralrehearsal048) <- "I say funny things to my friends so they can put it on Facebook"
#data$behavioralrehearsal048 <- revalue(data$behavioralrehearsal048, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal048 <- revalue(data$behavioralrehearsal048, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal048 <- revalue(data$behavioralrehearsal048, c("neutraal" = "neutral"))
#data$behavioralrehearsal048 <- revalue(data$behavioralrehearsal048, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal048 <- revalue(data$behavioralrehearsal048, c("sterk mee eens" = "strongly agree"))

#--------------------behavioralrehearsal049--------------

label(data$behavioralrehearsal049) <- "Sometimes I only do things because I can put them on Facebook"
#data$behavioralrehearsal049 <- revalue(data$behavioralrehearsal049, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal049 <- revalue(data$behavioralrehearsal049, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal049 <- revalue(data$behavioralrehearsal049, c("neutraal" = "neutral"))
#data$behavioralrehearsal049 <- revalue(data$behavioralrehearsal049, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal049 <- revalue(data$behavioralrehearsal049, c("sterk mee eens" = "strongly agree"))

#--------------------behavioralrehearsal0410-------------

label(data$behavioralrehearsal0410) <- "When I am with a group I change my behavior so that it will look good on Facebook"
#data$behavioralrehearsal0410 <- revalue(data$behavioralrehearsal0410, c("sterk mee oneens" = "strongly disagree"))
#data$behavioralrehearsal0410 <- revalue(data$behavioralrehearsal0410, c("een beetje mee oneens" = "disagree a bit"))
#data$behavioralrehearsal0410 <- revalue(data$behavioralrehearsal0410, c("neutraal" = "neutral"))
#data$behavioralrehearsal0410 <- revalue(data$behavioralrehearsal0410, c("een beetje mee eens" = "kind of agree"))
#data$behavioralrehearsal0410 <- revalue(data$behavioralrehearsal0410, c("sterk mee eens" = "strongly agree"))

#--------------------socialconnectedness051--------------

label(data$socialconnectedness051) <- "I feel like an outsider in my Facebook network"
#data$socialconnectedness051 <- revalue(data$socialconnectedness051, c("sterk mee oneens" = "strongly disagree"))
#data$socialconnectedness051 <- revalue(data$socialconnectedness051, c("een beetje mee oneens" = "disagree a bit"))
#data$socialconnectedness051 <- revalue(data$socialconnectedness051, c("neutraal" = "neutral"))
#data$socialconnectedness051 <- revalue(data$socialconnectedness051, c("een beetje mee eens" = "kind of agree"))
#data$socialconnectedness051 <- revalue(data$socialconnectedness051, c("sterk mee eens" = "strongly agree"))

#--------------------socialconnectedness052--------------

label(data$socialconnectedness052) <- "I feel far away from people in my Facebook network"
#data$socialconnectedness052 <- revalue(data$socialconnectedness052, c("sterk mee oneens" = "strongly disagree"))
#data$socialconnectedness052 <- revalue(data$socialconnectedness052, c("een beetje mee oneens" = "disagree a bit"))
#data$socialconnectedness052 <- revalue(data$socialconnectedness052, c("neutraal" = "neutral"))
#data$socialconnectedness052 <- revalue(data$socialconnectedness052, c("een beetje mee eens" = "kind of agree"))
#data$socialconnectedness052 <- revalue(data$socialconnectedness052, c("sterk mee eens" = "strongly agree"))

#--------------------socialconnectedness053--------------

label(data$socialconnectedness053) <- "I feel strongly connected to people on Facebook"
#data$socialconnectedness053 <- revalue(data$socialconnectedness053, c("sterk mee oneens" = "strongly disagree"))
#data$socialconnectedness053 <- revalue(data$socialconnectedness053, c("een beetje mee oneens" = "disagree a bit"))
#data$socialconnectedness053 <- revalue(data$socialconnectedness053, c("neutraal" = "neutral"))
#data$socialconnectedness053 <- revalue(data$socialconnectedness053, c("een beetje mee eens" = "kind of agree"))
#data$socialconnectedness053 <- revalue(data$socialconnectedness053, c("sterk mee eens" = "strongly agree"))

#--------------------socialconnectedness054--------------

label(data$socialconnectedness054) <- "I am able to bond with friends on Facebook"
#data$socialconnectedness054 <- revalue(data$socialconnectedness054, c("sterk mee oneens" = "strongly disagree"))
#data$socialconnectedness054 <- revalue(data$socialconnectedness054, c("een beetje mee oneens" = "disagree a bit"))
#data$socialconnectedness054 <- revalue(data$socialconnectedness054, c("neutraal" = "neutral"))
#data$socialconnectedness054 <- revalue(data$socialconnectedness054, c("een beetje mee eens" = "kind of agree"))
#data$socialconnectedness054 <- revalue(data$socialconnectedness054, c("sterk mee eens" = "strongly agree"))

#--------------------socialconnectedness055--------------

label(data$socialconnectedness055) <- "I don't feel connected to most people in my Facebook network"
#data$socialconnectedness055 <- revalue(data$socialconnectedness055, c("sterk mee oneens" = "strongly disagree"))
#data$socialconnectedness055 <- revalue(data$socialconnectedness055, c("een beetje mee oneens" = "disagree a bit"))
#data$socialconnectedness055 <- revalue(data$socialconnectedness055, c("neutraal" = "neutral"))
#data$socialconnectedness055 <- revalue(data$socialconnectedness055, c("een beetje mee eens" = "kind of agree"))
#data$socialconnectedness055 <- revalue(data$socialconnectedness055, c("sterk mee eens" = "strongly agree"))

#--------------------socialconnectedness056--------------

label(data$socialconnectedness056) <- "I feel disconnected from the Facebook world around me"
#data$socialconnectedness056 <- revalue(data$socialconnectedness056, c("sterk mee oneens" = "strongly disagree"))
#data$socialconnectedness056 <- revalue(data$socialconnectedness056, c("een beetje mee oneens" = "disagree a bit"))
#data$socialconnectedness056 <- revalue(data$socialconnectedness056, c("neutraal" = "neutral"))
#data$socialconnectedness056 <- revalue(data$socialconnectedness056, c("een beetje mee eens" = "kind of agree"))
#data$socialconnectedness056 <- revalue(data$socialconnectedness056, c("sterk mee eens" = "strongly agree"))

#--------------------socialconnectedness057--------------

label(data$socialconnectedness057) <- "I am able to feel connected to other people on Facebook"
#data$socialconnectedness057 <- revalue(data$socialconnectedness057, c("sterk mee oneens" = "strongly disagree"))
#data$socialconnectedness057 <- revalue(data$socialconnectedness057, c("een beetje mee oneens" = "disagree a bit"))
#data$socialconnectedness057 <- revalue(data$socialconnectedness057, c("neutraal" = "neutral"))
#data$socialconnectedness057 <- revalue(data$socialconnectedness057, c("een beetje mee eens" = "kind of agree"))
#data$socialconnectedness057 <- revalue(data$socialconnectedness057, c("sterk mee eens" = "strongly agree"))

#--------------------socialconnectedness058--------------

label(data$socialconnectedness058) <- "I don't feel like I'm participating on Facebook with anyone or a group"
#data$socialconnectedness058 <- revalue(data$socialconnectedness058, c("sterk mee oneens" = "strongly disagree"))
#data$socialconnectedness058 <- revalue(data$socialconnectedness058, c("een beetje mee oneens" = "disagree a bit"))
#data$socialconnectedness058 <- revalue(data$socialconnectedness058, c("neutraal" = "neutral"))
#data$socialconnectedness058 <- revalue(data$socialconnectedness058, c("een beetje mee eens" = "kind of agree"))
#data$socialconnectedness058 <- revalue(data$socialconnectedness058, c("sterk mee eens" = "strongly agree"))

#--------------------socialconnectedness059--------------

label(data$socialconnectedness059) <- "I find myself actively involved in the life of my Facebook friends"
#data$socialconnectedness059 <- revalue(data$socialconnectedness059, c("sterk mee oneens" = "strongly disagree"))
#data$socialconnectedness059 <- revalue(data$socialconnectedness059, c("een beetje mee oneens" = "disagree a bit"))
#data$socialconnectedness059 <- revalue(data$socialconnectedness059, c("neutraal" = "neutral"))
#data$socialconnectedness059 <- revalue(data$socialconnectedness059, c("een beetje mee eens" = "kind of agree"))
#data$socialconnectedness059 <- revalue(data$socialconnectedness059, c("sterk mee eens" = "strongly agree"))

#--------------------socialpresence061-------------------

label(data$socialpresence061) <- "People on Facebook understand each other"

#--------------------socialpresence062-------------------

label(data$socialpresence062) <- "I understand the opinions of other Facebook users"

#--------------------socialpresence063-------------------

label(data$socialpresence063) <- "The other Facebook users understand what I mean"

#--------------------socialpresence064-------------------

label(data$socialpresence064) <- "My thoughts are clear to other people on Facebook"

#--------------------socialpresence065-------------------

label(data$socialpresence065) <- "Other people's thoughts on Facebook are clear to me"

#--------------------socialawareness071------------------

label(data$socialawareness071) <- "I hardly notice other users on Facebook"

#--------------------socialawareness072------------------

label(data$socialawareness072) <- "I feel that other Facebook users are aware of my presence"

#--------------------socialawareness073------------------

label(data$socialawareness073) <- "The other people on Facebook don't notice me"

#--------------------socialawareness074------------------

label(data$socialawareness074) <- "I am often aware of other people on Facebook"

#--------------------socialawareness075------------------

label(data$socialawareness075) <- "Others are often aware of me on Facebook"

#--------------------selfdisclosure**--------------------

label(data$selfdisclosure081) <- "How much do you tell about your personal feelings?"
label(data$selfdisclosure082) <- "How much do you tell about the things that worry you?"
label(data$selfdisclosure083) <- "How much do you tell about your secrets?"
label(data$selfdisclosure084) <- "How much do you tell about being in love?"
label(data$selfdisclosure085) <- "How much do you tell about moments in your life that you are ashamed of?"
label(data$selfdisclosure086) <- "How much do you tell about moments in your life that you feel guilty about?"

#--------------------imaginaryaudience**-----------------

label(data$imaginaryaudience091) <- "Be a movie star or television star"
label(data$imaginaryaudience092) <- "Being popular with friends"
label(data$imaginaryaudience093) <- "Be amazed at how you look"
label(data$imaginaryaudience094) <- "Be amazed at how you dress"
label(data$imaginaryaudience095) <- "Have a popular boyfriend or girlfriend"
label(data$imaginaryaudience096) <- "Imagine how others would feel if you were no longer there"
label(data$imaginaryaudience097) <- "Have a lot of friends"
label(data$imaginaryaudience098) <- "Make people say sorry for hurting you"
label(data$imaginaryaudience099) <- "Imagine how others would feel if you lost your mother or father"
label(data$imaginaryaudience0910) <- "Imagine how others would feel if you were in a hospital"
label(data$imaginaryaudience0911) <- "Giving an important speech"
label(data$imaginaryaudience0912) <- "Being rejected by a friend"
label(data$imaginaryaudience0913) <- "Be amazed for being funny"
label(data$imaginaryaudience0914) <- "Be admired for the car you have or want"
label(data$imaginaryaudience0915) <- "Be admired for your music collection or sound system"
label(data$imaginaryaudience0916) <- "Imagine what others think about the way you look"
label(data$imaginaryaudience0917) <- "Ask a popular boy or girl on a date"
label(data$imaginaryaudience0918) <- "Imagine what everyone would think if you became famous"
label(data$imaginaryaudience0919) <- "Other people seem to like it when I am the center of attention"
label(data$imaginaryaudience0920) <- "Imagine whether other people find you attractive"
label(data$imaginaryaudience0921) <- "Be admired for being cool"

#--------------------narcissism--------------------------

names(data)[93] <- "narcissism111"
names(data)[94] <- "narcissism112"
names(data)[95] <- "narcissism113"
names(data)[96] <- "narcissism114"
names(data)[97] <- "narcissism115"
names(data)[98] <- "narcissism116"
names(data)[99] <- "narcissism117"
names(data)[100] <- "narcissism118"
names(data)[101] <- "narcissism119"
names(data)[102] <- "narcissism1110"

label(data$narcissism111) <- "I am a rare person"
label(data$narcissism112) <- "I can usually talk down everywhere"
label(data$narcissism113) <- "I see myself as a good leader"
label(data$narcissism114) <- "I am more skilled than other people"
label(data$narcissism115) <- "I know I'm good because everyone keeps telling me that"
label(data$narcissism116) <- "I am a natural talent in influencing people"
label(data$narcissism117) <- "I prefer to be a leader"
label(data$narcissism118) <- "I like to get compliments"
label(data$narcissism119) <- "I insist on getting the respect I have earned"
label(data$narcissism1110) <- "I like to be the center of attention"

#--------------------eenzaamheid(loneliness)-------------

names(data)[103] <- "loneliness121"
names(data)[104] <- "loneliness122"
names(data)[105] <- "loneliness123"

label(data$loneliness121) <- "How often do you feel you have too few people around you?"
label(data$loneliness122) <- "How often do you feel left out?"
label(data$loneliness123) <- "How often do you feel separated from others?"

#--------------------selfesteem***----------------------

label(data$selfesteem131) <- "In general, I am satisfied with myself"
label(data$selfesteem132) <- "Sometimes I think I'm no good at all"
label(data$selfesteem133) <- "I feel like I have some good qualities"
label(data$selfesteem134) <- "I am able to do things as well as most other people"
label(data$selfesteem135) <- "I feel like I don't have much to be proud of"
label(data$selfesteem136) <- "It is undoubtedly the case that I sometimes feel useless"
label(data$selfesteem137) <- "I feel that I am a valuable person, at least equal to others"
label(data$selfesteem138) <- "I wish I could gain more respect for myself"
label(data$selfesteem139) <- "All in all, I tend to feel like a failure"
label(data$selfesteem1310) <- "I look at myself in a positive way"

