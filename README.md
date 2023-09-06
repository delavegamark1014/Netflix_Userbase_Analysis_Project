# Netflix Userbase Analysis Project

## Introduction

Welcome to the Netflix Userbase Data Analysis Project repository! This project focuses on analyzing a sample Netflix userbase dataset using PostgreSQL and PGadmin4, as well as a Tableau visualization. The primary goal is to extract valuable insights related to user demographics, subscription plans, device usage, and revenue from subscription plans.

## Database Schema

The dataset is stored in a PostgreSQL database with a "Userbase" table. Key columns include `user_id`, `gender`, `subscription_type`, `device`, `join_date`, `last_payment_date`, `age`, and `country`.

## Tableau Visualizations

In addition to SQL analysis, this project incorporates Tableau visualizations that provide interactive and informative representations of the data. The following Tableau sheets are available as well as the complete dashboard:

- **Sign-Ups**: Visualizes the distribution of user sign-ups across different months.

- **Subscription Distribution**: Analyzes the distribution of subscription plans by country.

- **Revenue from Subscriptions**: Presents revenue generated from different subscription plans.

- **Membership Days**: Provides insights into membership duration based on subscription plans.

To explore the Tableau visualizations, visit the following link: https://public.tableau.com/views/NetflixUserbaseInsightsTrendsRevenueAnalysis/NetflixUserbaseDashboard?:language=en-US&:display_count=n&:origin=viz_share_link

## Getting Started

To use this project for your own data analysis, follow these steps:

1. **Install PostgreSQL**: Make sure you have PostgreSQL and pgAdmin4 installed on your system.

2. **Create Database and Load Data**: Create a database and load the userbase data into the `Netflix_Userbase` table.

3. **Execute SQL Queries**: Open and execute the SQL queries provided in `NetflixUserbase.sql` using a PostgreSQL client like pgAdmin.

4. **Explore Results**: Explore the interactive visualizations in Tableau to gain insights from the Netflix Userbase data. Here is the link to the Tableau visualization again.
https://public.tableau.com/views/NetflixUserbaseInsightsTrendsRevenueAnalysis/NetflixUserbaseDashboard?:language=en-US&:display_count=n&:origin=viz_share_link

## Contributing

Contributions to this project are welcome. If you have improvements or additional analyses to add, feel free to fork this repository and submit a pull request.
