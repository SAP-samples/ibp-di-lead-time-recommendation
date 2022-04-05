# Lead Time Prediction for Integrated Business Planning for Supply Chain (SAP IBP)

## SAP Data Intelligence based solution that predicts transport lead times based on observed transport durations and writes the results to an IBP key figure

## Requirements: User licenses for and experience with SAP Data Intelligence and SAP Integrated Business Planning

## Download and Installation: 
Unless otherwise stated, please complete the manual steps in the SAP Data Intelligence system.
1. Create an OData connection to your Integrated Business Planning for Supply Chain (SAP IBP) system. As a as reference you may use the example json file from the connections folder
2. Create a Python 3 Custom Operator that writes the key figure values to the SAP IBP system. Copy the script and schema files from the python3Operator folder
3. Create docker files. Copy the files from the dockerfiles folder
4. Create a machine learning (ML) Scenario, for example with the name Lead Time Prediction
5. In the ML scenario create your first Jupyter notebook. In Jupyter Labs, import the files from the notebooks folder inside the dsp folder
6. In the ML scenario create three pipelines, one by one. Inside the modeler define the pipelines by copying the json files from the pipelines folder inside the dsp folder

## Known Issues

## How to obtain support
[Create an issue](https://github.com/SAP-samples/<repository-name>/issues) in this repository if you find a bug or have questions about the content.
 
For additional support, [ask a question in SAP Community](https://answers.sap.com/questions/ask.html).

## Contributing
If you wish to contribute code, offer fixes or improvements, please send a pull request. Due to legal reasons, contributors will be asked to accept a DCO when they create the first pull request to this project. This happens automatically fashion during the submission process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

## License
Copyright (c) 2021 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
