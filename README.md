# DPG

In order to run the project, please follow the instructions below.
The project should be run on a Linux machine.

### Prerequisites

Linux <br>
Chrome (versions higher than 66)

## Ruby and Cucumber Setup
In order to install everything that we need to run cucumber projects please, follow the instructions on the link [Ruby Setup](https://github.com/rvm/ubuntu_rvm)

Once you have done all the procedures from the link above you should download the repository
and run the following commands:

```
gem install bundler

```
```
cd DPG

```
```
bundle install 

```

## Project Folders
cucumber_report: you will find the html cucumber report generated. <br />
report_builder: you will find the file reponsible for generating the cucumber report. <br />
screenshots: you will find the screenshots generated each time you run the scenarios. <br />
features: you will find the feature files. <br />
features/page_objects: you will find the page objects of the project. <br />
features/step_definitions: you will find the step definitions file. <br />
features/support: you will find the project setup file. <br />


## Running with Cucumber report
In order to run this project with cucumber reports you should run the following commands:

```
cucumber  --format pretty --expand --format json -o "report_builder/report.json"

```
The command above will run all the scenarios.

Then run the following command:

```
ruby report_builder/report_builder.rb

```

The command above will generate the reports in the file cucumber_report/cucumber_web_report.html

## Cucumber Scenarios

In order to run the scenarios on the project you could use the commands below:

```
cucumber --tags @login

```
If you run the command above you will run the login scenario

```
cucumber --tags @search_article

```
If you run the command above you will run the search scenario

```
cucumber --tags @search_tiles

```
If you run the command above you will the scenario responsible for navigating on the search tiles
