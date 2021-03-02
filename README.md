# digital-form-builder ACP deployment pipeline
Report for ACP deployments of Digital Form. The pipeline supports deployment of two service

Designer - For designers of the form to design forms

Runner - For previewing the form being built and Running the form

## Current configuration

| Environment        | Namespace           | Designer URL  | Runner URL  |
| ------------- |:-------------:| :-------------------------------:| :-------------------------------:|
| Development     | stp-forms-dev | [designer dev](designer.dev.stp-forms-notprod.homeoffice.gov.uk) | [runner-preview dev](runner-preview.dev.stp-forms-notprod.homeoffice.gov.uk) |
| Test     | stp-forms-test     | [designer test](designer.test.stp-forms-notprod.homeoffice.gov.uk) | [runner-preview test](runner-preview.test.stp-forms-notprod.homeoffice.gov.uk) |
| Preprod | stp-forms-preprod     | [designer prepod](designer.preprod.stp-forms-notprod.homeoffice.gov.uk) | [runner-preview prepod](runner-preview.preprod.stp-forms-notprod.homeoffice.gov.uk) |


## How to use
The pipeline is currently invoked automatically by [digital-form-builder-acp](https://github.com/UKHomeOffice/digital-form-builder-acp) to trigger a dev deployment

For manual deployments Drone promotion can be use.

Pipeline supports two arguments to control the tags for Designer & Runner

For Designer, you can for example
```drone
DESIGNER_TAG=1.0.1
```


For Runner, you can for example
```drone
RUNNER_TAG=1.0.1
```