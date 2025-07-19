#!/bin/bash
set -e

# Utwórz virtualenv
python3 -m venv venv
source venv/bin/activate

# Zainstaluj zależności
pip install --upgrade pip
pip install -r requirements.txt

# Uruchom testy
robot -d robot_reports tests/

# Otwórz raport (np. log.html)
xdg-open tests/log.html
xdg-open tests/report.html
xdg-open tests/output.xml