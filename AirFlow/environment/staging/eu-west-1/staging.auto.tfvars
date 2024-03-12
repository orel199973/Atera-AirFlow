# Global Vars
# ----------------
environment = "staging"
project  = "airflow"
location = "eu-west-1"
# company     = "atera"


# VPCs
# -----------------
vpc = {
  vpc = {
    cidr_block = "10.0.0.0/16"
    # enable_dns_support = true
    # enable_dns_hostnames = true

  }
}


# Subnets
# -----------------
subnet = {
  public-subnet-1a = {
    cidr_block              = "10.0.0.0/20"
    availability_zone       = "eu-west-1a"
    map_public_ip_on_launch = true
  }
  public-subnet-1b = {
    cidr_block              = "10.0.16.0/20"
    availability_zone       = "eu-west-1b"
    map_public_ip_on_launch = true
  }
  private-subnet-1a = {
    cidr_block              = "10.0.128.0/20"
    availability_zone       = "eu-west-1a"
    map_public_ip_on_launch = false
  }
  private-subnet-1b = {
    cidr_block              = "10.0.144.0/20"
    availability_zone       = "eu-west-1b"
    map_public_ip_on_launch = false
  }
}


# Internet Gateway
# -----------------
internet_gateway = {
  ig = {

  }
}


# Elastic IP
# -----------------
elastic_ip = {
  eip-natgw = {
    vpc = true

  }
}


# nat_gateway
# -----------------
nat_gateway = {
  natgw = {

  }
}


# #  Route Table
# # ---------------
public_route_table = {
  public-route-table = {

  }
}

private1_route_table = {
  private1-route-table = {

  }
}


private2_route_table = {
  private2-route-table = {

  }
}


# #  Route
# # -------
public_route = {
  public-route = {
    destination_cidr_block = "0.0.0.0/0"
  }
}
private_route1 = {
  private-route1 = {
    destination_cidr_block = "0.0.0.0/0"
  }
}
private_route2 = {
  private-route2 = {
    destination_cidr_block = "0.0.0.0/0"
  }
}

private1_route_s3_endpoint = {
  private1-route-s3-endpoint = {
    destination_cidr_block = "0.0.0.0/0"
  }
}

private2_route_s3_endpoint = {
  private2-route-s3-endpoint = {
    destination_cidr_block = "0.0.0.0/0"
  }
}


# Security Groups
# -----------------
security_group1 = {
  security-group1 = {
    ingress = [{}]
    egress = [{
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }]
  }
}

security_group2 = {
  security-group2 = {
    ingress = [{}]
    egress = [{
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }]
  }
}


# S3 Bucket
# -----------------
s3 = {
  s3 = {

  }
}


# VPC Endpoint
# -----------------
vpc_endpoint = {
  vpc-endpoint = {
    service_name      = "com.amazonaws.eu-west-1.s3"
    vpc_endpoint_type = "Gateway"
    # private_dns_enabled = true
  }
}


# MWAA Environment
# -----------------
mwaa_environment = {
  mwaa-poc = {
    dag_s3_path           = "dags/"
    environment_class     = "mw1.medium"
    max_workers           = 5
    min_workers           = 2
    requirements_s3_path  = "requirements.txt"
    webserver_access_mode = "PUBLIC_ONLY"
    network_configuration = [{
    }]
    logging_configuration = [{
    }]
    dag_processing_logs = [{
      enabled   = true
      log_level = "WARNING"
    }]
    scheduler_logs = [{
      enabled   = true
      log_level = "INFO"
    }]
    task_logs = [{
      enabled   = true
      log_level = "INFO"
    }]
    webserver_logs = [{
      enabled   = true
      log_level = "WARNING"
    }]
    worker_logs = [{
      enabled   = true
      log_level = "INFO"
    }]
  }
}
