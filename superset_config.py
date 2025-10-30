import os

SQLALCHEMY_DATABASE_URI = (
    f"postgresql://{os.getenv('DATABASE_USER')}:{os.getenv('DATABASE_PASSWORD')}@"
    f"{os.getenv('DATABASE_HOST')}:{os.getenv('DATABASE_PORT')}/{os.getenv('DATABASE_DB')}"
)

SECRET_KEY = os.getenv("SUPERSET_SECRET_KEY", "f0n7c4x+qP9J2kL8YmO+GdR1kT9a7vWlXcZQfH3qB1g=")

CACHE_CONFIG = {
    "CACHE_TYPE": "RedisCache",
    "CACHE_DEFAULT_TIMEOUT": 300,
    "CACHE_KEY_PREFIX": "superset_",
    "CACHE_REDIS_HOST": os.getenv("REDIS_HOST", "superset_cache"),
    "CACHE_REDIS_PORT": os.getenv("REDIS_PORT", "6379"),
    "CACHE_REDIS_DB": 1,
}
