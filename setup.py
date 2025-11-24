from setuptools import setup, Extension
from Cython.Build import cythonize

extensions = [
    Extension(
        "pyluhn.pyluhn", # This is the full module path (package_name.module_name)
        ["./pyluhn/pyluhn.pyx"], # Path to your source file relative to setup.py
    )
]

setup(
    name="pyluhn",
    version="0.1.1",
    packages=["pyluhn"],
    ext_modules=cythonize(extensions, compiler_directives={'language_level': 3}),
    
    # Specify build dependencies
    setup_requires=['setuptools', 'wheel', 'Cython'],
)
