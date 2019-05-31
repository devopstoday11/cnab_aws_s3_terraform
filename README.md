# CNAB : Bundle AWS S3 Bucket

The aim of this project is to manage AWS S3 bucket thanks to Terraform with CNAB best practices.

## Getting Started

These instructions will get you a copy of the project up and running on your AWS subscription for development and testing purposes.

### Prerequisites

What things you need to run this CNAB bundle :

*   [Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/) must be installed on your computer
*   [Duffle](https://github.com/deislabs/duffle) must be installed on your computer

#### Duffle initialization

Start by setting the default confiugration of Duffle by running this command :

```bash
$ duffle init
```

To be able to manage the Terraform plan, the tfstate is automatically backuped in a S3 bucket created by the AWS CLI before the Terraform plan begin.

To do so, Duffle has to be configured with credentials. By default, Duffle creates a default folder at ~/.duffle/credentials.

Copy/ paste the following data to that file : ~/.duffle/credentials/poc.yaml

```yaml
name: poc
credentials:
  - name: access_key_id
    source:
      env: AWS_ACCESS_KEY
  - name: secret_key_id
    source:
      env: AWS_SECRET_KEY
```

This allow Duffle to get the AWS cli login from environment variables :

```bash
export AWS_ACCESS_KEY=YOUR_AWS_ACCESS_KEY
export AWS_SECRET_KEY=YOUR_AWS_SECRET_KEY
```

### Usage

A good point with CNAB is that you can create, update and destroy all architecture easily with some commands.

Be aware that you need to be in the CNAB directory to be able to run the commands.

#### Install

To deploy the CNAB bundle on AWS, just run this commands :

```bash
$ duffle build
$ duffle install --credentials=poc --parameters=./parameters.toml aws_s3_bucket aws_s3_bucket:0.1.0
```

If everything run has expected, you should be have a two new AWS S3 bucket, the desired bucket defined in the parameter.toml file and  the Terraform backend bucket with the tfstate.

#### Destroy

To destroy the CNAB bundle on AWS, just run this commands :

```bash
$ duffle uninstall --credentials=poc --parameters=./parameters.toml aws_s3_bucket
```

## Author

Member of Wikitops : https://www.wikitops.io/

## Licence

This project is licensed under the Apache License, Version 2.0. For the full text of the license, see the LICENSE file.
