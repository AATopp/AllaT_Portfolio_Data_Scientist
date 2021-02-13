**Motivation for the project**

Researchers hoping to utilize publicly available datasets around the virus sars-cov-2 (commonly known by its disease name COVID-19) currently have many options for data points. While the variety of data available provide a wealth of information, a key issue is that data are not located in one central location but rather maintained by a myriad of private and public sources. Data must be wrangled from different locations around the web and joined together before considered suitable for analysis. 
The aim of this interconnection project is to bring together two common data points used by researchers interested in tracking the COVID-19 epidemic: daily cases and deaths, and hospital utilization rates. I first describe how the data were sourced, the interconnection tasks, and finally where to locate the final joined dataset.

### Flow of the project

![img](https://lh3.googleusercontent.com/sJmCDuqM1sCy2OXYlXX-4SRsAmbVEtihRsB6zVMSMWECH0VEngrWvEb4MLuYV5Yzk0uluD8TxIw1TO6ERf_AXclUNUfmBOOjI7ARlIcOGrq9ycseDf_VXwKR1f3__kwF0ncRW2XY)

<u>Fig. 1. Data Interconnection Process</u>



Read-in data, show the data, EDA, map, compare rows, merging, NYT column names change, final merge, saving file in different formats, data update. To make it easier to see the flow of the project I showed it on the graph below. As we can see there are a few steps to get to the final result. In the beginning I import all datasets into pandas and run quick exploration like length, missing values and duplicates and overall look of the data, then I start working on cleaning it. In my case I remap the state column names to make them match in all of the data sets and change the key column names to merge the data. Then I merge 3 healthdata datasets first, and in the end I merge NYT data with the healthdata. When it's done, I check if everything looks right and export the data into different file formats. 

**Description of the datafiles and locations**
In this project I worked with 4 data sets, the first one is a regularly updated COVID-19 data from the New York Times and another 3 were pulled from the Department of Health & Human Services website. You can access the datafiles [here](https://healthdata.gov/dataset/covid-19-estimated-patient-impact-and-hospital-capacity-state).

![img](https://lh5.googleusercontent.com/ZhoRvTZJ08970hK1n2KS2vkek6F33qGInbimh4lF3OF_Llsl0FDUxjC_waT4woNNjW6wURBjSBbBxlfLnmsRlo4uzmNPlJ0Q9yR8xe9w3U4X9Gzql-ukNfvWsfacxWtBxx79h2WS)

Healtdata.gov datasets:

There are three different datasets (all are estimates with lower and upper confidence intervals). These files are representative estimates for each state and are updated weekly:

- estimated inpatient beds occupied by state (timeseries)
- estimated inpatient beds occupied by COVID-19 patients by state (timeseries)
- estimated ICU beds occupied by state (timeseries) 

The COVID-19 data on new daily cases and new daily deaths per state is maintained by the New York Times could be retrieved [here](https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv).

![img](https://lh5.googleusercontent.com/9HCJvLD4Tl1aecNjNcAvCRJkPY9Y4cJOcXUMgBEgdlTEkWvoXdwbnwtJnzgXTFceaVsXf-3kOxUeYpATQcU7fuxrKrJD1XtlEOQUfskOsjIB7FBCMYSV0SYvRh6blZpDrfl0a2lx)

**Description of process**
**Reading in data**

To work on this project I decided to use Pandas in Jupyter notebook because all the steps could be done using this tool. To read in all 4 datasets I used `pd.read_csv(‘’)` that opened csv data from those websites directly. 
**Cleaning**

To make sure that data is in the data frame to work with, I show it with `df.head()` and `df.tail()`. Now some data exploration and cleaning can be done. During this step I noticed a couple things. First, all data sets have different numbers of rows and all of them have two key columns: date and state that will be used to merge all the datasets. Second, the column state has name mismatch. New York Times dataset has full state name and Healthdata datasets have abbreviated state names. In order to move datasets together we need those two columns exactly the same to set key columns. To accomplish the task I decided to go with map() function in Python. To remap the dataframe to translate US states to two letter code we need a dictionary with all the US states as key:value. See below. 

![img](https://lh5.googleusercontent.com/TK6PtYEo5D2ekxTDIrW4N295YHxzxSsSe5Ec8mhlvjPWPyvxSkI3hyRUYCti-0_2hhgy6i5dexYOX7I3JXJrv0wKwod9zFnGyP9bCQHp6r5ThMxYq6giYbDtus0z89rjBI0p3P1H)

![img](https://lh6.googleusercontent.com/uU-GlbVZMfzNPcrmJ8zMuqVG_8ytsoPcJnr1eaYQ9Ni7Nahc-2nnxD-sVhU3Bk5ioMMaVhKYhRNA5e9QKPcBvKuy1rmO923r04enIaQqxrOxUkoSpRXBPdNTZq99r7eV9STApNdH)

**Matching**

To merge data I used `pd.merge()` on state and date. I merged the 3 health datasets first because the column names are identical. After that, I merged the NYT dataset and changed the column name ‘collection_date’ to ‘date’ as the rest of the data sets. 
**Final output**

The final output turned out to be merged only with matching rows from all 4 dataset without missing and duplicate values. The idea behind the final output is to have a data set of updated covid cases, deaths and numbers of occupied beds in hospitals by date and state. In the final data set there are 32 columns with all the information needed to use to track the cases and ratio of how many hospital beds are used and how many there are available. 