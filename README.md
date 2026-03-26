# 🚀 EventHive: Inter-College Event Management System

**EventHive** is a centralized, full-stack platform designed to streamline event discovery and registration across college campuses. It bridges the gap between organizers (Colleges) and participants (Students) through a secure, role-based architecture.

---

## 🌟 Key Features

### 🔐 Multi-Role Authentication
* **Student Access:** Personalized dashboard to discover, search, and register for events.
* **College Access:** Dedicated portal to create, edit, and manage event listings with image upload capabilities.
* **Custom Admin Command Center:** A bespoke administration panel for platform-wide monitoring, user management, and feedback analysis (bypassing the default Django admin for a unified UI).

### 🛡️ Enhanced Security
* **OTP Verification:** Custom 6-digit email OTP system powered by **Gmail SMTP** and **Django Cache** to verify user authenticity during signup.
* **CSRF Protection:** Secure API communication using Cross-Site Request Forgery tokens.
* **Password Hashing:** Industry-standard protection using Django’s `make_password` (PBKDF2).

### 🤖 Intelligent Features
* **AI Chatbot:** Integrated assistant to help users navigate the platform and answer queries about events.
* **Dynamic Search & Filter:** Real-time event filtering by category (Hackathon, Sports, Cultural) and search-by-college functionality.

---

## 🛠️ Tech Stack

| Category | Technology |
| :--- | :--- |
| **Frontend** | HTML5, CSS3 (Custom Dark Theme), JavaScript (ES6+), Bootstrap 5 |
| **Backend** | Python 3.x, Django 5.2, Django REST Framework (DRF) |
| **Database** | MySQL |
| **Caching/OTP** | Django Cache Framework |
| **Integrations** | Gmail SMTP API, Django-Allauth (Social Login) |

---

## 📁 Project Structure

```plaintext
EventHive/
├── back-end/               # Django Project Root
│   ├── tn_college_events/  # Core Settings
│   ├── events/             # Main App (Models, Views, Serializers)
│   ├── chatbot/            # AI Chatbot Logic
│   └── templates/          # HTML Templates (Signup, Login, Dashboards)
├── media/                  # Uploaded Event Posters
├── static/                 # CSS, Images, and JS files
└── requirements.txt        # Project Dependencies
