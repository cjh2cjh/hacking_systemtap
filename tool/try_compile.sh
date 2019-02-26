g++ -std=c++11 -DHAVE_CONFIG_H -I. -I/root/open-source/systemtap-4.0 -DBINDIR='"/root/open-source-build/systemtap-4.0/install/bin"' \
    -DSYSCONFDIR='"/root/open-source-build/systemtap-4.0/install/etc"' \
    -DPKGDATADIR='"/root/open-source-build/systemtap-4.0/install/share/systemtap"' \
    -DPKGLIBDIR='"/root/open-source-build/systemtap-4.0/install/libexec/systemtap"' \
    -DLOCALEDIR='"/root/open-source-build/systemtap-4.0/install/share/locale"' \
    -DDOCDIR='"/root/open-source-build/systemtap-4.0/install/share/doc/systemtap"' \
    -DPYEXECDIR='"/root/open-source-build/systemtap-4.0/install/lib64/python2.7/site-packages"' \
    -DPY3EXECDIR='""' \
    -I/root/open-source/systemtap-4.0/includes -I./includes/sys \
    -DSTAP_SDT_V2 \
    -Wall -Wextra -Werror \
    -fstack-protector-all -D_FORTIFY_SOURCE=2 -g -O2 \
    -MT stap-main.o -MD -MP -MF .deps/stap-main.Tpo \
    -c -o stap-main.o -E \
    /root/open-source/systemtap-4.0/main.cxx
