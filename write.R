# Read the CSV file
csvfile <- read.csv("three.csv", header = TRUE)

# Connect to my oracle database
library(RODBC)
channel <- odbcConnect("ORCL", uid="hr", pwd = "hr", believeNRows = FALSE)

# Checking the status of my connection
odbcGetInfo(channel)

# SQL query to create a similarly structured table as that of the CSV file
sqlQuery(channel, "create table file_db (id int, name varchar(100), subject varchar(100), score int, year int, role varchar(100))")

# Insert contents of csv file into the newly created table in my oracle database
sqlSave(channel, csvfile, tablename = "file_db", rownames = FALSE, append = TRUE)

# Disconnect
odbcClose(channel)
