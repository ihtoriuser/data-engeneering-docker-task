# Apache Superset Dashboard Setup

This project provides a Docker Compose setup to run Apache Superset and automatically import a pre-configured dashboard.

## Prerequisites

*   **Docker:** Make sure you have [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.
*   **Superset Dashboard ZIP:** You need an exported ZIP file of your Superset dashboard (exported from the old Superset instance via `Settings` -> `Export dashboards`). This ZIP should contain the dashboard, its charts, datasets, and database configurations.

## Setup Instructions

1.  **Clone the Repository:**
    ```bash
    git clone <your-repository-url>
    cd <your-repo-directory>
    ```

2.  **Prepare `init.sql` (Optional but Recommended for Initialization):**
    *   If you have initial database setup scripts (e.g., creating specific schemas, users, or loading initial data for Superset's metadata database), place them in a file named `init.sql` in the project root directory.
    *   This file will be automatically executed the **first time** the `superset_db` container starts, allowing you to pre-configure the metadata database. If you don't need this, you can leave the file empty or omit it, but ensure the `docker-compose.yml` volume mount `./init.sql:/docker-entrypoint-initdb.d/init.sql` is present or adjust the compose file accordingly.

3.  **Prepare Your Dashboard ZIP File:**
    *   Ensure your exported Superset dashboard ZIP file is named `dashboards.zip`.
    *   **Important Structure:** The ZIP file **must** contain the folders `charts`, `dashboards`, `databases`, `datasets`, and the `metadata.yaml` file **directly** in its root. It should **not** have any subfolders wrapping these contents.
        ```
        dashboards.zip
        ├── charts/
        ├── dashboards/
        ├── databases/
        ├── datasets/
        └── metadata.yaml
        ```
        If your ZIP has a subfolder (e.g., `dashboards/` inside `dashboards/`), you need to extract its contents and re-zip them correctly.

4.  **Configure Environment Variables:**
    *   Open the `.env` file in the project root.
    *   Modify the following variables to match your **target** PostgreSQL database settings (the one Superset will connect to for metadata, not necessarily the data source for your dashboard):
        *   `POSTGRES_DB`: Name of the database used by Superset for its metadata.
        *   `POSTGRES_USER`: Username for the Superset metadata database.
        *   `POSTGRES_PASSWORD`: Password for the Superset metadata database user.
        *   `ADMIN_USERNAME`: Username for the initial Superset admin user.
        *   `ADMIN_EMAIL`: Email for the initial Superset admin user.
        *   `ADMIN_PASSWORD`: Password for the initial Superset admin user.
        *   `SUPERSET_SECRET_KEY`: Secret key for Flask (keep it secure).

5.  **Configure Database Connection in the ZIP:**
    *   **Extract** your `dashboards.zip` file.
    *   Navigate to the `databases` folder inside the extracted content.
    *   Open the YAML file corresponding to the database used by your dashboard (e.g., `SOLO.yaml`).
    *   Locate the `sqlalchemy_uri` field.
    *   **Modify** the URI to match the connection details of the **data source** for your dashboard. The host should likely be `superset_db` (as defined by the Docker Compose service name), and the username, password, and database name should match the details of your **actual data source** (the database containing the tables for your charts).
        *   **Example:** Change `postgresql://user:XXXXXX@db:5432/mydata` to `postgresql://my_user:my_password@superset_db:5432/my_actual_db_name`.
    *   **Re-zip** the *entire* extracted folder structure (with the corrected YAML file) back into a file named `dashboards.zip`.

6.  **Run the Application:**
    *   Place the correctly structured and configured `dashboards.zip` file into the project root directory (where `docker-compose.yml` is located).
    *   Open a terminal in the project directory.
    *   Run the following command to build and start the services:
        ```bash
        docker-compose up --build
        ```
    *   The application will start, initialize the database (running `init.sql` if present), create the admin user, and attempt to import the dashboard from `dashboards.zip`. The import might fail due to known issues with CLI import in Superset 3.1.0, but the application will continue to run.

7.  **Access Superset:**
    *   Open your web browser and navigate to `http://localhost:8088`.
    *   Log in using the credentials specified in the `.env` file (`ADMIN_USERNAME` and `ADMIN_PASSWORD`).
    *   If the automatic import failed, manually import the dashboard:
        *   Go to `Settings` -> `Import dashboards`.
        *   Select your `dashboards.zip` file.
    *   Your dashboard should now be available.

## Troubleshooting

*   **Import Errors:** If the dashboard doesn't appear or charts show errors after the automatic import attempt, manually import it via the UI as described above.
*   **Database Connection Errors:** If charts show errors like "could not translate host name 'db' to address" or "password authentication failed", double-check the `sqlalchemy_uri` in the database YAML file inside your `dashboards.zip` and ensure it matches the target data source details and the Docker Compose service name (`superset_db`).

## Notes

*   This setup uses Superset 3.1.0.
*   The `superset_db` container runs PostgreSQL 17.
*   The `superset_cache` container runs Redis 7.
*   Automatic import via CLI might not work reliably for all dashboard structures in Superset 3.1.0 due to permission checking issues within the import process.