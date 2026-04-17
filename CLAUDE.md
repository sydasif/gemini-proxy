# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build and Run

- **Initial Build and Start:** `docker compose up -d --build`
- **Stop Proxy:** `docker compose down`
- **View Logs:** `docker compose logs -f`
- **Restart Proxy:** `docker compose restart`

## Architecture

- **Core:** The project is a LiteLLM proxy deployment that translates Claude-style model requests into Gemini API calls.
- **Configuration:**
  - `config.yaml`: Defines the model mapping (e.g., mapping `claude-sonnet-4-6` to a specific Gemini model).
  - `.env`: Stores the `GEMINI_API_KEY` required for authentication with Google AI Studio.
- **Deployment:** Deployed as a single Docker container listening on port `3455`.
- **Flow:** Request (`model_name`) -> LiteLLM Proxy (`config.yaml` mapping) -> Gemini API.
