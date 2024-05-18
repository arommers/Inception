<img src="https://i.imgur.com/HG66CCx.png?raw=true" alt="CODAM" style="max-width: 50%;">

# Inception

 This project serves as a method to learn how to use Docker and Docker Compose to deploy a multi-service web application. 
 By containerizing the key components of a WordPress site, we can ensure that each service is isolated, scalable, and easy to manage.    
 
 The key components are:

- [Nginx](https://nginx.org/en/docs/), a webserver:  
  Handles web traffic and serves static content.
- [MariaDB](https://mariadb.com/kb/en/documentation/) a relational database management system (RDBMS):  
  Provides the database backend for WordPress.
- [PHP-FPM](https://www.plesk.com/blog/various/php-fpm-the-future-of-php-handling/#:~:text=PHP%2DFPM%20is%20an%20efficient,in%20multi%2Duser%20PHP%20environments.), a FastCGI Process Manager:  
  Processes PHP scripts, facilitating dynamic content generation.

Through this project, we try to understand the principles of containerization and the benefits of using Docker in a development and production environment.
Docker Compose is used to define and manage the entire application stack, allowing us to manage all services with a singular commands.

---

### Docker Services and Configuration Files
To create our containerized WordPress environment, we need to configure and launch the three main services mentioned above. 
Each service has its own Dockerfile and configuration files. Ensuring each service is configured correctly is vital for the overall stability, security, and performance of the WordPress site.
Each component relies on the others, and any misconfiguration can cause issues that affect the entire system.
Simply put, if we don't configure mand attune all service correctly our dockerized environment won't run properly or not at all.

#### Nginx
Nginx is a high-performance web server and reverse proxy server.
Usually it handles incoming web traffic and serve static content, such as HTML, CSS, and JavaScript files.
However in this project we mostly use it as a forward proxy for dynamic content requests to the PHP-FPM service running WordPress.
The Nginx configuration file nginx.conf sets up the server to listen on port 443 for HTTPS traffic, ensuring secure communication.

#### MariaDB
MariaDB is an open-source relational database management system, which we use to store all the data for our WordPress site, including posts, user information, and metadata.
The database configuration is specified in the file 50-server.cnf. This configuration ensures that MariaDB runs with the necessary settings for our application.

#### WordPress
WordPress is a widely-used content management system (CMS) written in PHP. It allows us to build and manage our website content dynamically.
In our setup, WordPress uses [PHP-FPM (FastCGI Process Manager)](https://www.php.net/manual/en/install.fpm.php) to process PHP scripts efficiently.
The configuration file for PHP-FPM  ensures proper management of PHP processes.
The Dockerfile for WordPress specifies how to build the WordPress container, installing necessary dependencies and configuring the environment.
WordPress depends on the MariaDB service for its database backend to store and retrieve content dynamically.

---

### Key Concepts
#### Docker and Containerization
Docker: A platform that allows developers to package applications and their dependencies into lightweight containers. Each container runs as an isolated process in user space on the host operating system.
- Images: Read-only templates used to create containers.
- Containers: Instances of Docker images that run applications.
- Dockerfile: A script containing instructions to build a Docker image.
#### Docker Compose
Docker Compose: A tool for defining and running multi-container Docker applications. It uses a [YAML](https://www.redhat.com/en/topics/automation/what-is-yaml#:~:text=YAML%20is%20a%20human%2Dreadable,is%20for%20data%2C%20not%20documents.) file to configure the application’s services, networks, and volumes.
- Services: Containers that form the application.
- Networks: Allow communication between containers.
- Volumes: Persist data between container restarts.
#### Service Isolation and Management
- Isolation: Issues in one service do not affect others.
- Scalability: Services can be scaled independently.
- Consistency: The environment remains consistent across different stages (development, testing, production).
#### Nginx as a Reverse Proxy
Nginx: Used as a reverse proxy to handle incoming web requests, serving static files and forwarding dynamic requests to PHP-FPM.
- SSL/TLS: Securing communication using (self signed) certificates.
- Load Balancing: Distributing requests across multiple servers (optional in this project).
#### MariaDB as a Relational Database
MariaDB: Serves as the database backend for WordPress, storing all content and user information.
- SQL: Structured Query Language for managing databases.
- User Management: Creating users and granting permissions.
#### PHP-FPM for PHP Processing
- PHP-FPM (FastCGI Process Manager): Used to process PHP scripts efficiently, handling PHP requests and communicating with the web server.
#### Data Persistence
- Docker Volumes: Ensure that data is not lost when containers are stopped or removed. Volumes are mounted directories on the host machine that containers can use to read/write data.
