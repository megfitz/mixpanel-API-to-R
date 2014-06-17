mixpanel-API-to-R
=================

Import Mixpanel data directly into R or RStudio with this script

You need to have an API Key and API Secret from Mixpanel. This function takes the following arguments:<br>
  key = your API key (from your Mixpanel account details)<br>
  secret = your API secret (from your Mixpanel account details)<br>
  event = the event you want to export data for<br>
  unit = accepts hour/day/week/month<br>
  interval = numeric; the number of units you want<br>
  type = accepts unique/general/average<br>

The function exports a data set to your global R environment with a list for the data legend, series and values.

With feedback and questions, please contact<br>
Meaghan Fitzgerald<br>
meaghan@thetopfloorflat.com<br>
@megfitz
