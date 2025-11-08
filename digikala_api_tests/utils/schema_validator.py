def validate_schema(data, schema):
    for key, expected_type in schema.items():
        assert key in data, f"Missing key: {key}"

        if isinstance(expected_type, dict):
            validate_schema(data[key], expected_type)
        else:
            assert isinstance(data[key], expected_type), \
                f"Key '{key}' should be {expected_type}, got {type(data[key])}"
