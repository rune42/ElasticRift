# ElasticRift

ElasticRift is a capstone _Proof-of-Concept_ that consists on a Terraform-based, AWS-centric CI/CD deployment that will analyze and dissect the impact of the [CVE-2026-42945](https://nvd.nist.gov/vuln/detail/cve-2026-42945) vulnerability and others associated to it, which will be collectively referred to as **NGINX Rift** from now on.

It will contain a set of nodes both managed and unmanaged that will perform different functions and make this environment operationally simple and yet as close enough to a well-architected production-grade infrastructure as it can get. An initial topology consists of the following:

1. **Perimeter Defense:** AWS WAFv2 Web ACL strictly inspecting URI paths and anomalous HTTP headers to detect NGINX Rift payloads at the Application Load Balancer level.
2. **Compute Isolation:** An AWS ECS Cluster (EC2 Launch Type) running a vulnerable containerized NGINX instance (`vulhub/nginx-rift:latest`) inside a private subnet. Containers will be deliberately provisioned with `SYS_ADMIN` capabilities to simulate host-escape dynamics as part of the threat model.
3. **Telemetry & Guardrails:** VPC Flow Logs and container stdout centralized in Amazon CloudWatch to map indicators of compromise (IoC) during execution. _May be replaced with Wazuh or ELK for non-AWS environments._

Project Status and Development Roadmap
--------------------------------------

**Status:** Design phase; infrastructure untested.

ElasticRift is a Terraform-based AWS security research PoC targeting a controlled NGINX vulnerability-reproduction environment and postmortem forensic analysis.

### Architecture Decisions

*   AWS region: Frankfurt (eu-central-1).
*   Infrastructure management: Terraform.
*   CI/CD: self-hosted GitLab on EC2, installed with Docker Compose.
*   Application platform: ECS using EC2 capacity.
*   Networking: one VPC, public edge infrastructure, and private application workloads.
*   Security: restricted ingress, least-privilege IAM, WAF, and workload isolation.
*   Observability: CloudWatch, VPC Flow Logs, deployment metadata, and retained forensic evidence.

### Current Limitations

Due to financial constraints, no AWS infrastructure has been deployed or tested. The current Terraform configuration is a draft and must undergo static review, validation, and integration testing when resources become available.

The proposed CVE identifier and vulnerable image must be independently verified before implementation.

### Milestones

1.  Complete and review the network module.
2.  Define GitLab host and Runner infrastructure.
3.  Implement ECS cluster and service modules.
4.  Define edge security and telemetry.
5.  Draft and review GitLab CI/CD pipelines.
6.  Verify the vulnerability and finalize the controlled test plan.
7.  Deploy, validate, capture evidence, and test teardown when funding permits.
    
Live deployment and vulnerability testing are explicitly deferred until the necessary funding and validation environment are available.


---
**This repository is for educational and authorized security auditing purposes only. All testing should be conducted in isolated, self-hosted, or explicitly permitted environments. The author assumes no liability for misuse.**

**Unless otherwise indicated at the root NOTICE file, all the information submitted to this repository is protected under a MIT educational license and is free to consult, copy, distribute and transform with no permission nor attribution required.**

_If you gaze unto the Rift, the Rift gazes back unto you._
