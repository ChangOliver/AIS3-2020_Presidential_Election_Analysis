# AIS3 PTT Analysis
This is a 3-day mini hackathon

## Data Preparation
The data are originallly fetched from [0archive's](https://g0v.hackmd.io/@chihao/0archive/https%3A%2F%2Fg0v.hackmd.io%2F%40chihao%2F0archive%2Fedit%3Fedit) public dataset, particularly from the folder [PTT 政黑版](https://drive.google.com/drive/folders/1sOsJWcWkAcPWsqUzFVC6PSuKs89cpg-O)(PTT HatePolictics). We chose data from 2019-12 as we want to study public opinion on PTT forum one month before the presidential election, which was in January, 2020.

Data are converted to csv first and reconstructed to desired format with *construct.R*, with each daily data split into content and comment. All dates are then merge into monthly data with *merge.R*, also separated by content and comment.

## Analysis
The code used for analysis are presented in PTT.Rmd, the respective results can be seen in the imgs folder or on our [website](https://www.csie.ntu.edu.tw/~b06902119/AIS3/AIS3.html).
