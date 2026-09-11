# INIKO

INIKO is an E-commerce platform for sourcing and selling quality unbranded products.

[Model Design](docs/data-model.md)\
[Architecture](docs/architecture.md)

## Technical stack
| Name       | Version |
|------------|---------|
| Python     | 3.14    |
| Django     | 6.1     |
| PostgreSQL | 18.6    |



## Start the project
```bash
make install 
make migrate 
make runserver
```

## Project Structure

```text
iniko/
├── pyproject.toml
├── .python-version
├── manage.py
├── uv.lock
├── .gitignore
├── README.md
│
├── config/
│
├── apps/
│   └── accounts/
│
└── docs/
    ├── business-rules.md
    ├── domain.md
    ├── domain-model.md
    └── architecture.md
```

## Documentation
- [Business Rules](docs/business-rules.md)
- [Domain](docs/domain.md)
- [Model Design](docs/data-model.md)
- [Architecture](docs/architecture.md)