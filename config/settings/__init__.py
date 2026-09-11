from decouple import config

DJANGO_ENV = config("DJANGO_ENV").lower().strip()

match DJANGO_ENV:
    case "dev":
        from .dev import *
    case "test":
        from .test import *
    case "prod":
        from .prod import *
    case _:
        raise ValueError(f"Invalid DJANGO_ENV: {DJANGO_ENV!r}")
