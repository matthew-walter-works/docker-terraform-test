# docker-terraform-test
This repository contains code for a pre-configured Docker container to build and test Terraform using Terratest.

# Assumptions
1. This module assumes you have Terraform and Terratest code structured in the following way:
   ```
   |
   |--- terraform
   |--- test
   ```
   Where the `terraform` directory contains the Terraform code and the `test` directory contains the Terratest Go code to test the Terraform.
1. The main test function (in a `.go` file in the `test` directory is named `TestTerraform`.
1. When utilizing the AWS Terraform provider, `credentials` and `config` files should be located in the `~/.aws` directory. These will be passed to the Docker container in the run command below.

# How to use docker-terraform-test
1. Install docker locally.
1. From the root of this repo, run `docker build -t terraform-test .`. This will build the docker container.
1. Navigate to the directory containing the Terrafrom an Terratest code directories.
1. Run `docker run --rm -v $PWD:/go/src/mycode -i -t terraform-test`. The container will run the tests provided. See the Terratest documentation (link in the References section below) for further guidance on test strategy and tactics.

   To use this Docker container with the basic sample code provided, either run the container from the `mycode` directory using the command above, or simply omit the `-v` parameter.

   To pass AWS credentials and config (typically stored in `~/.aws`) to the Docker container, simply add `-v ~/.aws:/root/.aws` before the `-i` in the command above.

# References
* Terratest: https://github.com/gruntwork-io/terratest
* Useful article about using Terratest: https://winderresearch.com/how-to-test-terraform-infrastructure-code/#conclusion
