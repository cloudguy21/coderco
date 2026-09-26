# Networking Assignment

## Overview

Built a basic web server setup on AWS to practise networking, DNS, and HTTP.

## What I Built

* Amazon EC2 instance running Amazon Linux 2023
* NGINX web server
* Security Group allowing SSH (22) and HTTP (80)
* Route 53 hosted zone
* DNS A record pointing the domain to the EC2 public IP

```text
Domain → Route 53 → EC2 → NGINX → Browser
```

## DNS

The domain was connected to Route 53 and configured with an A record pointing to the EC2 instance.

I also troubleshot a DNS resolution issue caused by incorrect nameserver delegation and local DNS resolution.

## What I Learned

* How DNS connects domain names to IP addresses
* How Security Groups control inbound traffic
* How HTTP traffic reaches a web server
* How EC2 and NGINX work together
* Basic DNS troubleshooting using `dig`

## Result

The domain successfully loads the NGINX welcome page from the EC2 instance.

## Screenshots

Screenshots of the completed setup are stored in:

```text
screenshots/
```
