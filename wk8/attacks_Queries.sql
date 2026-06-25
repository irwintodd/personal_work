
###/ 6. Exploratory Query Analysis:


#/ Identification of minimum/maximum values

Select Country, ROUND(Max(Age),0) as Max_Age
from Incident_Data
where Incident_Data."Fatal (Y/N)" = 'Y' and Age is not null <> 0
Group by Country



#/ Top 10 fatal incidents by country with average age

Select Country, count() as Incidents, ROUND(AVG(Age),0) as AVG_Age
from Incident_Data
where Incident_Data."Fatal (Y/N)" = 'Y' and Age is not null
Group by Country
Order by Incidents DESC
Limit 10
;



#/ Date-based filtering and analysis

Select distinct Year, count(*) as Number_of_Incidents
from Incident_Data
Where Year <> 0
Group by Year
Order by Year DESC
;

#/ Top 10 results where "white" appears in the species descripton.

Select distinct Country, count(*) as Number_of_Incidents
from Incident_Data
Where Country <> 0 and Species like '%white%'
Group by Country
order by Number_of_Incidents DESC
limit 10
;


#/ Top 10 results where "tiger" appears in the species descripton.

Select distinct Country, count(*) as Number_of_Incidents
from Incident_Data
Where Country <> 0 and Species like '%tiger%'
Group by Country
order by Number_of_Incidents DESC
limit 10
;

#/ Top 10 results by activity group and country with total count of incidents.


Select Country, "Activity Group", count() as Incidents, ROUND(AVG(Age),0) as AVG_Age
from Incident_Data
where Incident_Data."Fatal (Y/N)" = 'Y' and Age is not null and Country is not Null
Group by Country
Order by Incidents DESC
Limit 10
;

###/ 7. Business Query Analysis: Exploratory


#/ Top 5 year result for number of incidents and location

Select distinct Country, Year, count(*) as Number_of_Incidents
from Incident_Data
Where Year <> 0
Group by Year 
Order by Number_of_Incidents DESC
Limit 5
;

#/ Top 10 results by activity group, sex and country with total count of fatal incidents.

Select Country, Sex, "Activity Group", count() as Incidents, ROUND(AVG(Age),0) as AVG_Age
from Incident_Data
where Incident_Data."Fatal (Y/N)" = 'Y' and Age is not null and Country is not Null
Group by Country, Sex
Order by Incidents DESC
Limit 10
;

#/ Top 10 results by country and year by total count of fatal incidents.

Select distinct Country, Year, count(*) as Number_of_Incidents, RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking_order
from Incident_Data
Where Year <> 0 and Incident_Data."Fatal (Y/N)" = 'Y' and Age is not null and Country is not Null
Group by Year 
Order by Number_of_Incidents DESC
Limit 10
;

#/ Top 10 results by country and year by total count of non-fatal incidents.

Select distinct Country, Year, count(*) as Number_of_Incidents, RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking_order
from Incident_Data
Where Year <> 0 and Incident_Data."Fatal (Y/N)" = 'N'
Group by Year 
Order by Number_of_Incidents DESC
Limit 10

#/ Top 10 results by country, type and year by total count of fatal incidents.

Select Country, Sex, Type, "Activity Group", count() as Incidents, ROUND(AVG(Age),0) as AVG_Age
from Incident_Data
where Incident_Data."Fatal (Y/N)" = 'Y' and Age is not null and Country is not Null
Group by Country, Sex
Order by Incidents DESC
Limit 10
;