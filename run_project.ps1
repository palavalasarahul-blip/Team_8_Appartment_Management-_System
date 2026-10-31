# PowerShell Script to run Smart Apartment Management System (SAMS)
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "Starting Smart Apartment Management System (SAMS)" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan

# 1. Ensure DB and seed records are initialized
Write-Host "`n[1/3] Checking Database and Machine Learning Model..." -ForegroundColor Yellow
python -m backend.app.init_db

# 2. Start Backend API in a new PowerShell window
Write-Host "[2/3] Launching FastAPI Backend on http://127.0.0.1:8000 ..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "python -m uvicorn backend.app.main:app --host 127.0.0.1 --port 8000 --reload"

# 3. Start Frontend in a new PowerShell window
Write-Host "[3/3] Launching React Frontend on http://127.0.0.1:5173 ..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd frontend; npm run dev -- --host 127.0.0.1 --port 5173"

Write-Host "`nApplication is actively running!" -ForegroundColor Green
Write-Host "Web Application: http://localhost:5173" -ForegroundColor White
Write-Host "Swagger API Docs: http://localhost:8000/docs" -ForegroundColor White
Write-Host "===================================================" -ForegroundColor Cyan
