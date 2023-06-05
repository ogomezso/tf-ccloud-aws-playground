# Confluent Cloud on AWS Terraform Playground

This repository compile different possible scenarios to automatically deploy Confluent Cloud Cluster on AWS

# Scenarios

## Basic

Deploy a Confluent Cloud Cluster on a existing environment and Network (if needed)

[Example's Documentation](./basic/README.md)

## Dedicated, Self Manage Encrypted cluster over AWS Transit Gateway

This scenario deploys all the resources needed -including Confluent Environment and AWS ones- for a *Dedicated* and *Self-Encrypted* (using BYOK Feature) Confluent Cloud Cluster over AWS Transit gateway.

[Example's Documentation](./tgw-byok-dedicated/README.md)


> NOTE: All the modules describe here has to be taken a example on the how to, there are not maintained or supported.
> Feel free to fork it and modify as you need
