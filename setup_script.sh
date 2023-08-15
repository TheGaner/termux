#!/data/data/com.termux/files/usr/bin/bash

# Update and upgrade packages
pkg update && pkg upgrade -y

# Install essential packages
pkg install -y python git clang fftw libzmq libjpeg-turbo libpng pkg-config

# Install Oh My Zsh for a stylish terminal experience
pkg install -y zsh
chsh -s zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install custom Zsh theme and plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Install Powerlevel10k Zsh theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Install Node.js and Yarn for Jupyter extensions
pkg install -y nodejs yarn

# Install Jupyter Notebook and extensions
pip install jupyter
jupyter nbextension enable --py widgetsnbextension

# Install TensorFlow and Keras
pip install tensorflow keras

# Install PyTorch
pip install torch torchvision torchaudio

# Install scikit-learn
pip install scikit-learn

# Install matplotlib
pip install matplotlib

# Install OpenCV
pkg install -y libjpeg-turbo libtiff libwebp libpng libzip
pip install opencv-python

# Install neofetch for system information display
pkg install -y neofetch

# Set up Neovim for coding
pkg install -y neovim
git clone https://github.com/junegunn/vim-plug.git ~/.config/nvim/autoload
curl https://raw.githubusercontent.com/0x11-gpt3/dotfiles/main/init.vim -o ~/.config/nvim/init.vim
nvim +PlugInstall +qall

# Clone termux-packages repository for additional packages
git clone https://github.com/termux/termux-packages

# Change directory to termux-packages
cd termux-packages

# Install required packages for deep learning
pkg install -y libllvm openblas opencl-headers

# Compile and install numpy and scipy with OpenBLAS support
./scripts/setup-ubuntu.sh
./scripts/setup-package.sh numpy
./scripts/setup-package.sh scipy

# Install Jupyter Notebook (optional, if you want it in Termux)
pkg install -y jupyter-notebook

# Clean up
cd ..
rm -rf termux-packages

# Display a fancy welcome message
neofetch

# Done! Termux is set up for AI development with a stylish environment.
echo "Termux is now ready for AI development with a stylish environment!"