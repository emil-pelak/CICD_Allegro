#!/bin/bash
set -e

# Wyczyść poprzednie raporty
rm -rf robot_reports/*

# Utwórz virtualenv (jeśli nie istnieje)
python3 -m venv venv
source venv/bin/activate

# Zainstaluj zależności
pip install --upgrade pip
pip install -r requirements.txt

# Uruchom testy i zapisz raporty do robot_reports
robot -d robot_reports tests/

# Otwórz raport w pełnym ekranie w Firefox
google-chrome --start-fullscreen "file://$(pwd)/robot_reports/report.html" &