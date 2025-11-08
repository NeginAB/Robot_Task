# Digikala Robot Framework Automation

This project is a set of automated tests for **Digikala** website, implemented using **Robot Framework** and **SeleniumLibrary**.  
The test scenarios cover **user login, adding products to cart, and verifying products in the cart**.

---

## 🗂️ Project Structure
digikala_robot/
│
├─ resources/ # Resources and shared code
│ ├─ keywords/ # Custom keywords for tests
│ │ ├─ login_keywords.robot
│ │ └─ cart_keywords.robot
│ ├─ pages/ # Page Objects (if used)
│ └─ variables/ # Test data and variables
│ └─ login_test_data.robot
│
├─ testsuites/ # Test suites
│ ├─ login_tests.robot # User login tests
│ └─ cart_tests.robot # Cart and checkout tests
│
└─ results/ # Test execution results

## ⚙️ Prerequisites

- Python 3.8+
- Robot Framework
- SeleniumLibrary
- Chrome & ChromeDriver (compatible version)
- (Optional) Virtual Environment

### Install Dependencies
# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # macOS/Linux
venv\Scripts\activate     # Windows

# Install Robot Framework and SeleniumLibrary
pip install robotframework
pip install robotframework-seleniumlibrary

🚀 Running Tests
Run a single test suite:
bash
Copy code
robot --outputdir results testsuites/cart_tests.robot
robot --outputdir results testsuites/login_tests.robot
View results:
results/output.xml

results/log.html

results/report.html

🧩 Folder & File Explanation
resources/
keywords/: Custom keywords for login and cart operations.

variables/: Test data such as phone numbers and OTPs.

pages/: Page Objects (if implemented).

testsuites/
login_tests.robot: Positive and negative user login tests.

cart_tests.robot: Tests for adding products to cart and checkout.

🔑 Important Notes
Handle Hot Deals Modal in Test Setup handles pop-ups and overlays automatically.

Locators (XPath/CSS) are designed to be resilient to minor UI changes.

Use Should Contain instead of Should Be Equal for product text to avoid failures if minor product details change.

Clicks on buttons are executed first with Click Element and fall back to Execute Javascript if overlays or modals block interaction.

📌 Advanced Tips
To make tests more stable, handle or close overlays before performing any click.

Test data can be loaded from external CSV/Excel/JSON files to make tests more dynamic.

Timeouts and waits are configured to handle AJAX or React-based UI rendering.







