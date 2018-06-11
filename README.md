# Templates

common js, jsx, ts, tsx templates

# Install

In your project root, run:

```
git clone https://github.com/acro5piano/templates .templates
echo .templates >> .gitignore
```

# Usage

Super simple.

```
cp .templates/assets/sfc-materialui.jsx src/components/MyComponent.jsx
```

Pro tip: interactively select using `fzf`

```bash
cp `find .templates` src/components/MyComponent.jsx
```

You can just run the above command with `run.sh`:

```bash
./.templates/run.sh src/components/MyComponent.jsx
```

# Development

After checkout the repo, run

```
touch .dev
```

With `.dev` file Templates recognize dev env.

# TODO

- Add more templates
- auto-rewrite
