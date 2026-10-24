# Deploying Student Management System

This project can be deployed as a Docker-based Java web app on a platform that supports Docker (for example Railway or another container host).

## Before deploying

1. Push the full project to a GitHub repository.
2. Create a MySQL database on a hosting provider. Do not use your laptop's `localhost` database for a public deployment.
3. Configure the app's environment variables on the hosting platform:
   - `DB_URL`: JDBC URL for the hosted database, for example `jdbc:mysql://HOST:PORT/student_db?serverTimezone=UTC`
   - `DB_USER`: database username
   - `DB_PASSWORD`: database password (set this in the hosting dashboard, not in Git)
4. Make sure `database.sql` has been run against that hosted database.
5. Create a new service from your GitHub repository and select Dockerfile-based deployment. The Dockerfile in this repository builds the WAR and runs it on Tomcat 9.
6. Once the deployment is successful, generate or open the public domain provided by your hosting platform.

The app is deployed at the domain root because the WAR is copied as `ROOT.war`.

## Notes

- The app uses `javax.servlet`, so this container uses Tomcat 9 rather than Tomcat 10+.
- A hosting provider may charge for the application container and/or database. Check the current pricing before deploying.
- Never commit database credentials or other secrets.
- This is a learning project; add authentication, CSRF protection, and production-grade validation/error handling before real-world use.
