# Pygfx & ImGui - Template

A small python template for using [pygfx](https://github.com/pygfx/pygfx) and [imgui_bundle](https://github.com/pthom/imgui_bundle) together.

<img src="https://github.com/user-attachments/assets/d9d977f0-d377-4397-955b-ad84881c4851" width="800" />

## How to use

Clone the repository:

```bash
git clone https://github.com/mori2003/pygfx-imgui-template
```

Create and enter a virtual environment:

```bash
python -m venv .venv
# or
uv venv

source .venv/bin/activate
```

Install the dependencies using [uv](https://docs.astral.sh/uv/), [pip](https://pip.pypa.io/en/stable/) or [poetry](https://python-poetry.org/):

```bash
uv sync
# or
pip install .
# or
poetry install
```

Run the template:
```bash
python src/main.py
```
