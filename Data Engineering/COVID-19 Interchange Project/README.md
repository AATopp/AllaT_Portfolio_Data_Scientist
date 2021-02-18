# COVID-19 Data Interconnection Project

The aim of this project is to connect key data points around the spread of sars-cov-2, commonly known as the disease COVID-19. Key data points include cases, deaths, and hospitalization utilization rates, by state and day. Daily cases and deaths are well-maintained by the New York Times; daily hospitalization utilization rates are maintained by the Center for Disease Control. This repository contains the code necessary to create the final joined dataset, as well as the final dataset. 

<<<<<<< HEAD
### Prerequisites

Python3 is recommended. If you would like to run the Jupyter notebook, be sure you have [installed Jupyter](https://jupyter.org/install) beforehand. 

## Running the code
=======
### Flow of the project
>>>>>>> db12d3dcdd9bbccb6a89523becf6a3d49e03da04

When you're ready, open your preferred python IDE and navigate to the project directory. Launch jupyter notebook and choose the project name. Everything should run automatically. As an example, from terminal:

```python
> terminal
cd('/.../AllaT_Portfolio_Data_Scientist/COVID19_Data_Interconnection_Project')
jupyter notebook
Data_interchange_project_.ipynb

<<<<<<< HEAD
```

## Expected Output

The code generates the combined dataset and downloads it under the name 'final_covid.csv'
=======
Read-in data, show the data, EDA, map, compare rows, merging, NYT column names change, final merge, saving file in different formats, data update. To make it easier to see the flow of the project I showed it on the graph below. As we can see there are a few steps to get to the final result. In the beginning I import all datasets into pandas and run quick exploration like length, missing values and duplicates and overall look of the data, then I start working on cleaning it. In my case I remap the state column names to make them match in all of the data sets and change the key column names to merge the data. Then I merge 3 healthdata datasets first, and in the end I merge NYT data with the healthdata. When it's done, I check if everything looks right and export the data into different file formats. 
>>>>>>> db12d3dcdd9bbccb6a89523becf6a3d49e03da04

## Built With

* [Python 3.0](https://www.python.org/download/releases/3.0/) 
* [Jupyter Notebook 6.2.0](https://jupyter.org/)

## Authors

* **Alla Topp** - [AATopp](https://github.com/AATopp)

<img src="https://avatars.githubusercontent.com/u/59368945?s=400&v=4" alt="some title" style="zoom:30%; margin-left: 10px;" />

<<<<<<< HEAD
=======
Healtdata.gov datasets:

There are three different datasets (all are estimates with lower and upper confidence intervals). These files are representative estimates for each state and are updated weekly:

- estimated inpatient beds occupied by state (timeseries)
- estimated inpatient beds occupied by COVID-19 patients by state (timeseries)
- estimated ICU beds occupied by state (timeseries) 

The COVID-19 data on new daily cases and new daily deaths per state is maintained by the New York Times could be retrieved [here](https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv).

<img src="https://lh5.googleusercontent.com/9HCJvLD4Tl1aecNjNcAvCRJkPY9Y4cJOcXUMgBEgdlTEkWvoXdwbnwtJnzgXTFceaVsXf-3kOxUeYpATQcU7fuxrKrJD1XtlEOQUfskOsjIB7FBCMYSV0SYvRh6blZpDrfl0a2lx" alt="img" style="zoom: 67%;" />

### **Description of process**

**Reading in data**

To work on this project I decided to use Pandas in Jupyter notebook because all the steps could be done using this tool. To read in all 4 datasets I used `pd.read_csv(‘’)` that opened csv data from those websites directly. 

**Cleaning**

To make sure that data is in the data frame to work with, I show it with `df.head()` and `df.tail()`. Now some data exploration and cleaning can be done. During this step I noticed a couple things. First, all data sets have different numbers of rows and all of them have two key columns: date and state that will be used to merge all the datasets. Second, the column state has name mismatch. New York Times dataset has full state name and healthdata datasets have abbreviated state names. In order to move datasets together we need those two columns exactly the same to set key columns. To accomplish the task I decided to go with `map()` function in Python. To remap the dataframe to translate US states to two letter code we need a dictionary with all the US states as key:value. See below. 

<img src="https://lh5.googleusercontent.com/TK6PtYEo5D2ekxTDIrW4N295YHxzxSsSe5Ec8mhlvjPWPyvxSkI3hyRUYCti-0_2hhgy6i5dexYOX7I3JXJrv0wKwod9zFnGyP9bCQHp6r5ThMxYq6giYbDtus0z89rjBI0p3P1H" alt="img" style="zoom:50%;" />

<img src="https://lh6.googleusercontent.com/uU-GlbVZMfzNPcrmJ8zMuqVG_8ytsoPcJnr1eaYQ9Ni7Nahc-2nnxD-sVhU3Bk5ioMMaVhKYhRNA5e9QKPcBvKuy1rmO923r04enIaQqxrOxUkoSpRXBPdNTZq99r7eV9STApNdH" alt="img" style="zoom: 50%;" />

**Matching**

To merge data I used `pd.merge()` on state and date. I merged the 3 health datasets first because the column names are identical. After that, I merged the NYT dataset and changed the column name ‘collection_date’ to ‘date’ as the rest of the data sets. 

**Final output**

The final output turned out to be merged only with matching rows from all 4 dataset without missing and duplicate values. The idea behind the final output is to have a data set of updated COVID-19 cases, deaths and numbers of occupied beds in hospitals by date and state. In the final data set there are 32 columns with all the information needed to use to track the cases and ratio of how many hospital beds are used and how many there are available. 

![img](https://lh5.googleusercontent.com/vyCL405dCw87Nfn-QfRiNfu8wk8-7ZUNlGH5xw4MkdQF_dn8pPdjSCkaTLZeJwOuE6OUXsKgl6R147s4YfdjBqLG3j4FllqKyVRPZ4bk1s21_JZfqtSynqToEmkVf6JVnzuLU-iA)

### Conclusion
>>>>>>> db12d3dcdd9bbccb6a89523becf6a3d49e03da04
