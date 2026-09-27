# AWS Assignment 1 - VPC & Networking

## What I Built

I built a custom AWS VPC with a public and private subnet.

The infrastructure includes:

* Custom VPC
* Public and private subnets
* Internet Gateway
* NAT Gateway
* Public and private route tables
* Public EC2 instance
* Private EC2 instance
* Security Groups
* Bastion host using the public EC2
* CloudWatch monitoring and alarm

## Architecture

```text
                    Internet
                       │
                       ▼
              Internet Gateway
                 ▲           │
                 │           ▼
          Public Route    NAT Gateway
          Table              │
                 │            │
                 ▼            ▼
          Public EC2 ─────► Private EC2
          (Bastion)          │
                              │
                         Private Route
                            Table
```

The public EC2 has a public IP and acts as a bastion host.

The private EC2 has no public IP. It can be accessed through the public EC2 and reaches the internet through the NAT Gateway.

## Networking

| Resource       | CIDR / Address  |
| -------------- | --------------- |
| VPC            | `10.0.0.0/16`   |
| Public subnet  | `10.0.1.0/24`   |
| Private subnet | `10.0.2.0/24`   |
| Public EC2     | `10.0.1.122`    |
| Private EC2    | `10.0.2.56`     |
| NAT Gateway    | `107.20.79.107` |

## Security

The public EC2 allows SSH access from my IP address.

The private EC2 does not allow direct internet access or have a public IP. SSH access is restricted to the public EC2 security group.

I used SSH agent forwarding so the private key remained on my local machine instead of being copied to the bastion host.

## Testing

The public EC2 was able to access the internet directly.

The private EC2 accessed the internet through the NAT Gateway:

```text
curl https://checkip.amazonaws.com
→ 107.20.79.107
```

I also successfully connected:

```text
Laptop → Public EC2 → Private EC2
```

## CloudWatch

I created a CloudWatch `CPUUtilization` alarm for the public EC2.

The alarm triggers when CPU utilisation is above 80% for one datapoint within 5 minutes.

## What I Learned

* How VPCs and subnets are structured
* How route tables control network traffic
* The difference between an Internet Gateway and NAT Gateway
* How public and private subnets work
* How Security Groups control inbound traffic
* How to use a bastion host and SSH agent forwarding
* How CloudWatch can monitor EC2 instances and trigger alarms

## Screenshots

Screenshots showing the infrastructure and tests are available in the [`screenshots`](./screenshots/) directory.
