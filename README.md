#Developing Data Products (DevDataProd-007) Course Project

This is a course project for the [Johns Hopkins Bloomberg School of Public Health's Getting and Cleaning Data online course] (https://class.coursera.org/devdataprod-007/). This repository consists of three essential components: [the exploratory data analysis](analysis.pdf), [the Shiny App](https://jedau.shinyapps.io/DevDataProd007-Proj/) (*ui.R* and *server.R*)  and the presentation/product pitch.

##Motivation

The project was motivated by the Kaggle competition, [Titanic: Machine Learning from Disaster](https://www.kaggle.com/c/titanic-gettingStarted). The app aims to predict whether the user would have survived the maiden voyage of the RMS Titanic.

##About the raw data

The [training](https://www.kaggle.com/c/titanic-gettingStarted/download/train.csv) and [test](https://www.kaggle.com/c/titanic-gettingStarted/download/test.csv) data was supplied by Kaggle. The description of the variables can be found [here](variables.txt).

##About the application

As of writing, the algorithm used by the program has an 79.426% accuracy (better than the benchmark). The whole project was written in R, and used libraries like [Slidify](http://ramnathv.github.io/slidify/) for the presentation and [Shinyapps.IO](http://www.shinyapps.io/) for the deployment. The training data is also available for download, with the app.

##Instructions

Run the Shiny App, enter the necessary information, wait for the algorithm to churn out a prediction and ready your funeral arrangements (or, you know, your last will and testament), just in case you ever travel through time and get to board the RMS Titanic.
