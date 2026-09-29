# AWS Assignment 4 — Serverless API with Lambda, IAM & API Gateway

## What I Built

A serverless REST API using:

* **Amazon DynamoDB** — stores student submissions
* **AWS Lambda** — processes requests and writes data to DynamoDB
* **IAM** — controls Lambda permissions using least privilege
* **API Gateway** — provides the REST API endpoint
* **CloudWatch** — captures Lambda execution logs

## Architecture

```text
Client
  ↓
API Gateway
  ↓
POST /submit
  ↓
Lambda
  ↓
DynamoDB
  ↓
CloudWatch Logs
```

## DynamoDB

Created a table called `students` with:

* Partition key: `id`
* Type: String
* On-demand capacity

Each submission stores:

```text
id
timestamp
payload
```

## Lambda

Created a Python Lambda function called `students-submit`.

The function:

1. Receives the API request
2. Parses the JSON payload
3. Generates a UUID
4. Adds a UTC timestamp
5. Stores the data in DynamoDB
6. Returns a JSON response

Example response:

```json
{
  "message": "Student submitted successfully",
  "id": "generated-uuid"
}
```

## IAM

Configured the Lambda execution role using least-privilege permissions.

The custom policy allows:

```text
dynamodb:PutItem
```

on the `students` table rather than granting broad AWS permissions.

Basic Lambda logging permissions were also enabled for CloudWatch.

## API Gateway

Created a REST API called `students-api`.

Configured:

```text
POST /submit
```

with Lambda proxy integration connected to `students-submit`.

CORS was also enabled to allow browser-based cross-origin requests.

The API was deployed to the:

```text
prod
```

stage.

## Testing

Tested the API using `curl` from the terminal:

```bash
curl -X POST "https://<api-id>.execute-api.us-east-1.amazonaws.com/prod/submit" \
  -H "Content-Type: application/json" \
  -d '{"name":"Mo","module":"AWS"}'
```

The API returned a successful response containing a generated UUID.

The resulting item was then verified in DynamoDB.

## CloudWatch

Verified that Lambda executions were being recorded in:

```text
/aws/lambda/students-submit
```

CloudWatch logs confirmed the API request reached and executed the Lambda function successfully.

## What I Learned

* How DynamoDB stores data without managing database servers
* How Lambda runs code without managing servers
* How API Gateway exposes Lambda through HTTP
* How IAM controls AWS permissions
* How least-privilege permissions improve security
* How CORS works with APIs
* How API Gateway stages work
* How to test a REST API using `curl`
* How CloudWatch provides Lambda execution logs
* How these AWS services work together in a serverless architecture

## Screenshots

1. `01-dynamodb-table.png`
2. `02-dynamodb-item.png`
3. `03-lambda-function.png`
4. `04-iam-permissions.png`
5. `05-api-gateway-post.png`
6. `06-api-gateway-stage.png`
7. `07-cloudwatch-logs.png`
8. `08-api-curl-test.png`

## Result

Successfully built and tested a serverless REST API using:

**API Gateway → Lambda → DynamoDB**

with IAM permissions and CloudWatch logging configured.
