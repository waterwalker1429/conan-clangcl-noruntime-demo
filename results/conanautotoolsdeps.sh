script_folder="/root/.conan2/p/b/mypkgaaf899e5d4183/b/build-debug/conan"
echo "echo Restoring environment" > "$script_folder/deactivate_conanautotoolsdeps.sh"
for v in CPPFLAGS LIBS LDFLAGS CXXFLAGS CFLAGS
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanautotoolsdeps.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanautotoolsdeps.sh"
    fi
done


export CPPFLAGS="$CPPFLAGS -I/root/.conan2/p/b/depen3cb7e3c0d68dd/p/include"
export LIBS="$LIBS -ldependency"
export LDFLAGS="$LDFLAGS -L/root/.conan2/p/b/depen3cb7e3c0d68dd/p/lib"
export CXXFLAGS="$CXXFLAGS"
export CFLAGS="$CFLAGS"