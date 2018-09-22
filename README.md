# Enable Threading on Windows for PyStan 2.18+

Simple instructions to enable multithreading on Windows with `clang-cl` and Microsoft Visual Studio C++ build tools 

Notice! These instructions need proper user privileges (administrative privileges) for installing Build Tools for Visual Studio 2017.

### 1. Get Build Tools for Visual Studio 2017.

Follow instructions found in https://wiki.python.org/moin/WindowsCompilers

Build Tools for Visual Studio 2017 https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2017

Install the defaults and restart computer

### 2. Get Anaconda or Miniconda distribution

Anaconda https://www.anaconda.com/download/#windows
Miniconda https://conda.io/miniconda.html

### 3. Create Conda virtual environment

Example uses Python 3.6, but feel free to use Python 3.7 instead. 

Minimum

    conda create -n stan_clang python=3.6 numpy cython clangdev -c conda-forge

Toolset I frequently use (JupyterLab + Excel tools + tools for ArviZ)

    conda create -n stan_clang python=3.6 numpy cython matplotlib scipy jupyter jupyterlab notebook ipython xarray netcdf4 openpyxl xlrd pandas clangdev -c conda-forge
    
To list all available environments

    conda env list

### 4. Activate environment `stan_clang`

    conda activate stan_clang
    
For older conda distributions use

    activate stan_clang

### 5. Install PyStan
	
Minimum
  
    pip install pystan

Install arviz for visualization

    pip install pystan arviz

### 6. Get files to enable clang

Clone `pystan_windows_threading`

    git clone https://github.com/ahartikainen/pystan_windows_threading
    cd pystan_windows_threading

Add clang-cl compiler option to `distutils.cfg`

    step_1_add_distutils_cfg.bat

Replace `_msvccompiler.py` & `ccompiler.py` with clang-cl enabled files

    step_2_enable_clangcl.bat
	
Done. Follow official instructions to enable multithreading on PyStan.

https://pystan.readthedocs.io/en/latest/threading_support.html

### Commands

Minimum workflow

    conda create -n stan_clang python=3.6 numpy cython clangdev -c conda-forge
    conda activate stan_clang
    pip install pystan
    git clone https://github.com/ahartikainen/pystan_windows_threading
    cd pystan_windows_threading
    step_1_add_distutils_cfg.bat
    step_2_enable_clangcl.bat


Suggested workflow

    conda create -n stan_clang python=3.6 numpy cython matplotlib scipy jupyter jupyterlab notebook ipython xarray netcdf4 openpyxl xlrd pandas clangdev -c conda-forge
    conda activate stan_clang
    pip install pystan arviz
    git clone https://github.com/ahartikainen/pystan_windows_threading
    cd pystan_windows_threading
    step_1_add_distutils_cfg.bat
    step_2_enable_clangcl.bat
