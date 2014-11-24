library(caret)
library(randomForest)

train.colClasses <- c('integer',   # PassengerId
                      'factor',    # Survived 
                      'factor',    # Pclass
                      'character', # Name
                      'factor',    # Sex
                      'numeric',   # Age
                      'integer',   # SibSp
                      'integer',   # Parch
                      'character', # Ticket
                      'numeric',   # Fare
                      'character', # Cabin
                      'factor',    # Embarked
                      'character', # Title
                      'character'     # PAC
)
training <- read.csv("preprocessed.csv", header = TRUE, colClasses = train.colClasses)
features <- c("Survived", "Pclass", "Sex", "Age", "SibSp", "Parch", "Embarked", "PAC")
training <- training[features]
model <- train(Survived ~ ., data = training, method = "rf")

survivability <- function(age, sex, marital, pc, sib, sp, class) {
    message <- ""
    parch <- 0
    sibsp <- 0
    pac <- ifelse(age <= 12, "C", "A")
    if(marital == "married")
        if(sp == "yes")
            sibsp <- sibsp + 1
    if(sib > 0)
        sibsp <- sibsp + sib
    if(parch > 0) {
        parch <- parch + pc
        if(pac == "A")
            pac <- "P"
    }
    pred.data <- data.frame(Pclass = class, Sex = sex, Age = age, 
                            SibSp = sibsp, Parch = pc, Embarked = "S", PAC = pac)
    pred.data$Pclass <- as.factor(pred.data$Pclass)
    result <- predict(model, pred.data)
    message <- ifelse(result == 1, "Survived", "Perished")
    return(message)
}

tidbit <- function(age, sex, marital, pc, sib, sp, class) {
    outcome <- survivability(age, sex, marital, pc, sib, sp, class)
    tid <- ifelse(outcome == "Survived",
                  ifelse(age < 12 & sex == "female", 
                        "Who run the world? Apparently, you do. Perks of being a woman.",
                        ifelse(age < 60,
                                "Congratulations! You get to live to see two World Wars.",
                                ifelse(age > 60,
                                       "But, you would contract hypothermia and die within a couple of months.",
                                       "You get to live to fight another day. Good for you, old chap."))),
                  ifelse(class == 1,
                        "Money can buy you happiness, but it can't ensure you'll stay alive.",
                        ifelse(class == 2,
                               "You barely survived by the skin of your teeth! Too bad your teeth doesn't have skin.",
                                ifelse(class == 3,
                                       "A lesson for your next life: study hard and get a high-paying job.",
                                       ))))
    return(tid)
}