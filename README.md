# com.klangsoft.flexiblejobs

## Flexible Jobs

This ia a CiviCRM extension that adds much needed flexibility to scheduled jobs. It accomplishes this goal in two ways...

- By adding *Yearly*, *Quarterly*, *Monthly*, and *Weekly* run frequencies to the exiting options of *Daily*, *Hourly*, and *Always*.
- A field is added to the *Add/Edit Scheduled Job* form that allows a specific date/time to be supplied for the first/next run of the scheduled job.

Between these two options, you can have your scheduled jobs running virtually any time you want.

**A warning on Monthly**: The *Monthly* run frequency works by adding the number of days in the month of the last run. This lands on the same day of the following month except when the following month has fewer days. For example, a monthly job that last ran on January 30th would next run on March 2nd, and then on the 2nd of every month thereafter. To avoid this issue, schedule monthly jobs to run within the first 28 days of the month.

**A note on uninstalling this extension**: Any jobs configured to use the new run frequencies listed above will be disabled, and will need to be reconfigured using a standard option.

