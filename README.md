# How to Create, Install, and Use a Custom Python Package

This guide will walk you through the process of creating a simple Python package, installing it, and using it in your projects.

## Step 1: Create the Package Structure

1. Create a new directory for your project (e.g., `my_project`).

```bash
mkdir my_project
cd my_project
```

2. Inside this directory, create the following structure:

```
my_project/
│
├── mypackage/
│   ├── __init__.py
│   └── example.py
│
└── setup.py
```

- **`mypackage/`**: This is your custom package.
- **`__init__.py`**: This file makes `mypackage` a Python package.
- **`example.py`**: This is where you'll define some functionality for your package.
- **`setup.py`**: The file that defines how your package is built and installed.

### Example File Contents:

- **`mypackage/example.py`**:

```python
# example.py

def reverse_string(s):
    """Reverses the input string."""
    return s[::-1]
```

- **`mypackage/__init__.py`**:

```python
# __init__.py

# Import the reverse_string function to make it accessible from the package level
from .example import reverse_string

# Optional: Add package metadata
__version__ = '0.1'
__author__ = 'Your Name'
```

- **`setup.py`**:

```python
# setup.py

from setuptools import setup, find_packages

setup(
    name='mypackage',
    version='0.1',
    description='A simple example package',
    author='Your Name',
    author_email='your.email@example.com',
    packages=find_packages(),
)
```

## Step 2: Install the Package Locally

Now that you have the package structure, you can install it locally in "editable" mode. This allows you to modify the package and immediately use the updated version.

1. In the root directory (`my_project/`), run the following command:

```bash
pip install -e .
```

- The `-e` option installs the package in editable mode.
- The `.` refers to the current directory, where `setup.py` is located.

You should see output indicating that the package is installed successfully.

## Step 3: Use the Package

Now that the package is installed, you can use it in any Python script or project.

1. Create a new Python file (e.g., `main.py`) in the same directory:

```bash
touch main.py
```

2. Add the following code to `main.py`:

```python
# main.py

from mypackage import reverse_string

def main():
    test_string = "Hello, World!"
    print(f"Original string: {test_string}")
    print(f"Reversed string: {reverse_string(test_string)}")

if __name__ == "__main__":
    main()
```

3. Run the script:

```bash
python main.py
```

You should see output similar to:

```
Original string: Hello, World!
Reversed string: !dlroW ,olleH
```

## Step 4: (Optional) Uninstall the Package

If you want to uninstall your package, you can use the following command:

```bash
pip uninstall mypackage
```

This will remove the package from your environment.

## Summary

- **Create a custom package**: Define your package structure with `__init__.py` and your modules.
- **Install the package**: Use `pip install -e .` to install it in editable mode.
- **Use the package**: Import and use your package functions in any Python script.
