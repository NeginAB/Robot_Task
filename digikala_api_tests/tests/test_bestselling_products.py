import pytest
from utils.api_client import APIClient
from utils.schema_validator import validate_schema
from schemas.bestselling_schema import BESTSELLING_SCHEMA

client = APIClient("https://api.digikala.com/v1")

def test_bestselling_status_code():
    response = client.get("/categories/mobile-phone/search/?sort=bestselling")
    assert response.status_code == 200, f"Expected 200, got {response.status_code}"

def test_bestselling_schema():
    response = client.get("/categories/mobile-phone/search/?sort=4")

    if response.status_code != 200:
        pytest.skip(f"API not available (status {response.status_code})")

    data = response.json()
    validate_schema(data, BESTSELLING_SCHEMA)

