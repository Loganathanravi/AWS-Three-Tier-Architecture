 #  AWS THREE-TIER ARCHITECTURE PROJECT

# GOAL: TO DESIGN AND DEPLOY A SCALABLE AND HIGHLY AVAILABLE THREE-TIER WEB ARCHITECTURE ON AWS.

# SERVICES USED

            - Amazon VPC
            - Amazon EC2
            - Application Load Balancer
            - Amazon RDS (MySQL)
            - Route 53
            - AWS Certificate Manager (ACM)
            - NAT Gateway
            - Internet Gateway

# 1.CREATE A VPC.

# 2.CREATE 6 SUBNETS:
        2 subnets for web server
        2 subnets for App server
        2 subnets for Database

# 3.CREATE ROUTE TABLE:
        1.public route table: connect with internet gateway and 2 public subnets.
        2.private route table: create private route table for each subnet and map nategateway from each availability zone for high availability.
        3.No NAT for database: If required for database patching, Map natgateway to database route table.

# 4.CREATE 5 SECURITY GROUPS:
        1.Front-end Load Balancer
        2.Web Server
        3.Back-end Load Balancer
        4.App Server
        5.DB Server

# VPC COMPLETED

# 5.CREATE ROUTE 53(R53) HOSTED ZONE:
        1.Create a hosted zone for a domain name.
        2.Map R53 Nameserver with your domain service provider.

# 6.VALIDATE ACM WITH R53:
        1.Request a certificate for your domain name.
        2.Create a NAME record in R53 from ACM to validate your domain ownership.

# 7.CREATE RDS:
        1.Create a DB subnet group at least 2 subnets needed
        2.Create a MYSQL DB in a private subnet with DB-SG.

# 8.CREATE WEB SERVER EC2:
        Launch an Ec2 instance in the public subnet with webserver-SG

# 9.CREATE APP SERVER EC2:
        Launch an Ec2 instance in the private subnets with Appserver-SG

# 10.COMMAND TO LOGIN TO APP SERVER:
     ---bash
           vi logu.pem
           ssh -i <keypair>.pem ec2-user@<private-ip>

# 11.SETUP DATABASE:
     1. ---bash
            sudo yum install mysql -y
            mysql -h awsdbproject.c9so2iuucnat.ap-south-1.rds.amazonaws.com -P 3306 -u admin -p

     2.Provide queries from commands.sql file to create DB, Tables and insert data into the table.

# 12.SETUP APP SERVER:
       ---bash
       sudo yum install python3-pip -y
       pip3 install flask flask-mysql-connector flask-cors
       vi app.py
       nohup python3 app.py > output.log 2>&1 &
       cat.output.log
       curl http://10.0.173:5000/login

# 13.SETUP WEB SERVER:
      ---bash
      sudo yum install httpd -y
      sudo service httpd start
      cd/var/www/html
      touch index.html script.js

# 14.CREATE APPLICATION LOAD BALANCER:
      Create Backend target group for app server Ec2 with:
      port 5000
      Health check path:'/login'

      Create Backend load balancer in the public subnet with:
      Listner port:80
      Attach the target group

      Create Front end Target group for web server Ec2 with:
      port 80
      Health check point:'/'

      Create Frontend Load balancer in the public subnet with:
      Listner port:80
      Attach the target group

# 15.CONFIGURE ROUTE 53 TO LOAD BALANCER:
      Create an A record with alias pointing to the Front end load balancer.

# 16.ATTACH ACM CERTIFICATE TO LOAD BALANCER:

# CONCLUSION: SUCCESSFULLY IMPLEMENTED A SECURE AND SCALABLE APPLICATION USING AWS SERVICES.

