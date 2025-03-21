# HTTPX Toolkit Status Code Filtering Script

## Overview
This Bash script processes all `.txt` files in the same directory, runs `httpx-toolkit`, and filters URLs based on their HTTP status codes. The results are stored in categorized directories.

## Features
- **Filters URLs with HTTP 200 status** and saves them in `live-200-site/`.
- **Filters all URLs except those with HTTP 404 status** and saves them in `live-all-except-404/`.
- **Maintains the original filename** in the respective output directories.
- **Ensures results contain only URLs** (status codes are removed from output).

## Prerequisites
- Install [`httpx-toolkit`](https://github.com/projectdiscovery/httpx)
  ```bash
  go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
  ```

## Usage
1. Place all `.txt` files containing URLs in the same directory as the script.
2. Run the script:
   ```bash
   chmod +x Status-Filter.sh
   ./Status-Filter.sh
   ```
3. Processed results will be saved in:
   - `live-200-site/` → Contains URLs responding with HTTP 200.
   - `live-all-except-404/` → Contains all URLs except those returning HTTP 404.

## Example
**Input (`urls.txt`)**
```
http://example.com
http://test.com
http://nonexistent.com
```

**Output (`live-200-site/urls.txt`)**
```
http://example.com
```

**Output (`live-all-except-404/2-5xx-urls.txt`)**
```
http://example.com
http://test.com
```

## Notes
- The script automatically creates necessary directories.
- It processes all `.txt` files in the same directory.
- Ensure `httpx-toolkit` is properly installed before running the script.

