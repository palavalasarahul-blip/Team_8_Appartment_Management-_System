@echo off
echo ===================================================
echo Starting Smart Apartment Management System (SAMS)
echo ===================================================

echo [1/3] Verifying database and ML model...
python -m backend.app.init_db

echo [2/3] Launching FastAPI Backend on http://localhost:8000 ...
start "SAMS Backend Server" cmd /k "python -m uvicorn backend.app.main:app --host 127.0.0.1 --port 8000 --reload"

echo [3/3] Launching React Vite Frontend on http://localhost:5173 ...
cd frontend
start "SAMS Frontend App" cmd /k "npm run dev -- --host 127.0.0.1 --port 5173"

echo ===================================================
echo SAMS Web Application is now running!
echo Frontend: http://localhost:5173
echo Backend API Docs: http://localhost:8000/docs
echo ===================================================
pause
