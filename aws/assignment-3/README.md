# AWS Assignment 3 — S3, CloudFront & Route 53

## What I Built

I deployed a static website using AWS:

* **S3** — Hosted the website files.
* **CloudFront** — Provided CDN and HTTPS.
* **ACM** — Provided the SSL/TLS certificate.
* **Route 53** — Connected my custom domain to CloudFront.

### Architecture

```text
User
 ↓ HTTPS
Route 53
 ↓
CloudFront
 ↓ HTTP
S3
```

## What I Learned

* How to host a static website with S3.
* How CloudFront works as a CDN.
* How ACM provides certificates for HTTPS.
* How Route 53 manages DNS.
* What an **origin** is.
* What `/` means as the root path.
* How CloudFront caching works.
* How **invalidation** clears cached content.
* Why CloudFront uses **HTTP** when connecting to an S3 website endpoint.

## Challenges

### CloudFront 504 Error

CloudFront initially returned a 504 error because the S3 website origin needed **HTTP only**.

### Old Website Content

After updating S3, CloudFront still showed the old version. I created an invalidation and configured `index.html` as the **Default root object**.

## Result

Website:

`https://legendarymovesclothing.com`

The core assignment was completed successfully.

