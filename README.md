# Lead Time Prediction for IBP

## SAP Data Intelligence based solution which predicts transport lead times based on observed transport durations writing the results to an IBP key figure

## Requirements: User licenses for and experience with SAP Data Intelligence and SAP Integrated Business Planning

## Download and Installation: 
If not stated otherwise, manual steps are to be done in the SAP Data Intelligence system.
1. Create an OData connection to your IBP system. Copy the example json file from the connections folder
2. Create a Python 3 Custom Operator which writes the key figure values to the IBP system. Copy the script and schema files from the folder python3Operator
3. Create docker files. Copy the files from the dockerfiles folder
4. Create an ML Scenario, for example with the name Lead Time Prediction
5. Within the ML Scenario start the creation of a first Jupyter Notebook. From within Jupyter Labs import the files from folder notebooks
6. Create Piplines

## Known Issues

## How to obtain support
[Create an issue](https://github.com/SAP-samples/<repository-name>/issues) in this repository if you find a bug or have questions about the content.
 
For additional support, [ask a question in SAP Community](https://answers.sap.com/questions/ask.html).

## Contributing
If you wish to contribute code, offer fixes or improvements, please send a pull request. Due to legal reasons, contributors will be asked to accept a DCO when they create the first pull request to this project. This happens in an automated fashion during the submission process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

## License
Copyright (c) 2021 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
