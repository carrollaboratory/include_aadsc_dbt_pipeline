import logging
import sys

# Define log format
LOG_FORMAT = "%(levelname)s - %(message)s"

# Configure logging once when the package is imported
logging.basicConfig(
    level=logging.INFO,  # Default level
    format=LOG_FORMAT,
    handlers=[
        logging.StreamHandler(sys.stdout),  # Print to console
        logging.FileHandler("data/aadsc/output/query_duckdb.log")  # Log to file
    ]
)

# Create a default logger for the package
logger = logging.getLogger("include_pipeline")
logger.debug("Logging is set up.")
