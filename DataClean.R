# Initial data cleaning


#The parking data was a very large file so the data was cleaned and saved as a new csv file that is now stored in my repository.

#Cleaning Data

noInsp_vector <- c("EXPIRED INSPECTION STICKER (ALL)", "NO INSPECTIONS STICKER (ALL)")

noInsp <- parking %>% filter(VIOLATION.DESCRIPTION %in% noInsp_vector) %>% 
  separate(SUMMONS.DATE, c("MONTH", "DAY", "YEAR"), sep = "/")

noInsp_Clean <- noInsp[!(is.na(noInsp$LATITUDE) | noInsp$LATITUDE == ""),]


noInsp_Clean$MONTH <- as.numeric(as.character(noInsp_Clean$MONTH))

hist(noInsp_Clean$MONTH)

write.csv(noInsp_Clean, "noInsp_Clean.csv")
