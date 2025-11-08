# DigiKala Spike Load Test

This project is designed to perform a **Spike Test** on a Digikala product page using **Locust**.

---

## Test Objective

In this Spike Test, we aim to evaluate:

- Whether the system is stable under a sudden surge of users (e.g., from 10 to 500).
- How long it takes for the website to recover after the initial spike.
- Whether requests fail or just slow down.

---

## Project Structure
digikala_load_test/
│
├── locustfile.py # Main Spike Test script
├── config/
│ └── product_config.py # Product configuration and task weight
├── reports/ # CSV reports output
└── README.md # This file

Navigate to the project folder:
cd digikala_load_test
Run the Spike Test and generate CSV reports:
python -m locust -f locustfile.py --host https://www.digikala.com --csv=reports/product_test

Open a browser and go to:
http://localhost:8089

Click Start Swarming.
Note: Number of users and Ramp-up fields in the UI will show zero, but the Spike will run automatically according to the SpikeShape class.

📊 Reports
After running the test, the following CSV files will be generated in the reports folder:
product_test_stats.csv → Summary statistics including response times and RPS
product_test_failures.csv → Failed requests
product_test_distribution.csv → Response time distribution

🔧 Notes
The time between requests is controlled by wait_time in Locust.
Task weight is configurable via TASK_WEIGHT.
Use Charts and Stats in the UI to observe real-time performance under load.

✨ Outcome
This project allows you to analyze the stability and performance of the Digikala product page under a Spike scenario, and provides complete CSV reports for documentation or further analysis.

