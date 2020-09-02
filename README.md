# Assignment

## Workflow

### Infrastructure provisioning with Terraform  

```bash
cd tf-aws-instance
terraform init
terraform plan
terraform apply
terraform destroy
terraform state list
```

### Mediawiki Setup with Ansible playbook  

#### Prerequisites  

SSH keys deploy for list of the servers from inventory  

```bash
ansible-playbook -i inventory ssh_deploy.yml
ansible-playbook -i inventory mediawiki.yml --syntax-check
ansible-playbook -i inventory mediawiki.yml
```

#### Ansible Playbook Execution Output Log: Refer [ansible_playbook_workflow](ansible_playbook_workflow.log)  

## Points

- Blue-Green Deployment
  - As Terraform is built with Stateful architecture, we can define strategies/policies based on the requirement which revolves around Automation of Terraform operations and any configuration management tools like Chef/Puppet/Ansible etc.  
  - Also, This can be achieved with Cloud Formation templates (deploying new stacks and gradually discarding old stacks) along with the integration of CloudWatch alerting  
  - For containers based approach - need to implement Stacks from Docker Swarm or services and Deployments (ReplicaSet) from K8S  

- Application Scaling
  - While Defining Application scaling strategies, need to consider below points:
    - Agility
    - Load Balancing (IP/Routing/Nodes based etc.)
    - High Availability  (Multizone/DC/Region etc. )
    - Backup and Restore - DR (Hot/Cold Data, Data retention strategies etc.)
    - Failover (Availability Zones/MTTR-MTTF etc.)
    - Updates and Rollbacks
    - Content Delivery across client locations  
    - Applying Configuration changes (Version, Repo, URL/Links etc.)  
