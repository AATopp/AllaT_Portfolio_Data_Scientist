# Data Science Practicum I, II

A repository for the Regis University Data Science Cloud Project to prepare documentations for Regis University students in Data Science and Data Engineering classes.

___

![alt text](https://github.com/AATopp/CloudDS/blob/master/RU.PNG "Regis logo project")

___

## Project Summary 

- DS-Cloud Project is an ongoing project where different students participate every semester,
- It has its own GitHub page where all the ongoing documentation is collected,
- Documentation is needed to provide the instructions for the students in Data Science classes and students who will join the project in the future for further development,
- My tasks included to work with PostgreSQL database and Yelp data in an Ubuntu Virtual Machine on Cloud Stack. Most of my work was done in a Linux terminal and Jupyter Hub, 
- My role was to help with collecting data to determine performance to further decide what hardware to purchase to create a lab environment for future data science classes. 


## Description of Data 

   We work with Yelp data set in this project that was downloaded from the website: https://www.yelp.com/dataset
   This dataset is a subset of Yelp's businesses, reviews, and user data. 

## Project Process:
-	Install Global Protect and CloudStack environment 
-	Exploring CloudStack and creating/destroying instances 
-	Installing Ubuntu 18.04 and Windows 10 virtual machines 
-	Installing WinSCP and PuTTY 
-	Creating tin0,tin1,tin2 user with sudo privileges 
-	Converting yelp data fils from JSON to CSV/ moving files using WinSCP 
-	Installing PostgreSQL and MongoDB databases in Linux 
-	Creating tables in psql and importing data into the tables/ importing data into mongoDB
-	Data cleaning (file user.csv (5GB) to import into psql)
-	Creating instance from ISO and creating template (Ubuntu 18.04) in CloudStack 
-	Repeating PostgreSQL and MongoDB databases processes in CS VM for documentation
-	Moving files from local VM to CloudStack VM using private network with tin0 account using WinSCP and PuTTY
-	Document everything for future students` use in data science and data engineering classes at Regis University 
-  Backup and Restore yelpdb database from postgreSQL
-  Log in to Jupiter Lab on cobalt and connect to the VM yelpdb database
-  Developing multi-process code to use with all 5 queries 
-  Recording average time for 1, 10, 50, 100 processes for every query
-  Create new virtual machine with new settings (8 GB RAM, 4 CPU, 40 GB hard drive)
-  Document multi-processing time for the new VM
-  Document the process for both VMs 
-  Create data visualization for multi-processing with 2 different VMs 




## Visualization

Query 1:
![alt text](https://github.com/AATopp/CloudDS/blob/master/Comparison%20Query%201.PNG "Query 1")


Query 2:
![alt text](https://github.com/AATopp/CloudDS/blob/master/Comparison%20Query%202.PNG "Query 2")


Query 3:
![alt text](https://github.com/AATopp/CloudDS/blob/master/Comparison%20Query%203.PNG "Query 3")


Query 4:
![alt text](https://github.com/AATopp/CloudDS/blob/master/Comparison%20Query%204.PNG "Query 4")


Query 5:
![alt text](https://github.com/AATopp/CloudDS/blob/master/Comparison%20Query%205.PNG "Query 5")




## Results/Conclusion

   1. VM with 8GB of RAM showed a much better performance overall than the VM with 4GB of RAM based on run time 
   2. 40GB of hard drive on both VMs did not allow them to run over 5 processes (users) at the same time because PostgreSQL uses temporary space on hard drive running queries with JOINs
   3. It takes over 500GB of hard drive to run queries 4 & 5 to test 10, 20, 50 and 100 users working at the same time 
   4. VM with 8GB of RAM showed a great performance and could be considered to be optimal specification for the lab environment 
   5. Impossible to have over 3 students (users) or more running queries like 4 and 5 (with joins) at the same time in the VM with such specs because of current server limitations
   6. The more memory (RAM) a VM has, the better the run time will show when running large queries 
   7. The results of the project support a decision for hardware purchase to create the lab environment for the Data Science classes at Regis University 
   8. Based on all the processes documented the next students in the project will have a starting point to continue the next steps with minimal training  

