# ElasticRift

ElasticRift is a capstone _Proof-of-Concept_ that consists on a Terraform-based, AWS-centric CI/CD deployment that will analyze and dissect the impact of the [CVE-2026-42945](https://nvd.nist.gov/vuln/detail/cve-2026-42945) vulnerability and others associated to it, which will be collectively referred to as **NGINX Rift** from now on.

It will contain a set of nodes both managed and unmanaged that will perform different functions and make this environment operationally simple and yet as close enough to a well-architected production-grade infrastructure as it can get. An initial topology consists of the following:

1. **Perimeter Defense (`waf.tf`):** AWS WAFv2 Web ACL strictly inspecting URI paths and anomalous HTTP headers to detect NGINX Rift payloads at the Application Load Balancer level.
2. **Compute Isolation (`ecs_cluster.tf` & `ecs_task_nginx.tf`):** An AWS ECS Cluster (EC2 Launch Type) running a vulnerable containerized NGINX instance (`vulhub/nginx-rift:latest`) inside a private subnet. Containers will be deliberately provisioned with `SYS_ADMIN` capabilities to simulate host-escape dynamics as part of the threat model.
3. **Telemetry & Guardrails (`cloudwatch.tf`):** VPC Flow Logs and container stdout centralized in Amazon CloudWatch to map indicators of compromise (IoC) during execution. _May be replaced with Wazuh or ELK for non-AWS environments._

>[!NOTE]
> Due to the present-day financial constraints and other FinOps concerns regarding the AWS Free Tier, the content in this repository **will remain untested** until this situation can be reverted, in which case it will undergo an exhaustive refactoring process that turns it into a live demo.

---
**This repository is for educational and authorized security auditing purposes only. All testing should be conducted in isolated, self-hosted, or explicitly permitted environments. The author assumes no liability for misuse.**

**Unless otherwise indicated at the root NOTICE file, all the information submitted to this repository is protected under a MIT educational license and is free to consult, copy, distribute and transform with no permission nor attribution required.**

_If you gaze unto the Rift, the Rift gazes back unto you._
