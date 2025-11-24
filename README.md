# Luhn Number Utilities

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Language](https://img.shields.io/badge/language-Cython-green)
![Status](https://img.shields.io/badge/status-Active-success)
![PRs](https://img.shields.io/badge/PRs-welcome-brightgreen)


## CI Results : 

[![Cython Build, Test, and Release](https://github.com/HenriqueDomiciano/Pyluhn/actions/workflows/ci-release.yml/badge.svg)](https://github.com/HenriqueDomiciano/Pyluhn/actions/workflows/ci-release.yml)

[![CI continuos workflow](https://github.com/HenriqueDomiciano/Pyluhn/actions/workflows/ci.yml/badge.svg)](https://github.com/HenriqueDomiciano/Pyluhn/actions/workflows/ci.yml)



A Cython-optimized implementation of the **Luhn algorithm**, widely used
to validate identification numbers like credit cards, IMEIs, and
national IDs.

This library provides:

-   ✔️ A `verify()` method to check if a number is Luhn-valid\
-   ✔️ A static method to compute check digits\
-   ✔️ Random Luhn-valid number generation\
-   ✔️ Faster computation thanks to Cython `cdef` optimizations

## 📦 Features

### ✔️ Luhn Verification

Check if a given number passes Luhn's checksum.

### ✔️ Check Digit Generator

Generate the correct final digit for any integer.

### ✔️ Random Valid Number Generator

Create random Luhn-valid sequences of any length.

## 📚 Installation & Build Steps (Cython)

### 1. Install dependencies

``` bash
pip install -r requirements.txt
```
 
### 2. Build the module

``` bash
python setup.py build_ext --inplace
```

### 3. Install the lib  
```bash
pip install .
```

### 4. For Linux or MACOS check the release with the wheel file 

After you expanded the .tar.gz file and get the whell for you os and run 

```bash
pip install <YOUR OS WHL>.whl
```

## 🔧 Code Overview

``` python
from libc.stdlib cimport rand

class Luhn:
    def __init__(self, digit):
        self.digit = digit

    def verify(self) -> bool:
        ...

    @staticmethod
    def calculate_luhn_number(number: int) -> int:
        ...

    @classmethod
    def random_number(cls, number_size: int) -> "Luhn":
        ...
```

## 📘 Usage Examples

### Validate a Luhn number

``` python
from pyluhn.pyluhn import Luhn
l = Luhn(79927398713)
print(l.verify())   # True
```

### Calculate a check digit

``` python
from pyluhn.pyluhn import Luhn
check = Luhn.calculate_luhn_number(7992739871)
print(check)   # 3
```

### Generate a random valid number

``` python
from pyluhn.pyluhn import Luhn
num = Luhn.random_number(10)
print(num.digit)
print(num.verify())   # True
```

## 🧠 How the Luhn Algorithm Works

1.  **Process digits:**

    -   Even indices → add digit directly\
    -   Odd indices → multiply by 2
        -   If result \> 9 → subtract 9

2.  **Sum all processed digits**

3.  **Compute the check digit**

```{=html}
<!-- -->
```
    check = (10 - (sum % 10)) % 10

4.  **A number is valid if**\
    the final digit equals the computed check digit.

## 📄 License

This project is licensed under the **MIT License**.

## 🙌 Contributing

Pull requests are welcome!
