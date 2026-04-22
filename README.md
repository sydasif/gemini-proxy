# 🚀 Gemini Proxy

[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![LiteLLM](https://img.shields.io/badge/Powered%20by-LiteLLM-blueviolet?style=for-the-badge)](https://github.com/BerriAI/litellm)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

A high-performance [LiteLLM](https://github.com/BerriAI/litellm) proxy that seamlessly maps Claude model requests to Google's Gemini models. This allows you to use `claude-code` and other Anthropic-compatible tools while leveraging the power and cost-efficiency of Gemini under the hood.

---

## ✨ Features

- 🛠️ **Seamless Mapping**: Automatically translates Claude model names (Sonnet, Opus, Haiku) to Gemini equivalents.
- 🐳 **Docker Native**: Ready-to-use Docker environment for instant deployment.
- ⚙️ **Customizable**: Easily modify model mappings and settings via `config.yaml`.
- 🔐 **Secure**: Environment-based API key management.
- ⚡ **Lightweight**: Built on Python 3.12-slim and LiteLLM for minimal overhead.

---

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Docker Desktop](https://docs.docker.com/get-docker/) or Docker Engine
- [Docker Compose](https://docs.docker.com/compose/install/)
- A **Gemini API Key** from [Google AI Studio](https://aistudio.google.com/)

---

## 🚀 Quick Start

### 1. Clone & Enter
```bash
git clone <repository-url>
cd gemini-proxy
```

### 2. Configure Environment
```bash
cp .env.example .env
# Open .env and add your GEMINI_API_KEY
```

### 3. Deploy
```bash
docker compose up -d --build
```

The proxy is now running at `http://localhost:3455`.

---

## 🤖 Using with Claude Code

To redirect `claude-code` to your local Gemini proxy, update your `.claude/settings.json` file:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "http://127.0.0.1:3455",
    "ANTHROPIC_AUTH_TOKEN": "sk-dummy-token"
  }
}
```

> **Note**: `ANTHROPIC_AUTH_TOKEN` is required by the client but can be any string as the proxy uses your `GEMINI_API_KEY` internally.

---

## ⚙️ Configuration

Mappings are managed in `config.yaml`. This allows you to point specific Claude versions to your preferred Gemini models.

### Current Default Mappings:

| Claude Model (Request) | Gemini Model (Actual) |
| :--- | :--- |
| `claude-opus-4-7` | `gemini/gemma-4-31b-it` |
| `claude-sonnet-4-6` | `gemini/gemma-4-26b-a4b-it` |
| `claude-haiku-4-5-20251001` | `gemini/gemma-4-26b-a4b-it` |
| `gemini-3.1-flash-lite-preview` | `gemini/gemini-3.1-flash-lite-preview` |

To add a new mapping, edit `config.yaml`:

```yaml
  - model_name: claude-v1
    litellm_params:
      model: gemini/gemini-pro
      api_key: os.environ/GEMINI_API_KEY
```

---

## 🔧 Docker Customization

If you need to change the default port (e.g., due to a conflict), you can modify the `ports` section in `docker-compose.yml`:

```yaml
services:
  gemini-proxy:
    ...
    ports:
      - "8080:3455" # Maps port 8080 on your host to 3455 in the container
    ...
```

After changing the port, restart the proxy:

```bash
docker compose down
docker compose up -d
```

---

| Action | Command |
| :--- | :--- |
| **Start Proxy** | `docker compose up -d` |
| **Stop Proxy** | `docker compose down` |
| **View Logs** | `docker compose logs -f` |
| **Restart** | `docker compose restart` |

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details (or MIT if not provided).

---

<p align="center">Made with ❤️ for the AI community</p>
