mixpanel-API-to-R
=================

Mixpanel.r
Import Mixpanel data directly into R or RStudio with the mixpanel.r script

You need to have an API Key and API Secret from Mixpanel. This function takes the following arguments:<br>
  key = your API key (from your Mixpanel account details)<br>
  secret = your API secret (from your Mixpanel account details)<br>
  event = the event you want to export data for<br>
  unit = accepts hour/day/week/month<br>
  interval = numeric; the number of units you want<br>
  type = accepts unique/general/average<br>

The function exports a data set to your global R environment with a list for the data legend, series and values.

Mixpanel_cleanup.r
This script will clean up the imported API data and takes the following arguments:<br>
  datasetname = defaults to "dataset", the list created in the Mixpanel.r script<br>
  event = needs to be the same event that you called for in the API call<br>

This function will clean up the data, format the dates properly and return at data frame that has a column for the dates the events were observed and a column for the event occurances.

You can run this and the Mixpanel.r script multiple times to create data frames for multiple events and merge them together.

With feedback and questions, please contact<br>
Meaghan Fitzgerald<br>
meaghan@thetopfloorflat.com<br>
@megfitz
