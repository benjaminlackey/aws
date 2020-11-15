# Run with: sh setup_aws.sh

# Download and install Anaconda version of Python
wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh
bash Anaconda3-2020.07-Linux-x86_64.sh

# Append this line to .bashrc to prepend anaconda to $PATH
echo "" >> ~/.bashrc
echo "------------ Anaconda --------------" >> ~/.bashrc
echo "export PATH=/home/ubuntu/anaconda3/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

echo "------------------------------------------------------------"
echo "Check path and version of python:"
echo "------------------------------------------------------------"
echo $PATH
echo `which python`
echo `python --version`

# Create venv and source it
# ("-m venv" searches sys.path for a "venv.py" file, 
# then runs 'venv.py venv' as a python script.)
VENV_NAME="venv"
python -m venv $VENV_NAME
# The "." does the same thing as "source". "." is part of sh, "source" is from csh that was pulled into bash
# See: https://stackoverflow.com/questions/670191/getting-a-source-not-found-error-when-using-source-in-a-bash-script
. "$PWD/$VENV_NAME/bin/activate"

# Note: A shell is created when the script runs, then exits when the script is finished.
# The venv runs in this script's shell.
# You will have to reactivate the venv after running this script.
# See: 
# https://stackoverflow.com/questions/20391943/how-to-activate-python-virtual-environment-by-shell-script
# https://stackoverflow.com/questions/13122137/how-to-source-virtualenv-activate-in-a-bash-script

echo "------------------------------------------------------------"
echo "Verifying we are in the virtual environment:"
echo "------------------------------------------------------------"
echo $VIRTUAL_ENV
echo `which python`
echo `python --version`

echo "------------------------------------------------------------"
echo "Installing standard packages..."
echo "------------------------------------------------------------"
pip install jupyter
pip install matplotlib
pip install pandas

pip install scikit-learn

pip install torch torchvision torchtext
pip install torchsummary

# NLP course
pip install nltk
pip install spacy
python -m spacy download en_core_web_sm

# Install and setup nbextensions
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install
jupyter nbextensions_configurator enable

# Enable favorite nbextensions
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable toggle_all_line_numbers/main
jupyter nbextension enable snippets_menu/main

echo "------------------------------------------------------------"
echo "The following things are installed in $VENV_NAME:"
echo "------------------------------------------------------------"
echo `pip freeze`

echo "------------------------------------------------------------"
echo "To activate: source $VENV_NAME/bin/activate"
echo "------------------------------------------------------------"



# Other things:
# There are many versions of nvidia-smi. Try this:
# sudo apt install nvidia-utils-390