# AWS Assignment 2 — Application Load Balancer

## Overview

The goal of this assignment was to deploy an application behind an
Application Load Balancer and configure Auto Scaling.

The infrastructure was built using AWS ClickOps.

## VPC and Networking

* Used the existing `VPC-Test` VPC.
* Created a second public subnet for the assignment.
* Used two Availability Zones:

  * `us-east-1a`
  * `us-east-1b`
* Both subnets use the public route table.
* The route table sends internet traffic through the Internet Gateway.

## EC2 Instances

Created two EC2 instances:

* `EC2_Public_1`
* `EC2_Public_2`

The instances were placed in different Availability Zones.

Apache was installed and configured on both instances.

Each instance was given different content so that traffic
could be identified when testing the load balancer.

## Application Load Balancer

Created an internet-facing Application Load Balancer:

`Test-alb`

The ALB was placed across both public subnets.

Configured listeners for:

* HTTP port `80`
* HTTPS port `443`

## Target Group

Created the target group:

`Test-tg`

Configuration:

* Target type: Instance
* Protocol: HTTP
* Port: `80`
* Health check path: `/`

Both EC2 instances were registered with the target group.

The targets were verified as healthy.

## Security Groups

Created an ALB security group allowing:

* HTTP from the internet
* HTTPS from the internet

The EC2 security group allows:

* HTTP only from the ALB security group
* SSH only from my IP
* Outbound traffic

This prevents direct HTTP access to the EC2 instances.

## Route 53

Created a Route 53 DNS record:

`alb.legendarymovesclothing.com`

The record points to the Application Load Balancer.

## HTTPS

Created an ACM certificate for:

`alb.legendarymovesclothing.com`

The certificate was validated using DNS validation.

The certificate was attached to the ALB HTTPS listener.

HTTPS access was successfully tested.

## Auto Scaling

Added an Auto Scaling Group as a bonus.

ASG name:

`Test-ASG`

Configuration:

* Minimum: `2`
* Desired: `2`
* Maximum: `2`

The ASG uses the two Availability Zones.

A launch template was created to configure the instances.

The launch template installs Apache automatically using user data.

The instances are given public IP addresses so they can
reach the internet during setup.

The EC2 security group still prevents direct HTTP access.

## Testing

Verified that:

* The ALB is reachable.
* Traffic is distributed between instances.
* Target health checks are healthy.
* The custom domain works.
* HTTPS works.
* The Auto Scaling Group maintains two instances.
* ASG instances are running across two Availability Zones.

## Result

The application is successfully running behind an Application
Load Balancer with Route 53, HTTPS, health checks, and Auto Scaling.
