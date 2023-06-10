# Homebrew removed the support of adding options while compiling, so there isn't x11 or wx term availble anymore
# Here I'm going to remove the gnuplot installation from homebrew and compile it myslef and then relink

# remove the one from homebrew or this script
#if [[ ! -z $(brew list | grep gnuplot) ]]; then
#    if [[ ! -z $(brew list --pinned | grep gnuplot) ]]; then
#        brew unpin gnuplot
#        brew unlink gnuplot
#    fi
#    brew uninstall gnuplot
#fi
# install dependencies, though they are likely installed already
#brew install wxmac qt gd libcerf lua pango readline
# qt require c++11
export CXXFLAGS="-std=c++11  -Wimplicit-function-declaration"
# brew won't add libffi and qt into pkg_config
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig:/usr/local/opt/qt/lib/pkgconfig"

# obtain the lastest tarball from sourceforge
#url="https://sourceforge.net/projects/gnuplot/best_release.json"
#dl_url=$(curl -s $url | python -m json.tool | grep tar | cut -d'"' -f4 | tail -1)
#filename=$(basename $dl_url | cut -d'?' -f1)
#dir=$(echo $filename | sed 's/\.tar\.gz//g')

# download and untar
#curl -sLOJ $dl_url
#tar -zxvf $filename

#cd $dir
./configure --with-qt --with-wx=/usr/local/bin --with-x -Wimplicit-function-declaration
make -j 2 

#&& make install
#brew link gnuplot
## make brew upgrade ignore gnuplot, preventing customized build being overwritten
#brew pin gnuplot
#cd ..
#rm -rf $dir $filename