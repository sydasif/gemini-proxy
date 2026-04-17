# Gemini Proxy

A LiteLLM proxy that maps Claude-style model names to Gemini models, allowing for easy integration with tools expecting Claude but using Gemini under the hood.

## Features

- Simple Docker-based deployment.
- Model mapping via `config.yaml`.
- Environment-based API key management.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- A Gemini API Key from [Google AI Studio](https://aistudio.google.com/)

## Quick Start

1. **Clone the repository:**

```bash
 git clone <repository-url>
 cd gemini-proxy
```

2. **Configure environment:**

```bash
  cp .env.example .env
  # Edit .env and add your GEMINI_API_KEY
```

3. **Build and start the proxy:**

```bash
   docker compose up -d --build
```

The proxy will be available at `http://localhost:3455`.

## Configuration

The `config.yaml` file defines the model mapping. You can add or modify models here.

Example mapping:

- `claude-opus-4-7` -> `gemini/gemma-4-31b-it`
- `claude-sonnet-4-6` -> `gemini/gemma-4-31b-it`
- `claude-haiku-4-5-20251001` -> `gemini/gemma-4-26b-a4b-it`

## Using with Claude Code

To use this proxy with Claude Code, add the following to your `.claude/settings.json` file:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "http://127.0.0.1:3455",
    "ANTHROPIC_AUTH_TOKEN": "sk-xxx"
  }
}
```
Replace `sk-xxx` with a dummy token if the proxy doesn't require one, or your actual token if it does.
