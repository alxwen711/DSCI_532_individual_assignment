# DSCI_524_individual_assignment
Adapted from https://github.com/UBC-MDS/DSCI-532_2026_10_Salescope, written in R

## Setup

**Link to the Main branch Posit deployment: [https://019ceaf9-d6c7-a63a-0469-2771127eccc9.share.connect.posit.cloud](https://019ceaf9-d6c7-a63a-0469-2771127eccc9.share.connect.posit.cloud)**

To run this dashboard locally, clone this repo by running:

```
git clone https://github.com/alxwen711/DSCI_532_individual_assignment.git
```

Then using RStudio, open the `app.R` file in this repository. If there are any 
additional packages that require installing there will be a notification at the 
start of the file which you can use to install them. Alternatively, you can use
`renv::restore()` to setup the environment used for developing this dashboard stored
in the `renv.lock` file. Once the environment is setup, press the `Run App` button
to locally build the dashboard.

## Dataset

The [Sales and Customer Insights](https://www.kaggle.com/datasets/imranalishahh/sales-and-customer-insights) dataset from Kaggle is utilized for this dashboard.

The data set contains 10,000 customer records with purchasing behavior and engagement metrics.

## License

Licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Acknowledgements

This example dashboard was set up from the template guide in [https://docs.posit.co/connect-cloud/how-to/r/shiny-r.html](https://docs.posit.co/connect-cloud/how-to/r/shiny-r.html).