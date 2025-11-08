# Digikala API Automated Test Suite

A lightweight and modular **API test automation project** for [Digikala](https://www.digikala.com) public APIs.  
This project uses **Python + Pytest** to automatically test the structure and availability of key API endpoints  
and generate detailed **HTML test reports**.

---

## Project Overview

The goal of this project is to:
- Validate the **availability and structure** of Digikala’s open API endpoints.
- Automatically verify that API responses match an expected **JSON schema**.
- Produce detailed **test reports** in HTML format.
- Provide a scalable structure for adding new API tests easily.

---

## 🧱 Folder Structure

digikala_api_tests/
│
├── tests/
│ ├── test_bestselling_products.py # Tests for bestselling products endpoint
│ └── init.py
│
├── schemas/
│ ├── bestselling_schema.py # Expected JSON schema definition
│ └── init.py
│
├── utils/
│ ├── api_client.py # Wrapper around requests library
│ ├── schema_validator.py # Recursive schema validator
│ └── init.py
│
├── reports/ # HTML reports are generated here
│
├── pytest.ini
└── README.md

Running the Tests
Run All Tests:
pytest -v

Run with HTML Report:
pytest --html=reports/report.html --self-contained-html

Run a Single Test File:
pytest tests/test_bestselling_products.py -v

Example: Bestselling Products Test

The test hits this public Digikala endpoint:

https://api.digikala.com/v1/categories/mobile-phone/search/?sort=4

Tests Included

Status Code Test
Ensures the API responds with HTTP 200.
Schema Validation Test
Validates that response JSON contains the correct keys and data types.

HTML Test Reports

After running:
pytest --html=reports/report.html --self-contained-html
A report like this is generated:
reports/report.
You can open it in your browser to view:
Test results (passed / failed / skipped)
Assertions
Error messages
Execution time per test