# DevOps Training Project

This project is designed to help you learn DevOps principles through hands-on experience. It's a simple web application with a basic CI/CD pipeline implemented using GitHub Actions.

## Project Structure

-   `src/index.html`: The main HTML file for the web application.
-   `src/app.js`: The JavaScript code for the web application.
-   `src/style.css`: The CSS styles for the web application.
-   `tests/app.test.js`: Unit tests for the JavaScript code.
-   `.github/workflows/ci.yml`: The GitHub Actions workflow definition.
-   `package.json`: The project's manifest file, containing dependencies and scripts.

## Running the Project Locally

1. Clone the repository: `git clone <repository-url>`
2. Navigate to the project directory: `cd devops-training`
3. Install dependencies: `npm install`
4. Open the `src/index.html` file in your browser.

## CI/CD Pipeline

The CI/CD pipeline is implemented using GitHub Actions and is defined in the `.github/workflows/ci.yml` file. It automatically runs whenever changes are pushed to the `main` branch or when a pull request is created against the `main` branch.

The pipeline consists of the following steps:

1. **Set up Node.js:** Uses the `actions/setup-node` action to set up the correct Node.js version.
2. **Install dependencies:** Uses `npm install` to install the project's dependencies.
3. **Run tests:** Uses `npm test` to run the Jest tests.

If all steps are successful, the pipeline will pass. If any step fails, the pipeline will fail, and you'll need to investigate and fix the issu.
