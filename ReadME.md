# Chord Classification

A Full Stack Application for classifying Musical Chords using ML models. Follow these steps to set up the project on your local machine.

## Getting Started

### Prerequisites

Make sure you have the following installed on your system:

- Python 3.8 or higher
- Git
- Virtualenv (optional, for virtual environments)

---

### 1. Fork and Clone the Repository

1. Fork this repository to your GitHub account.
2. Clone the repository to your local machine:

```bash
git clone https://github.com/<your-username>/ChordClassification.git
```

### 2. Navigate to the Project Directory

```bash
cd ChordClassification
```

### 3. Create and Activate a Virtual Environment

1.  Create a virtual environment named venv:

    ```bash
    python -m venv venv
    ```

2.  Activate the virtual environment:

    - For Windows:

    ```bash
        venv\Scripts\activate
    ```

    - For macOS/Linux:

    ```bash
        source venv/bin/activate
    ```

### 4. Install Dependencies

```bash
pip install -r requirements.txt
```

### 5. Run Application

```bash
uvicorn backend.app.main:app --reload
```

### 6. Access the Application

Once the server is running, you can access the application in your browser or API client:

- Base URL: http://127.0.0.1:8000

- Swagger UI: http://127.0.0.1:8000/docs
